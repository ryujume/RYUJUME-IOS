//
//  PutRujumeModel.swift
//  RyujumeApp
//
//  Created by baby1234 on 22/07/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

struct WriteRyujumeModel: Codable {
    let phoneNumber: String
    let email: String
    let simpleIntroduce: String
    let career: [Career]?
    let academicBackground: [AcademicBackground]?
    let prize: [Prize]?
    let foreignLanguage: [ForeignLanguage]?
    let link: [String]?

    enum CodingKeys: String, CodingKey {
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
