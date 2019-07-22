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
    
    let LanguageTxtField = HoshiTextField()
    let deleteBtn = UIButton()
    let levelBtn = UIButton()
    
    func configureView(addStackView: UIStackView){
        
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        
        LanguageTxtField.placeholder = "언어"
        LanguageTxtField.adjustsFontSizeToFitWidth = true
        LanguageTxtField.font = UIFont.appMidiumFontWith(size: (LanguageTxtField.font?.pointSize ?? 0) - 3)
        LanguageTxtField.borderActiveColor = Color.getColor(.main3)()
        LanguageTxtField.borderInactiveColor = Color.getColor(.main1)()
        LanguageTxtField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(LanguageTxtField)
        
        deleteBtn.setTitle("삭제", for: .normal)
        deleteBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        deleteBtn.titleLabel?.font = UIFont.appExtraLightFontWith(size: deleteBtn.titleLabel!.font.pointSize)
        deleteBtn.setTitleColor(UIColor.blue, for: .normal)
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        deleteBtn.addTarget(self, action: #selector(tapedDeleteBtn), for: .touchUpInside)
        self.addSubview(deleteBtn)
        
        levelBtn.setTitle("수준", for: .normal)
        levelBtn.setTitleColor(UIColor.darkText, for: .normal)
        levelBtn.tag = 3
        levelBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        levelBtn.titleLabel?.font = UIFont.appExtraLightFontWith(size: deleteBtn.titleLabel!.font.pointSize - 3)
        levelBtn.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(levelBtn)
        
        self.widthAnchor.constraint(equalToConstant: addStackView.frame.width).isActive = true
        
        LanguageTxtField.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        LanguageTxtField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        LanguageTxtField.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        LanguageTxtField.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        
        deleteBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        deleteBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        deleteBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        deleteBtn.heightAnchor.constraint(equalTo: deleteBtn.widthAnchor).isActive = true
        
        levelBtn.leadingAnchor.constraint(equalTo: LanguageTxtField.leadingAnchor).isActive = true
        levelBtn.topAnchor.constraint(equalTo: LanguageTxtField.bottomAnchor, constant: 2).isActive = true
        
        LanguageTxtField.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor).isActive = true
        
        self.bottomAnchor.constraint(equalTo: levelBtn.bottomAnchor).isActive = true
    }
    
}

