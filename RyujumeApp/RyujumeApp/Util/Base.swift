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
    
    func addView(stateOfButton state : MoreInfomation, stackView: UIStackView) -> UIView {
        let idx = stackView.arrangedSubviews.count - 1
        
        switch state {
        case .career:
            let newView = AddCareerView()
            newView.configureView(addStackView: stackView)
            newView.isHidden = true
            
            stackView.insertArrangedSubview(newView, at: idx)
            
            UIView.animate(withDuration: 0.25) {
                newView.isHidden = false
            }
            
            return newView
        case .academicBackground:
            let newView = AddAcademicBackgroundView()
            newView.configureView(addStackView: stackView)
            newView.isHidden = true
            
            stackView.insertArrangedSubview(newView, at: idx)
            
            UIView.animate(withDuration: 0.25) {
                newView.isHidden = false
            }
            
            return newView
        case .prizeAndOthers:
            let newView = AddPrizeAndOthersView()
            newView.configureView(addStackView: stackView)
            newView.isHidden = true
            
            stackView.insertArrangedSubview(newView, at: idx)
            
            UIView.animate(withDuration: 0.25) {
                newView.isHidden = false
            }
            
            return newView
        case .foreignLanguage:
            let newView = AddForeignLanguageView()
            newView.configureView(addStackView: stackView)
            newView.isHidden = true
            
            stackView.insertArrangedSubview(newView, at: idx)
            
            UIView.animate(withDuration: 0.25) {
                newView.isHidden = false
            }
            
            return newView
        case .link:
            let newView = AddLinkView()
            newView.configureView(addStackView: stackView)
            newView.isHidden = true
            
            stackView.insertArrangedSubview(newView, at: idx)
            
            UIView.animate(withDuration: 0.25) {
                newView.isHidden = false
            }
            
            return newView
        }
        
    }
}
