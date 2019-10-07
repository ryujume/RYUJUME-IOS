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

final class LoginVM: ViewModelType {

    private let api = AuthAPI()

    struct Input {
        let userID: Driver<String>
        let userPW: Driver<String>
        let loginTaps: Signal<Void>
    }

    struct Output {
        let result: Driver<NetworkingResult>
        let infoCheck: Driver<Bool>
    }

    func transform(input: LoginVM.Input) -> LoginVM.Output {
        let info = Driver.combineLatest(input.userID, input.userPW) {($0, $1)}

        let infoCheck = input.loginTaps.asObservable().withLatestFrom(info)
            .flatMapLatest { (userID, userPW) -> Observable<Bool> in
                if userID.count > 3 && userPW.count > 3 { return Observable.just(true) }
                return Observable.just(false)
            }.asDriver(onErrorJustReturn: false)

        let result = input.loginTaps.asObservable().withLatestFrom(info)
            .flatMapLatest { [weak self] (userID, userPW) -> Observable<NetworkingResult> in
                guard let strongSelf = self else { return Observable.just(.failure)}
                return strongSelf.api.postLogin(userID: userID, userPW: userPW).map({ (loginModel) -> NetworkingResult in
                    guard let loginModel = loginModel else { return .failure }
                    Token.token = loginModel.token
                    return .success
                })
            }.asDriver(onErrorJustReturn: .failure)
        
        return Output(result: result, infoCheck: infoCheck)
    }
}
