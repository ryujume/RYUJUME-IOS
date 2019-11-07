//
//  ForeignLanguageView.swift
//  RyujumeApp
//
//  Created by baby1234 on 31/07/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import Foundation

import UIKit

class ForeignLanguageView: UIView {
    
    let languageLbl = UILabel()
    let deleteBtn = UIButton()
    var levelLbl: UILabel!
    
    func configureView(addStackView: UIStackView, defaultFontSize: Int, foreignLanguageInfo: ForeignLanguage){
        
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        
        languageLbl.text = foreignLanguageInfo.language
        languageLbl.font = UIFont.appMidiumFontWith(size: CGFloat(defaultFontSize - 3))
        languageLbl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(languageLbl)
        
        deleteBtn.setTitle("삭제", for: .normal)
        deleteBtn.titleLabel?.font = UIFont.appExtraLightFontWith(size: CGFloat(defaultFontSize + 3))
        deleteBtn.setTitleColor(UIColor.blue, for: .normal)
        deleteBtn.tag = 0
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        deleteBtn.addTarget(self, action: #selector(tapedDeleteBtn), for: .touchUpInside)
        self.addSubview(deleteBtn)
        
        self.widthAnchor.constraint(equalToConstant: addStackView.frame.width).isActive = true
        
        languageLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        languageLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        languageLbl.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        languageLbl.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        
        deleteBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        deleteBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        deleteBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        deleteBtn.heightAnchor.constraint(equalTo: deleteBtn.widthAnchor).isActive = true
        
        levelLbl.leadingAnchor.constraint(equalTo: languageLbl.leadingAnchor).isActive = true
        levelLbl.topAnchor.constraint(equalTo: languageLbl.bottomAnchor, constant: 2).isActive = true
        
        languageLbl.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor).isActive = true
        
        self.bottomAnchor.constraint(equalTo: levelLbl.bottomAnchor).isActive = true
    }
    
}
