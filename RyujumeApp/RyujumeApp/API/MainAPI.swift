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
    case getlikeRyujumes
    case getlikeDetailRyujume(ryujumeId: String)
    
    func getPath() -> String {
        switch self {
        case .getLatestRyujumes:
            return "/main/LatestInfo"
        case .getLatestDetailRyujume(let ryujumeId):
            return "/main/LatestInfo/\(ryujumeId)"
        case .getlikeRyujumes:
            return "/main/LikeInfo"
        case . getlikeDetailRyujume(let ryujumeId):
            return "/main/LikeInfo/\(ryujumeId)"
        }
    }
}
