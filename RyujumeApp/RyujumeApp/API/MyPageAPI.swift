//
//  MyPageAPI.swift
//  RyujumeApp
//
//  Created by baby1234 on 23/07/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

public enum MyPageAPI: API {
    case postWriteRyujume
    case postUpdateIdentityImg
    case putUpdateRyujume
    case getLikedRyujumes
    case getLikedDetailRyujume(ryujumeId: String)
    case getMyRyujume
    
    func getPath() -> String {
        switch self {
        case .postWriteRyujume:
            return "/myPage/writeInfo"
        case .postUpdateIdentityImg:
            return "/myPage/updateProfileImg"
        case .putUpdateRyujume:
            return "/myPage/updateInfo"
        case .getLikedRyujumes:
            return "/myPage/readLikeInfo"
        case .getLikedDetailRyujume(let ryujumeId):
            return "/myPage/readLikeInfo\(ryujumeId)"
        case .getMyRyujume:
            return "/myPage/readMyInfo"
        }
    }
}
