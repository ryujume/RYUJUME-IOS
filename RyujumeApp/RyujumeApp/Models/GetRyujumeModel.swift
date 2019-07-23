//
//  GetRyujumeModel.swift
//  RyujumeApp
//
//  Created by baby1234 on 22/07/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

struct GetRyujumeModel: Codable {
    let userName: String
    let identityImg: String
    let phoneNumber: String
    let email: String
    let simpleIntroduce: String
    let career: [Career]
    let academicBackground: [AcademicBackground]
    let prize: [Prize]
    let foreignLanguage: [ForeignLanguage]
    let link: [String]
    
    struct Career: Codable {
        let isWorking: Bool
        let company: String
        let startDate: Int
        let endDate: Int
        
        enum CodingKeys: String, CodingKey {
            case isWorking = "isServed"
            case company = "companyName"
            case startDate
            case endDate
        }
    }
    
    struct AcademicBackground: Codable {
        let isAttending: Bool
        let school: String
        let startDate: Int
        let endDate: Int
        
        enum CodingKeys: String, CodingKey {
            case isAttending = "isInSchool"
            case school = "schoolName"
            case startDate
            case endDate
        }
    }
    
    struct Prize: Codable {
        let prize: String
        let prizedDate: Int
        
        enum CodingKeys: String, CodingKey {
            case prize = "title"
            case prizedDate = "prizeDate"
        }
    }
    
    struct ForeignLanguage: Codable {
        let language: String
        let level: String
        
        enum CodingKeys: String, CodingKey {
            case language = "languageName"
            case level
        }
    }
    
    
    enum CodingKeys: String, CodingKey {
        case userName
        case identityImg
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
