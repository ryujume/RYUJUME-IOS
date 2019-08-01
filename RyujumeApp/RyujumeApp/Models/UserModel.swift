//
//  UserModel.swift
//  RyujumeApp
//
//  Created by baby1234 on 30/07/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

struct UserModel {
    static var _id: String?
    static var _pw: String?
    static var _name: String?
    
    static var id: String? {
        get {
            _id = UserDefaults.standard.string(forKey: "Id")
            return _id
        }
        
        set(newId) {
            UserDefaults.standard.setValue(newId, forKey: "Id")
            _id = newId
        }
    }
    
    static var pw: String? {
        get {
            _pw = UserDefaults.standard.string(forKey: "Pw")
            return _pw
        }
        
        set(newPw) {
            UserDefaults.standard.setValue(newPw, forKey: "Pw")
            _pw = newPw
        }
    }
    
    static var name: String? {
        get {
            _name = UserDefaults.standard.string(forKey: "Token")
            return _name
        }
        
        set(newName) {
            UserDefaults.standard.setValue(newName, forKey: "Name")
            _name = newName
        }
    }
    
    static func remove() {
        id = nil
        pw = nil
        name = nil
    }
    
}
