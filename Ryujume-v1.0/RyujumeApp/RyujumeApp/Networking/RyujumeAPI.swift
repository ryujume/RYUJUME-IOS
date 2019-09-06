//
//  RyujumeApi.swift
//  RyujumeApp
//
//  Created by baby1234 on 27/08/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class AuthAPI: AuthAPIProvider {
    let httpClient = HTTPClient()
    
    func postLogin(id: String, pw: String) -> Observable<LoginModel?> {
        let params = ["id" : id, "pw" : pw]
        
        return httpClient.post(url: RyujumeURL.postLogin.getPath(), params: params)
            .map({ data -> LoginModel? in
                guard let data = data, let response = try? JSONDecoder().decode(LoginModel.self, from: data) else { return nil }
                return response
            })
    }
    
    func postRegister(userName: String, id: String, pw: String) -> Observable<Bool> {
        let params = ["userName" : userName, "id" : id, "pw" : pw]
        
        return httpClient.post(url: RyujumeURL.postRegister.getPath(), params: params)
            .map({ (data) -> Bool in
                guard data != nil else { return false }
                return true
            })
    }
    
}

class MyPageAPI: MyPageAPIProvider {
    let httpClient = HTTPClient()
    
    func postUpdateProfileImg(identityImg: String) -> Observable<Bool> {
        let params = ["profileImg" : identityImg]
        
        return httpClient.post(url: RyujumeURL.postUpdateProfileImg.getPath(), params: params)
            .map({ (data) -> Bool in
                guard data != nil else { return false }
                return true
            })
    }
    
    func putUpdateInfo(phoneNumber: String, email: String, simpleIntroduce: String, career: [Career], academicBackground: [AcademicBackground], prize: [Prize], foreignLanguage: [ForeignLanguage], link: [String]) -> Observable<RyujumeModel?> {
        let params: [String : Any] = ["phoneNumber" : phoneNumber, "email" : email, "simpleInfo" : simpleIntroduce, "career" : career, "academicBack" : academicBackground, "prize" : prize, "language" : foreignLanguage, "link" : link]
        
        return httpClient.put(url: RyujumeURL.putUpdateInfo.getPath(), params: params)
            .map({ (data) -> RyujumeModel? in
                guard let data = data, let response = try? JSONDecoder().decode(RyujumeModel.self, from: data) else { return nil }
                return response
            })
    }
    
    func getReadLikeInfo() -> Observable<[SimpleRyujumesModel]?> {
        return httpClient.get(url: RyujumeURL.getLikeInfo.getPath())
            .map({ (data) -> [SimpleRyujumesModel]? in
                guard let data = data, let response = try? JSONDecoder().decode([SimpleRyujumesModel].self, from: data) else { return nil }
                return response
            })
    }
    
    func getReadMyInfo() -> Observable<RyujumeModel?> {
        return httpClient.get(url: RyujumeURL.getReadMyInfo.getPath())
            .map({ (data) -> RyujumeModel? in
                guard let data = data, let response = try? JSONDecoder().decode(RyujumeModel.self, from: data) else { return nil }
                return response
            })
    }
}

class MainAPI: MainAPIProvider {
    let httpClient = HTTPClient()
    
    func getLatestInfo() -> Observable<[SimpleRyujumesModel]?> {
        return httpClient.get(url: RyujumeURL.getLatestInfo.getPath())
            .map({ (data) -> [SimpleRyujumesModel]? in
                guard let data = data, let response = try? JSONDecoder().decode([SimpleRyujumesModel].self, from: data) else { return nil }
                return response
            })
    }
    
    func getLikeInfo() -> Observable<[SimpleRyujumesModel]?> {
        return httpClient.get(url: RyujumeURL.getLikeInfo.getPath())
            .map({ (data) -> [SimpleRyujumesModel]? in
                guard let data = data, let response = try? JSONDecoder().decode([SimpleRyujumesModel].self, from: data) else { return nil }
                return response
            })
    }
    
    func getDetailRyujume(ryujumeId: String) -> Observable<RyujumeModel?> {
        return httpClient.get(url: RyujumeURL.getDetail(ryujumeId: ryujumeId).getPath())
            .map({ (data) -> RyujumeModel? in
                guard let data = data, let response = try? JSONDecoder().decode(RyujumeModel.self, from: data) else { return nil }
                return response
            })
    }
    
    func postLikePress(ryujumeId: String, isLiked: Bool) -> Observable<Bool> {
        let params: [String : Any] = ["ryujumeId" : ryujumeId, "likeStatus" : isLiked]
        return httpClient.post(url: RyujumeURL.postLikePress.getPath(), params: params)
            .map({ (data) -> Bool in
                guard data != nil else { return false }
                return true
            })
    }
}
