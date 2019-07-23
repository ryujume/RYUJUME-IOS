//
//  Like.swift
//  RyujumeApp
//
//  Created by baby1234 on 22/07/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

struct LikeModel: Codable {
    let ryuId: String
    let isLiked: Bool
    
    enum CodingKeys: String, CodingKey {
        case ryuId = "_id"
        case isLiked = "likeStatus"
    }
}
