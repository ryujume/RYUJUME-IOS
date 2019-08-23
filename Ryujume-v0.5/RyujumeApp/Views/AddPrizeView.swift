//
//  AddPrizeAndOthersView.swift
//  RyujumeApp
//
//  Created by baby1234 on 28/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit
import TextFieldEffects

class AddPrizeView: UIView {
    
    let prizeTxtField = HoshiTextField()
    let deleteBtn = UIButton()
    let prizedDateBtn = UIButton()
    
    func configureView(addStackView: UIStackView, defaultFontSize: Int){
        
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        
        prizeTxtField.placeholder = "수상명*"
        prizeTxtField.font = UIFont.appMidiumFontWith(size: CGFloat(defaultFontSize - 3))
        prizeTxtField.borderActiveColor = Color.getColor(.main3)()
        prizeTxtField.borderInactiveColor = Color.getColor(.main1)()
        prizeTxtField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(prizeTxtField)
        
        deleteBtn.setTitle("삭제", for: .normal)
        deleteBtn.titleLabel?.font = UIFont.appExtraLightFontWith(size: CGFloat(defaultFontSize + 3))
        deleteBtn.setTitleColor(UIColor.blue, for: .normal)
        deleteBtn.tag = 2
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        deleteBtn.addTarget(self, action: #selector(tapedDeleteBtn), for: .touchUpInside)
        self.addSubview(deleteBtn)
        
        prizedDateBtn.setTitle("수상일", for: .normal)
        prizedDateBtn.setTitleColor(UIColor.darkText, for: .normal)
        prizedDateBtn.tag = 2
        prizedDateBtn.titleLabel?.font = UIFont.appExtraLightFontWith(size: CGFloat(defaultFontSize - 3))
        prizedDateBtn.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(prizedDateBtn)
        
        self.widthAnchor.constraint(equalToConstant: addStackView.frame.width).isActive = true
        
        prizeTxtField.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        prizeTxtField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        prizeTxtField.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        
        deleteBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        deleteBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        deleteBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        deleteBtn.heightAnchor.constraint(equalTo: deleteBtn.widthAnchor).isActive = true
        
        prizedDateBtn.trailingAnchor.constraint(equalTo: deleteBtn.trailingAnchor).isActive = true
        prizedDateBtn.topAnchor.constraint(equalTo: deleteBtn.bottomAnchor, constant: 2).isActive = true
        
        prizeTxtField.bottomAnchor.constraint(equalTo: prizedDateBtn.bottomAnchor).isActive = true
        prizeTxtField.trailingAnchor.constraint(lessThanOrEqualTo: prizedDateBtn.leadingAnchor).isActive = true
        
        self.bottomAnchor.constraint(equalTo: prizedDateBtn.bottomAnchor, constant: 10).isActive = true
    }
    
}

