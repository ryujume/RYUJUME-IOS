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
    
    let LinkTxtField = HoshiTextField()
    let deleteBtn = UIButton()
    
    func configureView(addStackView: UIStackView){
        
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        
        LinkTxtField.placeholder = "링크"
        LinkTxtField.adjustsFontSizeToFitWidth = true
        LinkTxtField.font = UIFont.appMidiumFontWith(size: (LinkTxtField.font?.pointSize ?? 0) - 3)
        LinkTxtField.borderActiveColor = Color.getColor(.main3)()
        LinkTxtField.borderInactiveColor = Color.getColor(.main1)()
        LinkTxtField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(LinkTxtField)
        
        deleteBtn.setTitle("삭제", for: .normal)
        deleteBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        deleteBtn.titleLabel?.font = UIFont.appExtraLightFontWith(size: deleteBtn.titleLabel!.font.pointSize)
        deleteBtn.setTitleColor(UIColor.blue, for: .normal)
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        deleteBtn.addTarget(self, action: #selector(tapedDeleteBtn), for: .touchUpInside)
        self.addSubview(deleteBtn)
        
        self.widthAnchor.constraint(equalToConstant: addStackView.frame.width).isActive = true
        
        LinkTxtField.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        LinkTxtField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        LinkTxtField.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        LinkTxtField.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        
        deleteBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        deleteBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        deleteBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        deleteBtn.heightAnchor.constraint(equalTo: deleteBtn.widthAnchor).isActive = true
        
        LinkTxtField.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor).isActive = true
        
        self.bottomAnchor.constraint(equalTo: LinkTxtField.bottomAnchor).isActive = true
    }
    
}

