//
//  Provider.swift
//  RyujumeApp
//
//  Created by baby1234 on 27/08/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

protocol AuthAPIProvider {
    func postLogin(userID: String, userPW: String) -> Observable<LoginModel?>
    func postRegister(userID: String, userPW: String, userName: String) -> Observable<NetworkingResult>
}

protocol MyPageAPIProvider {
    func postUpdateProfileImg(identityImg: String) -> Observable<NetworkingResult>
    func putUpdateInfo(ryujume: RyujumeModel) -> Observable<RyujumeModel?>
    func getReadLikeInfo() -> Observable<[SimpleRyujumesModel]?>
    func getReadMyInfo() -> Observable<RyujumeModel?>
}

protocol MainAPIProvider {
    func getLatestInfo() -> Observable<[SimpleRyujumesModel]?>
    func getLikeInfo() -> Observable<[SimpleRyujumesModel]?>
    func getDetailRyujume(ryujumeId: String) -> Observable<RyujumeModel?>
    func postLikePress(ryujumeId: String, isLiked: Bool) -> Observable<NetworkingResult>
}

protocol HTTPClientProvider {
    func get(url: String) -> Observable<Data?>
    func post(url: String, params: [String: Any]) -> Observable<Data?>
    func put(url: String, params: [String: Any]) -> Observable<Data?>
}
