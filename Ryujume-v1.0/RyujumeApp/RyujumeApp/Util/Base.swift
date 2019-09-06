//
//  Base.swift
//  RyujumeApp
//
//  Created by baby1234 on 27/08/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

struct Token {
    static var token: String? {
        get {
            return UserDefaults.standard.string(forKey: "Token")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "Token")
        }
    }
}
