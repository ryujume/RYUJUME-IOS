//
//  RyujumeObject.swift
//  RyujumeApp
//
//  Created by baby1234 on 16/09/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

import Realm
import RealmSwift

class MyRyujumeModel: Object, Decodable {
    dynamic var userName: String = ""
    dynamic var identityImg: String?
    dynamic var phoneNumber: String?
    dynamic var email: String?
    dynamic var simpleIntroduce: String?
    let career = List<MyCareer>()
    let academicBackground = List<MyAcademicBackground>()
    let prize = List<MyPrize>()
    let foreignLanguage = List<MyForeignLanguage>()
    let link = List<String>()

    convenience init(career: [MyCareer], academicBackground: [MyAcademicBackground], prize: [MyPrize], foreignLanguage: [MyForeignLanguage], link: [String]) {
        self.init()
        career.forEach { self.career.append($0) }
        academicBackground.forEach { self.academicBackground.append($0) }
        prize.forEach { self.prize.append($0) }
        foreignLanguage.forEach { self.foreignLanguage.append($0) }
        link.forEach { self.link.append($0) }
    }

    override static func primaryKey() -> String? {
      return "userName"
    }

    enum CodingKeys: String, CodingKey {
        case userName
        case identityImg = "profileImg"
        case phoneNumber
        case email
        case simpleIntroduce = "simpleInfo"
        case career
        case academicBackground = "academicBack"
        case prize
        case foreignLanguage = "language"
        case link
    }
}

class MyCareer: Object, Decodable {
    dynamic var isWorking: Bool = false
    dynamic var company: String = ""
    dynamic var startDate: String = ""
    dynamic var endDate: String = ""

    enum CodingKeys: String, CodingKey {
        case isWorking = "isServed"
        case company = "companyName"
        case startDate
        case endDate
    }
}

class MyAcademicBackground: Object, Decodable {
    dynamic var isAttending: Bool = false
    dynamic var school: String = ""
    dynamic var startDate: String = ""
    dynamic var endDate: String = ""

    enum CodingKeys: String, CodingKey {
        case isAttending = "isInSchool"
        case school = "schoolName"
        case startDate
        case endDate
    }
}

class MyPrize: Object, Decodable {
    dynamic var prize: String = ""
    dynamic var prizedDate: String = ""

    enum CodingKeys: String, CodingKey {
        case prize = "title"
        case prizedDate = "prizeDate"
    }
}

class MyForeignLanguage: Object, Decodable {
    dynamic var language: String = ""
    dynamic var level: String = ""

    enum CodingKeys: String, CodingKey {
        case language = "languageName"
        case level
    }
}
