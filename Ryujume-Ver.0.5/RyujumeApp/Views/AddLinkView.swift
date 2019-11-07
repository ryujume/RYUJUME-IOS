//
//  AddLinkView.swift
//  RyujumeApp
//
//  Created by baby1234 on 28/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit
import TextFieldEffects

class AddLinkView: UIView {
    
    let linkTxtField = HoshiTextField()
    let deleteBtn = UIButton()
    
    func configureView(addStackView: UIStackView, defaultFontSize: Int){
        
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        
        linkTxtField.placeholder = "링크*"
        linkTxtField.font = UIFont.appMidiumFontWith(size: CGFloat(defaultFontSize - 3))
        linkTxtField.borderActiveColor = Color.getColor(.main3)()
        linkTxtField.borderInactiveColor = Color.getColor(.main1)()
        linkTxtField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(linkTxtField)
        
        deleteBtn.setTitle("삭제", for: .normal)
        deleteBtn.titleLabel?.font = UIFont.appExtraLightFontWith(size: CGFloat(defaultFontSize + 3))
        deleteBtn.setTitleColor(UIColor.blue, for: .normal)
        deleteBtn.tag = 4
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        deleteBtn.addTarget(self, action: #selector(tapedDeleteBtn), for: .touchUpInside)
        self.addSubview(deleteBtn)
        
        self.widthAnchor.constraint(equalToConstant: addStackView.frame.width).isActive = true
        
        linkTxtField.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        linkTxtField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        linkTxtField.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        linkTxtField.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        
        deleteBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        deleteBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        deleteBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        deleteBtn.heightAnchor.constraint(equalTo: deleteBtn.widthAnchor).isActive = true
        
        linkTxtField.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor).isActive = true
        
        self.bottomAnchor.constraint(equalTo: linkTxtField.bottomAnchor).isActive = true
    }
    
}

