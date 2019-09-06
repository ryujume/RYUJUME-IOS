//
//  API.swift
//  RyujumeApp
//
//  Created by baby1234 on 26/08/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

public enum RyujumeURL {
    case postRegister
    case postLogin
    case postUpdateProfileImg
    case putUpdateInfo
    case getReadLikeInfo
    case getReadMyInfo
    case getLatestInfo
    case getLikeInfo
    case postLikePress
    case  getDetail(ryujumeId: String)
    
    func getPath() -> String {
        switch self {
        case .postRegister:
            return "/auth/register"
        case .postLogin:
            return "/auth/login"
        case .postUpdateProfileImg:
            return "/myPage/updateProfileImg"
        case .putUpdateInfo:
            return "/myPage/updateInfo"
        case .getReadLikeInfo:
            return "/myPage/readLikeInfo"
        case .getReadMyInfo:
            return "/myPage/readMyInfo"
        case .getLatestInfo:
            return "/main/latestInfo"
        case .getLikeInfo:
            return "/main/likeInfo"
        case .postLikePress:
            return "/main/likePress"
        case .getDetail(let ryujumeId):
            return "/main/detail/\(ryujumeId)"
        }
    }
}
