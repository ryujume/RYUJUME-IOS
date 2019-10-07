//
//  MyRyujumeVM.swift
//  RyujumeApp
//
//  Created by baby1234 on 06/09/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa
import RealmSwift

final class MyRyujumeVM: ViewModelType {

    private let disposeBag = DisposeBag()
    private let api = MyPageAPI()

    struct Input {
        let logoutTaps: Signal<Void>
        let saveTaps: Signal<Void>
        let phoneNumber: Driver<String>
        let email: Driver<String>
        let simpleIntroduce: Driver<String>
        let identityImg: Driver<String>
        let career: Driver<[Career]>
        let academicBackground: Driver<[AcademicBackground]>
        let prize: Driver<[Prize]>
        let foriegnLanguage: Driver<[ForeignLanguage]>
        let link: Driver<[String]>
    }

    struct Output {
        let goLoginVC: Signal<Bool>
        let saveResult: Driver<SaveResult>
        let filterResult: Driver<FilterResult>
        let userName: Driver<String>
        let phoneNumber: Driver<String>
        let email: Driver<String>
        let simpleIntroduce: Driver<String>
        let identityImg: Driver<String>
        let career: Driver<[Career]>
        let academicBackground: Driver<[AcademicBackground]>
        let prize: Driver<[Prize]>
        let foriegnLanguage: Driver<[ForeignLanguage]>
        let link: Driver<[String]>
    }

    func transform(input: MyRyujumeVM.Input) -> MyRyujumeVM.Output {
        let goLoginVC = BehaviorRelay<Bool>(value: false)
        let saveResult = BehaviorRelay<NetworkingResult>(value: .failure)

        let requiredInformation = Driver.combineLatest(input.phoneNumber, input.email, input.simpleIntroduce) {($0, $1, $2)}

        input.logoutTaps.asObservable().subscribe { (_) in
            Token.token = nil
            goLoginVC.accept(true)
        }.disposed(by: disposeBag)



        return Output(goLoginVC: goLoginVC.asSignal(onErrorJustReturn: false),
                      userName: ,
                      phoneNumber: ,
                      email: ,
                      identityImg: ,
                      simpleIntroduce: ,
                      career: ,
                      academicBackground: ,
                      prize: ,
                      foriegnLanguage: ,
                      link: )
    }

    private func bindToRealm() {
        let realm = try! Realm()
        var ryujume = RyujumeObject()

        ryujume.
    }

    private func bindToRyujumeModel() {

    }
}
