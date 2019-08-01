//
//  HTTPClient.swift
//  RyujumeApp
//
//  Created by baby1234 on 23/07/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation
import Alamofire

protocol HTTPClientProvider {
    func get(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest
    func post(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest
    func put(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest
}

final class HTTPClient: HTTPClientProvider {
    let baseURL = "http://10.156.145.19:1212/api"
    
    func get(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest{
        return AF.request(baseURL + url,
                          method: .get,
                          parameters: params,
                          encoding: JSONEncoding.default,
                          headers: header,
                          interceptor: nil)
        
    }
    
    func post(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest{
        return AF.request(baseURL + url,
                          method: .post,
                          parameters: params,
                          encoding: JSONEncoding.default,
                          headers: header,
                          interceptor: nil)
        
    }
    
    func put(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest{
        return AF.request(baseURL + url,
                          method: .put,
                          parameters: params,
                          encoding: URLEncoding.queryString,
                          headers: header,
                          interceptor: nil)
    }
}
