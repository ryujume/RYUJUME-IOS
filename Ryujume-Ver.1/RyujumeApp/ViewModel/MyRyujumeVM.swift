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
import RxRealm
import RealmSwift

final class MyRyujumeVM: ViewModelType {
    typealias MyOptionalInfo = ([MyCareer]?, [MyAcademicBackground]?, [MyPrize]?, [MyForeignLanguage]?, [String]?)

    private let disposeBag = DisposeBag()
    private let api = MyPageAPI()

    struct Input {
        let logoutTaps: Signal<Void>
        let saveTaps: Signal<Void>
        let getRyujume: Signal<Void>
        let phoneNumber: Driver<String?>
        let email: Driver<String?>
        let simpleIntroduce: Driver<String?>
        let identityImg: Driver<String?>
        let career: Driver<[MyCareer]?>
        let academicBackground: Driver<[MyAcademicBackground]?>
        let prize: Driver<[MyPrize]?>
        let foriegnLanguage: Driver<[MyForeignLanguage]?>
        let link: Driver<[String]?>
    }

    struct Output {
        let goLoginVC: Signal<Bool>
        let filterResult: Driver<Result>
        let saveResult: Driver<Result>
        let userName: Driver<String?>
        let phoneNumber: Driver<String?>
        let email: Driver<String?>
        let simpleIntroduce: Driver<String?>
        let identityImg: Driver<String?>
        let career: Driver<[MyCareer]?>
        let academicBackground: Driver<[MyAcademicBackground]?>
        let prize: Driver<[MyPrize]?>
        let foriegnLanguage: Driver<[MyForeignLanguage]?>
        let link: Driver<[String]?>
    }

    func transform(input: MyRyujumeVM.Input) -> MyRyujumeVM.Output {

        let realm = try! Realm()

        let goLoginVC = BehaviorRelay<Bool>(value: false)
        let userName = BehaviorRelay<String?>(value: nil)
        let phoneNumber = BehaviorRelay<String?>(value: nil)
        let email = BehaviorRelay<String?>(value: nil)
        let simpleIntroduce = BehaviorRelay<String?>(value: nil)
        let identityImg = BehaviorRelay<String?>(value: nil)
        let career = BehaviorRelay<[MyCareer]?>(value: nil)
        let academicBackground = BehaviorRelay<[MyAcademicBackground]?>(value: nil)
        let prize = BehaviorRelay<[MyPrize]?>(value: nil)
        let foreignLanguage = BehaviorRelay<[MyForeignLanguage]?>(value: nil)
        let link = BehaviorRelay<[String]?>(value: nil)

        let requiredInfomation = Driver.combineLatest(input.phoneNumber, input.email, input.simpleIntroduce) {($0, $1, $2)}
        let optionalInfomation = Driver.combineLatest(input.career, input.academicBackground, input.prize, input.foriegnLanguage, input.link) {($0, $1, $2, $3, $4)}
        let allInfomation = Driver.combineLatest(requiredInfomation, optionalInfomation) {($0, $1)}

        let filterResult = input.saveTaps.withLatestFrom(requiredInfomation)
            .map({ (element) -> Result in
                if element.0 != nil, element.1 != nil, element.2 != nil {
                    return .success
                } else {
                    return .failure
                }
            })
            .filter { $0 == .success }
            .withLatestFrom(optionalInfomation)
            .map { [weak self] (element) -> Result in
                guard let strongSelf = self else { return .failure}
                if strongSelf.filterOptionalInfomation(element: element) == .success {
                    return .success
                } else {
                    return .failure
                }
            }.asDriver(onErrorJustReturn: .failure)

        let saveResult = filterResult.filter { $0 == .success }
            .withLatestFrom(input.identityImg)
            .flatMapLatest { [weak self] (img) -> Driver<Result> in
                guard let img = img else { return Driver.just(.success) }
                return self?.api.postUpdateProfileImg(identityImg: img).asDriver(onErrorJustReturn: .failure) ?? Driver.just(.failure)
            }.filter { $0 == .success }
            .withLatestFrom(allInfomation)
            .flatMapLatest { [weak self] (event) -> Driver<Result> in
                guard let strongSelf = self else { return Driver.just(.failure) }

                let ryujume = MyRyujumeModel(career: event.1.0 ?? [],
                                             academicBackground: event.1.1 ?? [],
                                             prize: event.1.2 ?? [],
                                             foreignLanguage: event.1.3 ?? [],
                                             link: event.1.4 ?? [])
                ryujume.phoneNumber = event.0.0
                ryujume.email = event.0.1
                ryujume.simpleIntroduce = event.0.2

                return strongSelf.api.putUpdateInfo(ryujume: ryujume).map { (response) -> Result in
                    guard let myRyujume = response else { return .failure }
                    try! realm.write { realm.add(myRyujume, update: .modified) }
                    return .success
                }.asDriver(onErrorJustReturn: .failure)
            }

        input.logoutTaps.asObservable().subscribe {
            Token.token = nil
            try! realm.write { realm.deleteAll() }
            goLoginVC.accept(true)
        }.disposed(by: disposeBag)

        input.getRyujume.asObservable().subscribe { (_) in
            guard let myRyujume = realm.object(ofType: MyRyujumeModel.self, forPrimaryKey: Token.userName) else { return }
            userName.accept(myRyujume.userName)
            phoneNumber.accept(myRyujume.phoneNumber)
            email.accept(myRyujume.email)
            simpleIntroduce.accept(myRyujume.simpleIntroduce)
            identityImg.accept(myRyujume.identityImg)
            career.accept(myRyujume.career.toArray())
            academicBackground.accept(myRyujume.academicBackground.toArray())
            prize.accept(myRyujume.prize.toArray())
            foreignLanguage.accept(myRyujume.foreignLanguage.toArray())
            link.accept(myRyujume.link.toArray())
        }.disposed(by: disposeBag)

        return Output(goLoginVC: goLoginVC.asSignal(onErrorJustReturn: false),
                      filterResult: filterResult,
                      saveResult: saveResult,
                      userName: userName.asDriver(),
                      phoneNumber: phoneNumber.asDriver(),
                      email: email.asDriver(),
                      simpleIntroduce: simpleIntroduce.asDriver(),
                      identityImg: identityImg.asDriver(),
                      career: career.asDriver(),
                      academicBackground: academicBackground.asDriver(),
                      prize: prize.asDriver(),
                      foriegnLanguage: foreignLanguage.asDriver(),
                      link: link.asDriver())
    }

    private func filterOptionalInfomation(element: MyOptionalInfo) -> Result {
        var result: Result = .failure

        if let career = element.0 {
            career.forEach {
                if $0.company.isEmpty {
                    result = .failure
                    return
                } else {
                    result = .success
                }
            }
        }
        if let academicBackground = element.1, result == .success {
            academicBackground.forEach {
                if $0.school.isEmpty {
                    result = .failure
                    return
                } else {
                    result = .success
                }
            }
        }
        if let prize = element.2, result == .success {
            prize.forEach {
                if $0.prize.isEmpty {
                    result = .failure
                    return
                } else {
                    result = .success
                }
            }
        }
        if let foreignLanguage = element.3, result == .success {
            foreignLanguage.forEach {
                if $0.language.isEmpty {
                    result = .failure
                    return
                } else {
                    result = .success
                }
            }
        }
        if let link = element.4, result == .success {
            link.forEach {
                if $0.isEmpty {
                    result = .failure
                    return
                } else {
                    result = .success
                }
            }
        }

        return result
    }

}
