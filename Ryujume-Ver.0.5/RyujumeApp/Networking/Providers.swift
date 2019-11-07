//
//  Providers.swift
//  RyujumeApp
//
//  Created by baby1234 on 24/07/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

protocol MainProvider {
    func getLatestRyujumes()
    func getLikeRyujumes()
}

protocol RegisterProvider {
    func postRegister(id: String, pw: String, userName: String)
}

protocol LoginProvider {
    func postLogin(id: String, pw: String)
}

protocol MyRyujumeProvider {
    func postUpdateIdentityImg(identityImg: String)
    func putUpdateRyujume(_ ryujume: RyujumeModel)
    func getMyRyujume()
}

protocol LikedRyujumeProvider {
    func getLikedRyujumes()
}

protocol DetailRyujumeProvider {
    func getDetailRyujume()
}
