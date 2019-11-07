//
//  MainAPI.swift
//  RyujumeApp
//
//  Created by baby1234 on 23/07/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

public enum MainAPI: API {
    case getLatestRyujumes
    case getLikeRyujumes
    case getLDetailRyujume(ryujumeId: String)
    case postLikePress
    
    func getPath() -> String {
        switch self {
        case .getLatestRyujumes:
            return "/main/latestInfo"
        case .getLikeRyujumes:
            return "/main/likeInfo"
        case . getLDetailRyujume(let ryujumeId):
            return "/main/detail/\(ryujumeId)"
        case .postLikePress:
            return "/main/likePress"
        }
    }
}
