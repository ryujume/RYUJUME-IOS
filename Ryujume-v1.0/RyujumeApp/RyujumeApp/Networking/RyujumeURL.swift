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
    case getDetail(ryujumeId: String)
    
    func getPath() -> String {
        let baseURL = "http://54.180.81.160:3000/api"
        
        switch self {
        case .postRegister:
            return baseURL + "/auth/register"
        case .postLogin:
            return baseURL + "/auth/login"
        case .postUpdateProfileImg:
            return baseURL + "/myPage/updateProfileImg"
        case .putUpdateInfo:
            return baseURL + "/myPage/updateInfo"
        case .getReadLikeInfo:
            return baseURL + "/myPage/readLikeInfo"
        case .getReadMyInfo:
            return baseURL + "/myPage/readMyInfo"
        case .getLatestInfo:
            return baseURL + "/main/latestInfo"
        case .getLikeInfo:
            return baseURL + "/main/likeInfo"
        case .postLikePress:
            return baseURL + "/main/likePress"
        case .getDetail(let ryujumeId):
            return baseURL + "/main/detail/\(ryujumeId)"
        }
    }
}
