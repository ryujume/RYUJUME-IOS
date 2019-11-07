//
//  AddForeignLanguageView.swift
//  RyujumeApp
//
//  Created by baby1234 on 28/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit
import TextFieldEffects

class AddForeignLanguageView: UIView {
    
    let languageTxtField = HoshiTextField()
    let deleteBtn = UIButton()
    let levelBtn = UIButton()
    
    func configureView(addStackView: UIStackView, defaultFontSize: Int){
        
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        
        languageTxtField.placeholder = "언어*"
        languageTxtField.font = UIFont.appMidiumFontWith(size: CGFloat(defaultFontSize - 3))
        languageTxtField.borderActiveColor = Color.getColor(.main3)()
        languageTxtField.borderInactiveColor = Color.getColor(.main1)()
        languageTxtField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(languageTxtField)
        
        deleteBtn.setTitle("삭제", for: .normal)
        deleteBtn.titleLabel?.font = UIFont.appExtraLightFontWith(size: CGFloat(defaultFontSize + 3))
        deleteBtn.setTitleColor(UIColor.blue, for: .normal)
        deleteBtn.tag = 3
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        deleteBtn.addTarget(self, action: #selector(tapedDeleteBtn), for: .touchUpInside)
        self.addSubview(deleteBtn)
        
        levelBtn.setTitle("수준", for: .normal)
        levelBtn.setTitleColor(UIColor.darkText, for: .normal)
        levelBtn.tag = 3
        levelBtn.titleLabel?.font = UIFont.appExtraLightFontWith(size: CGFloat(defaultFontSize - 3))
        levelBtn.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(levelBtn)
        
        self.widthAnchor.constraint(equalToConstant: addStackView.frame.width).isActive = true
        
        languageTxtField.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        languageTxtField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        languageTxtField.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        languageTxtField.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        
        deleteBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        deleteBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        deleteBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        deleteBtn.heightAnchor.constraint(equalTo: deleteBtn.widthAnchor).isActive = true
        
        levelBtn.leadingAnchor.constraint(equalTo: languageTxtField.leadingAnchor).isActive = true
        levelBtn.topAnchor.constraint(equalTo: languageTxtField.bottomAnchor, constant: 2).isActive = true
        
        languageTxtField.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor).isActive = true
        
        self.bottomAnchor.constraint(equalTo: levelBtn.bottomAnchor).isActive = true
    }
    
}

