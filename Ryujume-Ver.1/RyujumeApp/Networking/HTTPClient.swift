//
//  HTTPClient.swift
//  RyujumeApp
//
//  Created by baby1234 on 26/08/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

final class HTTPClient: HTTPClientProvider {
    func get(url: String) -> Observable<Data?> {
        guard let url = URL(string: url) else { return Observable.empty() }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if let token = Token.token { request.addValue( token, forHTTPHeaderField: "x-access-token") }
        return URLSession.shared.rx.data(request: request).map({ Optional($0) }).catchErrorJustReturn(nil)
    }
    func post(url: String, params: [String: Any]) -> Observable<Data?> {
        guard let url = URL(string: url) else { return Observable.empty() }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if let token = Token.token { request.addValue( token, forHTTPHeaderField: "x-access-token") }
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch let err {
            print(err.localizedDescription)
            return Observable.empty()
        }
        return URLSession.shared.rx.data(request: request).map({ Optional($0) }).catchErrorJustReturn(nil)
    }
    func put(url: String, params: [String: Any]) -> Observable<Data?> {
        guard let url = URL(string: url) else { return Observable.empty() }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if let token = Token.token { request.addValue( token, forHTTPHeaderField: "x-access-token") }
        request.httpMethod = "PUT"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch let err {
            print(err.localizedDescription)
            return Observable.empty()
        }
        return URLSession.shared.rx.data(request: request).map({ Optional($0) }).catchErrorJustReturn(nil)
    }
}
