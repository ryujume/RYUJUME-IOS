//
//  LinkView.swift
//  RyujumeApp
//
//  Created by baby1234 on 31/07/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

class LinkView: UIView {

    let linkLbl = UILabel()
    let deleteBtn = UIButton()

    func configureView(addStackView: UIStackView, defaultFontSize: Int, linkInfo: String){

        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false

        linkLbl.text = linkInfo
        linkLbl.font = UIFont.appMidiumFontWith(size: CGFloat(defaultFontSize - 3))
        linkLbl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(linkLbl)

        deleteBtn.setTitle("삭제", for: .normal)
        deleteBtn.titleLabel?.font = UIFont.appExtraLightFontWith(size: CGFloat(defaultFontSize + 3))
        deleteBtn.setTitleColor(UIColor.blue, for: .normal)
        deleteBtn.tag = 0
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        deleteBtn.addTarget(self, action: #selector(tapedDeleteBtn), for: .touchUpInside)
        self.addSubview(deleteBtn)

        self.widthAnchor.constraint(equalToConstant: addStackView.frame.width).isActive = true

        linkLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        linkLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        linkLbl.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        linkLbl.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        
        deleteBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        deleteBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        deleteBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        deleteBtn.heightAnchor.constraint(equalTo: deleteBtn.widthAnchor).isActive = true
        
        linkLbl.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor).isActive = true
        
        self.bottomAnchor.constraint(equalTo: linkLbl.bottomAnchor).isActive = true
    }

}
