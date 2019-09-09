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
    struct Input {
        let id: Driver<String>
        let pw: Driver<String>
        let loginTaps: Signal<Void>
    }
    
    struct Output {
        let result: Driver<NetworkingResult>
        let infoCheck: Driver<Bool>
    }
    
    func transform(input: LoginVM.Input) -> LoginVM.Output {
        let info = Driver.combineLatest(input.id, input.pw) {($0,$1)}
        
        let infoCheck = input.loginTaps.asObservable().withLatestFrom(info)
            .flatMapLatest { (id, pw) -> Observable<Bool> in
                if id.count > 3 && pw.count > 3 {
                    return Observable.just(true)
                }
                return Observable.just(false)
            }.asDriver(onErrorJustReturn: false)
        
        let result = input.loginTaps.asObservable().withLatestFrom(info)
            .flatMapLatest { (info) -> Observable<NetworkingResult> in
                let (id,pw) = info
                return AuthAPI().postLogin(id: id, pw: pw).map({ (loginModel) -> NetworkingResult in
                    guard let loginModel = loginModel else {
                    return .failure
                    }
                    Token.token = loginModel.token
                    return .success
                })
            }.asDriver(onErrorJustReturn: .failure)
        
        return Output(result: result, infoCheck: infoCheck)
    }
}
