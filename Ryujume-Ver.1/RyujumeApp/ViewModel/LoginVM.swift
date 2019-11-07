//
//  LoginVM.swift
//  RyujumeApp
//
//  Created by baby1234 on 06/09/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa
import RealmSwift

final class LoginVM: ViewModelType {

    private let api = AuthAPI()
    private let disposeBag = DisposeBag()

    struct Input {
        let userID: Driver<String>
        let userPW: Driver<String>
        let loginTaps: Signal<Void>
    }

    struct Output {
        let result: Driver<Result>
        let infoCheck: Driver<Result>
    }

    func transform(input: LoginVM.Input) -> LoginVM.Output {
        let info = Driver.combineLatest(input.userID, input.userPW) {($0, $1)}

        let infoCheck = input.loginTaps.asObservable().withLatestFrom(info)
            .flatMapLatest { (userID, userPW) -> Observable<Result> in
                if userID.count > 3 && userPW.count > 3 { return Observable.just(.success) }
                return Observable.just(.failure)
        }.asDriver(onErrorJustReturn: .failure)

        let result = input.loginTaps.asObservable().withLatestFrom(info)
            .flatMapLatest { [weak self] (userID, userPW) -> Observable<Result> in
                guard let strongSelf = self else { return Observable.just(.failure)}
                return strongSelf.api.postLogin(userID: userID, userPW: userPW).map({ (loginModel) -> Result in
                    guard let loginModel = loginModel else { return .failure }
                    Token.token = loginModel.token
                    return .success
                })
            }.asDriver(onErrorJustReturn: .failure)

        result.filter {$0 == .success}.asObservable().subscribe { [weak self] (_) in
            guard let strongSelf = self else { return }
            MyPageAPI().getReadMyInfo().asObservable().subscribe { (event) in
                guard let element = event.element, let myRyujume = element else { return }
                Token.userName = myRyujume.userName
                let realm = try! Realm()
                try! realm.write { realm.add(myRyujume) }
            }.disposed(by: strongSelf.disposeBag)
        }.disposed(by: disposeBag)

        return Output(result: result, infoCheck: infoCheck)
    }
}
