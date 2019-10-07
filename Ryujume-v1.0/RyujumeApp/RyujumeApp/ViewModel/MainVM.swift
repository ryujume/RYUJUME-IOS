//
//  MainVM.swift
//  RyujumeApp
//
//  Created by baby1234 on 06/09/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

final class MainVM: ViewModelType {

    private let disposeBag = DisposeBag()
    private let api = MainAPI()

    struct Input {
        let likeRyujumeTaps: Signal<Int>
        let latestRyujumeTaps: Signal<Int>
        let selectedIndex: Driver<IndexPath>
    }

    struct Output {
        let simpleRyujumes: Driver<[SimpleRyujumesModel]>
        let detailRyujumeID: Driver<String>
    }

    func transform(input: MainVM.Input) -> MainVM.Output {
        let simpleRyujumes = BehaviorRelay<[SimpleRyujumesModel]>(value: [])

        input.likeRyujumeTaps.asObservable().subscribe { [weak self] (_) in
            guard let strongSelf = self else { return }
            strongSelf.api.getLikeInfo().subscribe({ (event) in
                guard case let element?? = event.element else { return }
                simpleRyujumes.accept(strongSelf.filterThesimpleRyujumes(simpleRyujumes: element))
            }).disposed(by: strongSelf.disposeBag)
        }.disposed(by: disposeBag)

        input.latestRyujumeTaps.asObservable().subscribe { [weak self] (_) in
            guard let strongSelf = self else { return }
            strongSelf.api.getLatestInfo().subscribe({ (event) in
                guard case let element?? = event.element else { return }
                simpleRyujumes.accept(strongSelf.filterThesimpleRyujumes(simpleRyujumes: element))
            }).disposed(by: strongSelf.disposeBag)
        }.disposed(by: disposeBag)

        let detailRyujumeId = Driver.combineLatest(simpleRyujumes.asDriver(), input.selectedIndex) {($0, $1)}
            .flatMapLatest { (simpleRyujumes, indexPath) -> Driver<String> in
                return Driver.just(simpleRyujumes[indexPath.row].ryujumeId)
            }
        return Output(simpleRyujumes: simpleRyujumes.asDriver(onErrorJustReturn: []), detailRyujumeID: detailRyujumeId)
    }

    private func filterThesimpleRyujumes(simpleRyujumes: [SimpleRyujumesModel]) -> [SimpleRyujumesModel] {
        var result = simpleRyujumes
        for index in 0...simpleRyujumes.count - 1 where simpleRyujumes[index].simpleIntroduce == "" { result.removeFirst() }
        return result
    }
}
