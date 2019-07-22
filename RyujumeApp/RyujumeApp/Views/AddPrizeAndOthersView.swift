//
//  AddPrizeAndOthersView.swift
//  RyujumeApp
//
//  Created by baby1234 on 28/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit
import TextFieldEffects

class AddPrizeAndOthersView: UIView {
    
    let activateTxtField = HoshiTextField()
    let deleteBtn = UIButton()
    let prizedDateBtn = UIButton()
    
    func configureView(addStackView: UIStackView){
        
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        
        activateTxtField.placeholder = "활동명"
        activateTxtField.adjustsFontSizeToFitWidth = true
        activateTxtField.font = UIFont.appMidiumFontWith(size: (activateTxtField.font?.pointSize ?? 0) - 3)
        activateTxtField.borderActiveColor = Color.getColor(.main3)()
        activateTxtField.borderInactiveColor = Color.getColor(.main1)()
        activateTxtField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activateTxtField)
        
        deleteBtn.setTitle("삭제", for: .normal)
        deleteBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        deleteBtn.titleLabel?.font = UIFont.appExtraLightFontWith(size: deleteBtn.titleLabel!.font.pointSize)
        deleteBtn.setTitleColor(UIColor.blue, for: .normal)
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        deleteBtn.addTarget(self, action: #selector(tapedDeleteBtn), for: .touchUpInside)
        self.addSubview(deleteBtn)
        
        prizedDateBtn.setTitle("수상일", for: .normal)
        prizedDateBtn.setTitleColor(UIColor.darkText, for: .normal)
        prizedDateBtn.tag = 2
        prizedDateBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        prizedDateBtn.titleLabel?.font = UIFont.appExtraLightFontWith(size: deleteBtn.titleLabel!.font.pointSize - 3)
        prizedDateBtn.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(prizedDateBtn)
        
        self.widthAnchor.constraint(equalToConstant: addStackView.frame.width).isActive = true
        
        activateTxtField.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        activateTxtField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        activateTxtField.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        
        deleteBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        deleteBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        deleteBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        deleteBtn.heightAnchor.constraint(equalTo: deleteBtn.widthAnchor).isActive = true
        
        prizedDateBtn.trailingAnchor.constraint(equalTo: deleteBtn.trailingAnchor).isActive = true
        prizedDateBtn.topAnchor.constraint(equalTo: deleteBtn.bottomAnchor, constant: 2).isActive = true
        
        activateTxtField.bottomAnchor.constraint(equalTo: prizedDateBtn.bottomAnchor).isActive = true
        activateTxtField.trailingAnchor.constraint(lessThanOrEqualTo: prizedDateBtn.leadingAnchor).isActive = true
        
        self.bottomAnchor.constraint(equalTo: prizedDateBtn.bottomAnchor, constant: 10).isActive = true
    }
    
}

