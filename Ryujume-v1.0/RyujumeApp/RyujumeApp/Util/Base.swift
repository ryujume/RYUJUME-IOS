//
//  Base.swift
//  RyujumeApp
//
//  Created by baby1234 on 27/08/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

extension UIViewController {

    func showCheckAlert(title: String?, message: String?, completion: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: completion))
        present(alert, animated: true, completion: nil)
    }

    func goPreviousVC() {
        self.navigationController?.popViewController(animated: true)
    }

    func showToast(message: String) {
        let toastLabel = UITextView(frame: CGRect(x: self.view.frame.size.width / 16, y: self.view.frame.size.height - 150, width: self.view.frame.size.width * 7 / 8, height: 44))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.text = "   \(message)   "
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 22
        toastLabel.clipsToBounds = true
        toastLabel.font = UIFont(name: (toastLabel.font?.fontName)!, size: 16)
        toastLabel.center.x = self.view.frame.size.width / 2
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, animations: { toastLabel.alpha = 0.0 }, completion: { (_) in toastLabel.removeFromSuperview() })
    }
}

extension UITextField {
    func effectActivation(underlineView: UIView, disposeBag: DisposeBag) {
        underlineView.translatesAutoresizingMaskIntoConstraints = false

        self.rx.controlEvent(.editingDidBegin).subscribe { (_) in
            UIView.animate(withDuration: 0.5, animations: {
                underlineView.backgroundColor = Color.main1
                underlineView.tintColor = Color.main1
                underlineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
            })
            }.disposed(by: disposeBag)

        self.rx.controlEvent(.editingDidEnd).subscribe { (_) in
            UIView.animate(withDuration: 0.5, animations: {
                underlineView.backgroundColor = Color.main3
                underlineView.tintColor = Color.main3
                underlineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
            })
            }.disposed(by: disposeBag)
    }
}
