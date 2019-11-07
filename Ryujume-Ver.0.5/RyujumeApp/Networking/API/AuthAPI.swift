//
//  AuthAPI.swift
//  RyujumeApp
//
//  Created by baby1234 on 23/07/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

public enum AuthAPI: API {
    case postRegister
    case postLogin
    
    func getPath() -> String {
        switch self {
        case .postRegister:
            return "/auth/register"
        case .postLogin:
            return "/auth/login"
        }
    }
    
}
