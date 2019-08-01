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
    case getLatestDetailRyujume(ryujumeId: String)
    case getLikeRyujumes
    case getLikeDetailRyujume(ryujumeId: String)
    
    func getPath() -> String {
        switch self {
        case .getLatestRyujumes:
            return "/main/latestInfo"
        case .getLatestDetailRyujume(let ryujumeId):
            return "/main/latestInfo/\(ryujumeId)"
        case .getLikeRyujumes:
            return "/main/likeInfo"
        case . getLikeDetailRyujume(let ryujumeId):
            return "/main/likeInfo/\(ryujumeId)"
        }
    }
}
