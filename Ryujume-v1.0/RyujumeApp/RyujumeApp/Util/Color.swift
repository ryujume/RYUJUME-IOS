//
//  Color.swift
//  RyujumeApp
//
//  Created by baby1234 on 12/09/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

struct Color {
    static let main1 = UIColor().hexStringToUIColor(hex: "#F76707")
    static let main2 = UIColor().hexStringToUIColor(hex: "#FF922B")
    static let main3 = UIColor().hexStringToUIColor(hex: "#FACA71")
}

extension UIColor {
    func hexStringToUIColor(hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") { cString.remove(at: cString.startIndex) }
        if cString.count != 6 { return UIColor.gray }
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
