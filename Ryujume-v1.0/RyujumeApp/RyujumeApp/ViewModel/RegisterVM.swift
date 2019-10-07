//
//  RegisterVM.swift
//  RyujumeApp
//
//  Created by baby1234 on 06/09/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

final class RegisterVM: ViewModelType {
    private let api = AuthAPI()

    struct Input {
        let userID: Driver<String>
        let userPW: Driver<String>
        let userName: Driver<String>
        let registerTaps: Signal<Void>
    }

    struct Output {
        let result: Driver<NetworkingResult>
        let infoCheck: Driver<Bool>
    }

    func transform(input: RegisterVM.Input) -> RegisterVM.Output {
        let info = Driver.combineLatest(input.userID, input.userPW, input.userName) {($0, $1, $2)}

        let infoCheck = input.registerTaps.asObservable().withLatestFrom(info)
            .flatMapLatest { (userID, userPW, userName) -> Observable<Bool> in
                if userID.count > 3 && userPW.count > 3 && userName.count > 3 { return Observable.just(true) }
                return Observable.just(false)
            }.asDriver(onErrorJustReturn: false)

        let result = input.registerTaps.asObservable().withLatestFrom(info)
            .flatMapLatest { [weak self] (userID, userPW, userName) -> Observable<NetworkingResult> in
                guard let strongSelf = self else { return Observable.just(.failure)}
                return strongSelf.api.postRegister(userID: userID, userPW: userPW, userName: userName)
            }.asDriver(onErrorJustReturn: .failure)
        return Output(result: result, infoCheck: infoCheck)
    }
}
