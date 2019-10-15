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

    func postLogin(userID: String, userPW: String) -> Observable<LoginModel?> {
        let params = ["id": userID, "pw": userPW]
        return httpClient.post(url: RyujumeURL.postLogin.getPath(), params: params)
            .map({ data -> LoginModel? in
                guard let data = data, let response = try? JSONDecoder().decode(LoginModel.self, from: data) else { return nil }
                return response
            })
    }

    func postRegister(userID: String, userPW: String, userName: String) -> Observable<Result> {
        let params = ["id": userID, "pw": userPW, "userName": userName]
        return httpClient.post(url: RyujumeURL.postRegister.getPath(), params: params)
            .map({ (data) -> Result in
                guard data != nil else { return .failure }
                return .success
            })
    }
}

class MyPageAPI: MyPageAPIProvider {
    let httpClient = HTTPClient()

    func postUpdateProfileImg(identityImg: String) -> Observable<Result> {
        let params = ["profileImg": identityImg]
        return httpClient.post(url: RyujumeURL.postUpdateProfileImg.getPath(), params: params)
            .map({ (data) -> Result in
                guard data != nil else { return .failure }
                return .success
            })
    }

    func putUpdateInfo(ryujume: MyRyujumeModel) -> Observable<MyRyujumeModel?> {
        let params: [String: Any] = ["phoneNumber": ryujume.phoneNumber ?? "",
                                     "email": ryujume.email ?? "",
                                     "simpleInfo": ryujume.simpleIntroduce ?? "",
                                     "career": ryujume.career,
                                     "academicBack": ryujume.academicBackground,
                                     "prize": ryujume.academicBackground,
                                     "language": ryujume.foreignLanguage,
                                     "link": ryujume.link]
        return httpClient.put(url: RyujumeURL.putUpdateInfo.getPath(), params: params)
            .map({ (data) -> MyRyujumeModel? in
                guard let data = data, let response = try? JSONDecoder().decode(MyRyujumeModel.self, from: data) else { return nil }
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

    func getReadMyInfo() -> Observable<MyRyujumeModel?> {
        return httpClient.get(url: RyujumeURL.getReadMyInfo.getPath())
            .map({ (data) -> MyRyujumeModel? in
                guard let data = data, let response = try? JSONDecoder().decode(MyRyujumeModel.self, from: data) else { return nil }
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
        return httpClient.get(url: RyujumeURL.getDetail(ryujumeID: ryujumeId).getPath())
            .map({ (data) -> RyujumeModel? in
                guard let data = data, let response = try? JSONDecoder().decode(RyujumeModel.self, from: data) else { return nil }
                return response
            })
    }

    func postLikePress(ryujumeId: String, isLiked: Bool) -> Observable<Result> {
        let params: [String: Any] = ["ryujumeId": ryujumeId, "likeStatus": isLiked]
        return httpClient.post(url: RyujumeURL.postLikePress.getPath(), params: params)
            .map({ (data) -> Result in
                guard data != nil else { return .failure }
                return .success
            })
    }
}
