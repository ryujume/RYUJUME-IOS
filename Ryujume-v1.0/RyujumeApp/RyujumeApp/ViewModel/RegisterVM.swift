//
//  RegisterVM.swift
//  RyujumeApp
//
//  Created by baby1234 on 06/09/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

import RxCocoa
import RxSwift

final class RegisterVM: ViewModelType {
    
    struct input {
        let id: Driver<String>
        let pw: Driver<String>
        let name: Driver<String>
        let registerTaps: Signal<Void>
    }
    
    struct output {
        let registerResult: Driver<NetworkingResult>
        let registerInfoCheck: Driver<Bool>
    }
    
    func transform(input: RegisterVM.input) -> RegisterVM.output {
        let info = Driver.combineLatest(input.id, input.pw, input.name) {($0,$1,$2)}
        
        let infoCheck = input.registerTaps.asObservable().withLatestFrom(info)
            .flatMapLatest { (id, pw, name) -> Observable<Bool> in
                if id.count > 3 && pw.count > 3 && name.count > 3 {
                    return Observable.just(true)
                }
                return Observable.just(false)
            }.asDriver(onErrorJustReturn: false)
        
        let result = input.registerTaps.asObservable().withLatestFrom(info)
            .flatMapLatest { (info) -> Observable<NetworkingResult> in
                let (id,pw,name) = info
                return AuthAPI().postRegister(userName: name, id: id, pw: pw)
            }.asDriver(onErrorJustReturn: .failure)
        
        
        return output(registerResult: result, registerInfoCheck: infoCheck)
    }
}
