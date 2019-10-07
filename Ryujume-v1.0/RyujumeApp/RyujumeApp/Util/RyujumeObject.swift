//
//  RyujumeObject.swift
//  RyujumeApp
//
//  Created by baby1234 on 16/09/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

import RealmSwift

class RyujumeObject: Object {
    @objc dynamic var userName: String = ""
    @objc dynamic var identityImg: String = ""
    @objc dynamic var phoneNumber: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var simpleIntroduce: String = ""
    @objc dynamic var career: [CareerObject] = []
    @objc dynamic var academicBackground: [AcademicBackgroundObject] = []
    @objc dynamic var prize: [PrizeObject] = []
    @objc dynamic var foreignLanguage: [ForeignLanguageObject] = []
    @objc dynamic var link: [String] = []
}

class CareerObject: Object {
    @objc dynamic var isWorking: Bool = false
    @objc dynamic var company: String = ""
    @objc dynamic var startDate: Int = 0
    @objc dynamic var endDate: Int = 0
}

class AcademicBackgroundObject: Object {
    @objc dynamic var isAttending: Bool = false
    @objc dynamic var school: String = ""
    @objc dynamic var startDate: Int = 0
    @objc dynamic var endDate: Int = 0
}

class PrizeObject: Object {
    @objc dynamic var prize: String = ""
    @objc dynamic var prizedDate: Int = 0
}

class ForeignLanguageObject: Object {
    @objc dynamic var language: String = ""
    @objc dynamic var level: String = ""
}
