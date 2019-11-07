//
//  GetSimpleRyujumesModel.swift
//  RyujumeApp
//
//  Created by baby1234 on 22/07/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

struct SimpleRyujumesModel: Codable {
    let userName: String
    let ryujumeId: String
    let simpleIntroduce: String
    let likeCount: Int
    
    enum CodingKeys: String, CodingKey {
        case userName
        case ryujumeId = "_id"
        case simpleIntroduce = "simpleInfo"
        case likeCount = "likeNumber"
    }
}
