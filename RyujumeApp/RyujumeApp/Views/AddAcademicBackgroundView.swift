//
//  AcademicBackgroundView.swift
//  RyujumeApp
//
//  Created by baby1234 on 28/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

class AddAcademicBackgroundView: UIView {

    let companyTxtField = UITextField()
    let departmentAndDutyTxtField = UITextField()
    let deleteBtn = UIButton()
    let startDateLbl = UILabel()
    let dashLbl = UILabel()
    let endDateLbl = UILabel()
    let isworkingLbl = UILabel()
    let isworkingBtn = UIButton()
    
    func configureView(addStackView: UIStackView){
        
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        
        companyTxtField.placeholder = "회사명"
        companyTxtField.minimumFontSize = 8
        companyTxtField.adjustsFontSizeToFitWidth = true
        companyTxtField.borderStyle = .roundedRect
        companyTxtField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(companyTxtField)
        
        deleteBtn.setTitle("삭제", for: .normal)
        deleteBtn.titleLabel?.font.withSize(8)
        deleteBtn.titleLabel?.minimumScaleFactor = 1
        deleteBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        deleteBtn.setTitleColor(UIColor.blue, for: .normal)
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(deleteBtn)
        
        startDateLbl.text = "YYYY.MM"
        startDateLbl.font.withSize(12)
        startDateLbl.minimumScaleFactor = 1
        startDateLbl.adjustsFontSizeToFitWidth = true
        startDateLbl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(startDateLbl)
        
        dashLbl.text = "-"
        dashLbl.font.withSize(12)
        dashLbl.minimumScaleFactor = 1
        dashLbl.adjustsFontSizeToFitWidth = true
        dashLbl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dashLbl)
        
        endDateLbl.text = "YYYY.MM"
        endDateLbl.font.withSize(12)
        endDateLbl.minimumScaleFactor = 1
        endDateLbl.adjustsFontSizeToFitWidth = true
        endDateLbl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(endDateLbl)
        
        isworkingLbl.text = "재직중인가요?"
        isworkingLbl.font.withSize(12)
        isworkingLbl.minimumScaleFactor = 1
        isworkingLbl.adjustsFontSizeToFitWidth = true
        isworkingLbl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(isworkingLbl)
        
        isworkingBtn.setTitle("O", for: .normal)
        isworkingBtn.titleLabel?.font.withSize(8)
        isworkingBtn.titleLabel?.minimumScaleFactor = 1
        isworkingBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        isworkingBtn.setTitleColor(UIColor.blue, for: .normal)
        isworkingBtn.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(isworkingBtn)
        
        self.widthAnchor.constraint(equalToConstant: addStackView.frame.width).isActive = true
        
        companyTxtField.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        companyTxtField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        companyTxtField.widthAnchor.constraint(equalTo: companyTxtField.heightAnchor, multiplier: 6).isActive = true
        
        departmentAndDutyTxtField.topAnchor.constraint(equalTo: companyTxtField.bottomAnchor, constant: 5).isActive = true
        departmentAndDutyTxtField.leadingAnchor.constraint(equalTo: companyTxtField.leadingAnchor).isActive = true
        departmentAndDutyTxtField.widthAnchor.constraint(equalTo: departmentAndDutyTxtField.heightAnchor, multiplier: 6).isActive = true
        
        deleteBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        deleteBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10).isActive = true
        deleteBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        deleteBtn.heightAnchor.constraint(equalTo: deleteBtn.widthAnchor).isActive = true
        
        endDateLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10).isActive = true
        endDateLbl.topAnchor.constraint(equalTo: deleteBtn.bottomAnchor, constant: 10).isActive = true
        
        dashLbl.trailingAnchor.constraint(equalTo: endDateLbl.leadingAnchor, constant: -5).isActive = true
        dashLbl.centerYAnchor.constraint(equalTo: endDateLbl.centerYAnchor).isActive = true
        
        startDateLbl.trailingAnchor.constraint(equalTo: dashLbl.leadingAnchor, constant: -5).isActive = true
        startDateLbl.centerYAnchor.constraint(equalTo: dashLbl.centerYAnchor).isActive = true
        
        isworkingBtn.trailingAnchor.constraint(equalTo: endDateLbl.trailingAnchor).isActive = true
        isworkingBtn.topAnchor.constraint(equalTo: endDateLbl.bottomAnchor, constant: 20).isActive = true
        
        isworkingLbl.trailingAnchor.constraint(equalTo: isworkingBtn.leadingAnchor, constant: -5).isActive = true
        isworkingLbl.centerYAnchor.constraint(equalTo: isworkingBtn.centerYAnchor).isActive = true
        
        self.bottomAnchor.constraint(equalTo: isworkingBtn.bottomAnchor).isActive = true
    }

}
