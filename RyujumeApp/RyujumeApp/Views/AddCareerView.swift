//
//  AddCareerView.swift
//  RyujumeApp
//
//  Created by baby1234 on 28/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit
import TextFieldEffects

class AddCareerView: UIView {
    
    let companyTxtField = HoshiTextField()
    let deleteBtn = UIButton()
    let startDateBtn = UIButton()
    let dashLbl = UILabel()
    let endDateBtn = UIButton()
    let isWorkingLbl = UILabel()
    let isWorkingBtn = UIButton()
    
    func configureView(addStackView: UIStackView){
        
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        
        companyTxtField.placeholder = "회사명"
        companyTxtField.adjustsFontSizeToFitWidth = true
        companyTxtField.font = UIFont.appMidiumFontWith(size: (companyTxtField.font?.pointSize ?? 0) - 3)
        companyTxtField.borderActiveColor = Color.getColor(.main3)()
        companyTxtField.borderInactiveColor = Color.getColor(.main1)()
        companyTxtField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(companyTxtField)
        
        deleteBtn.setTitle("삭제", for: .normal)
        deleteBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        deleteBtn.titleLabel?.font = UIFont.appExtraLightFontWith(size: deleteBtn.titleLabel!.font.pointSize)
        deleteBtn.setTitleColor(UIColor.blue, for: .normal)
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        deleteBtn.addTarget(self, action: #selector(tapedDeleteBtn), for: .touchUpInside)
        self.addSubview(deleteBtn)
        
        startDateBtn.setTitle("시작일", for: .normal)
        startDateBtn.setTitleColor(UIColor.darkText, for: .normal)
        startDateBtn.tag = 0
        startDateBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        startDateBtn.titleLabel?.font = UIFont.appExtraLightFontWith(size: deleteBtn.titleLabel!.font.pointSize - 3)
        startDateBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(startDateBtn)
        
        dashLbl.text = "-"
        dashLbl.adjustsFontSizeToFitWidth = true
        dashLbl.font = UIFont.appExtraLightFontWith(size: deleteBtn.titleLabel!.font.pointSize - 5)
        dashLbl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dashLbl)
        
        endDateBtn.setTitle("마지막일", for: .normal)
        endDateBtn.setTitleColor(UIColor.darkText, for: .normal)
        endDateBtn.tag = 1
        endDateBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        endDateBtn.titleLabel?.font = UIFont.appExtraLightFontWith(size: deleteBtn.titleLabel!.font.pointSize - 3)
        endDateBtn.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(endDateBtn)
        
        isWorkingLbl.text = "재직중인가요?"
        isWorkingLbl.adjustsFontSizeToFitWidth = true
        isWorkingLbl.font = UIFont.appExtraLightFontWith(size: deleteBtn.titleLabel!.font.pointSize - 5)
        isWorkingLbl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(isWorkingLbl)
        
        isWorkingBtn.setTitle("X", for: .normal)
        isWorkingBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        isWorkingBtn.titleLabel?.font = UIFont.appExtraLightFontWith(size: deleteBtn.titleLabel!.font.pointSize - 5)
        isWorkingBtn.setTitleColor(UIColor.blue, for: .normal)
        isWorkingBtn.translatesAutoresizingMaskIntoConstraints = false
        isWorkingBtn.addTarget(self, action: #selector(tapedStateBtn), for: .touchUpInside)
        self.addSubview(isWorkingBtn)
        
        self.widthAnchor.constraint(equalToConstant: addStackView.frame.width).isActive = true
        
        companyTxtField.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        companyTxtField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        companyTxtField.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        
        deleteBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        deleteBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        deleteBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        deleteBtn.heightAnchor.constraint(equalTo: deleteBtn.widthAnchor).isActive = true
        
        endDateBtn.trailingAnchor.constraint(equalTo: deleteBtn.trailingAnchor).isActive = true
        endDateBtn.topAnchor.constraint(equalTo: deleteBtn.bottomAnchor, constant: 2).isActive = true
        
        dashLbl.trailingAnchor.constraint(equalTo: endDateBtn.leadingAnchor, constant: -5).isActive = true
        dashLbl.centerYAnchor.constraint(equalTo: endDateBtn.centerYAnchor).isActive = true
        
        startDateBtn.trailingAnchor.constraint(equalTo: dashLbl.leadingAnchor, constant: -5).isActive = true
        startDateBtn.centerYAnchor.constraint(equalTo: dashLbl.centerYAnchor).isActive = true
        
        isWorkingBtn.trailingAnchor.constraint(equalTo: endDateBtn.trailingAnchor, constant: 10).isActive = true
        isWorkingBtn.topAnchor.constraint(equalTo: endDateBtn.bottomAnchor, constant: 2).isActive = true
        
        isWorkingLbl.trailingAnchor.constraint(equalTo: isWorkingBtn.leadingAnchor).isActive = true
        isWorkingLbl.centerYAnchor.constraint(equalTo: isWorkingBtn.centerYAnchor).isActive = true
        
        companyTxtField.bottomAnchor.constraint(equalTo: endDateBtn.bottomAnchor).isActive = true
        companyTxtField.trailingAnchor.constraint(lessThanOrEqualTo: startDateBtn.leadingAnchor).isActive = true
        
        self.bottomAnchor.constraint(equalTo: isWorkingBtn.bottomAnchor).isActive = true
    }
    
}
