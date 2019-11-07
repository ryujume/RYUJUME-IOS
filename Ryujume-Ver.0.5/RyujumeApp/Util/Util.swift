//
//  Shape.swift
//  RyujumeApp
//
//  Created by baby1234 on 25/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

class roundTxtView: UITextView {
    override func awakeFromNib() {
        layer.cornerRadius = frame.height / 8
        layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.init(width: 1, height: 1)
    }
}

class roundBtn: UIButton {
    override func awakeFromNib() {
        layer.cornerRadius = frame.height / 6
        layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.init(width: 1, height: 1)
    }
}

enum Color {
    case main1, main2, main3
    
    func getColor() -> UIColor {
        switch self {
        case .main1:
            return UIColor("#FACA71")
        case .main2:
            return UIColor("#FF922B")
        case .main3:
            return UIColor("#F76707")
        }
    }
}
