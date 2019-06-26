//
//  Base.swift
//  RyujumeApp
//
//  Created by baby1234 on 25/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentYesOrNoAlert(alertTitle: String?, alertMessage: String?) {
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "예", style: .default, handler: nil))
        alertController.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
    }
}
