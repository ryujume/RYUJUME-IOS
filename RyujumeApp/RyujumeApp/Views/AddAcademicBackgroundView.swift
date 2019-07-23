//
//  AcademicBackgroundView.swift
//  RyujumeApp
//
//  Created by baby1234 on 28/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit
import TextFieldEffects

class AddAcademicBackgroundView: UIView {
    
    let schoolTxtField = HoshiTextField()
    let deleteBtn = UIButton()
    let startDateBtn = UIButton()
    let dashLbl = UILabel()
    let endDateBtn = UIButton()
    let isAttendingLbl = UILabel()
    let isAttendingBtn = UIButton()
    
    func configureView(addStackView: UIStackView){
        
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        
        schoolTxtField.placeholder = "학교명"
        schoolTxtField.adjustsFontSizeToFitWidth = true
        schoolTxtField.font = UIFont.appMidiumFontWith(size: (schoolTxtField.font?.pointSize ?? 0) - 3)
        schoolTxtField.borderActiveColor = Color.getColor(.main3)()
        schoolTxtField.borderInactiveColor = Color.getColor(.main1)()
        schoolTxtField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(schoolTxtField)
        
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
        
        isAttendingLbl.text = "재학중인가요?"
        isAttendingLbl.adjustsFontSizeToFitWidth = true
        isAttendingLbl.font = UIFont.appExtraLightFontWith(size: deleteBtn.titleLabel!.font.pointSize - 5)
        isAttendingLbl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(isAttendingLbl)
        
        isAttendingBtn.setTitle("X", for: .normal)
        isAttendingBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        isAttendingBtn.titleLabel?.font = UIFont.appExtraLightFontWith(size: deleteBtn.titleLabel!.font.pointSize - 5)
        isAttendingBtn.setTitleColor(UIColor.blue, for: .normal)
        isAttendingBtn.translatesAutoresizingMaskIntoConstraints = false
        isAttendingBtn.addTarget(self, action: #selector(tapedStateBtn), for: .touchUpInside)
        self.addSubview(isAttendingBtn)
        
        self.widthAnchor.constraint(equalToConstant: addStackView.frame.width).isActive = true
        
        schoolTxtField.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        schoolTxtField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        schoolTxtField.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        
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
        
        isAttendingBtn.trailingAnchor.constraint(equalTo: endDateBtn.trailingAnchor, constant: 10).isActive = true
        isAttendingBtn.topAnchor.constraint(equalTo: endDateBtn.bottomAnchor, constant: 2).isActive = true
        
        isAttendingLbl.trailingAnchor.constraint(equalTo: isAttendingBtn.leadingAnchor).isActive = true
        isAttendingLbl.centerYAnchor.constraint(equalTo: isAttendingBtn.centerYAnchor).isActive = true
        
        schoolTxtField.bottomAnchor.constraint(equalTo: endDateBtn.bottomAnchor).isActive = true
        schoolTxtField.trailingAnchor.constraint(lessThanOrEqualTo: startDateBtn.leadingAnchor).isActive = true
        
        self.bottomAnchor.constraint(equalTo: isAttendingBtn.bottomAnchor).isActive = true
    }
    
}
