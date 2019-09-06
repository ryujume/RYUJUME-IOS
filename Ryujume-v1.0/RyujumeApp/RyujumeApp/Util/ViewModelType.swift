//
//  File.swift
//  RyujumeApp
//
//  Created by baby1234 on 27/08/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype input
    associatedtype output
    
    func transform(input: input) -> output
}
