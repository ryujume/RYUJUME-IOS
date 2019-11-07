//
//  CareerView.swift
//  RyujumeApp
//
//  Created by baby1234 on 31/07/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

class CareerView: UIView {
    
    let companyLbl = UILabel()
    let deleteBtn = UIButton()
    var startDateLbl: UILabel!
    var dashLbl: UILabel!
    var endDateLbl: UILabel!
    var isWorkingLbl: UILabel!
    
    func configureView(addStackView: UIStackView, defaultFontSize: Int, careerInfo: Career){
        
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        
        companyLbl.text = careerInfo.company
        companyLbl.font = UIFont.appMidiumFontWith(size: CGFloat(defaultFontSize - 3))
        companyLbl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(companyLbl)
        
        deleteBtn.setTitle("삭제", for: .normal)
        deleteBtn.titleLabel?.font = UIFont.appExtraLightFontWith(size: CGFloat(defaultFontSize + 3))
        deleteBtn.setTitleColor(UIColor.blue, for: .normal)
        deleteBtn.tag = 0
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        deleteBtn.addTarget(self, action: #selector(tapedDeleteBtn), for: .touchUpInside)
        self.addSubview(deleteBtn)
        
        if let startDate = careerInfo.startDate, let endDate = careerInfo.endDate {
            startDateLbl.text = String(startDate)
            endDateLbl.text = String(endDate)
            dashLbl.text = "-"
            
            startDateLbl.font = UIFont.appExtraLightFontWith(size: CGFloat(defaultFontSize - 5))
            endDateLbl.font = UIFont.appExtraLightFontWith(size: CGFloat(defaultFontSize - 5))
            dashLbl.font = UIFont.appExtraLightFontWith(size: CGFloat(defaultFontSize - 5))
            
            startDateLbl.translatesAutoresizingMaskIntoConstraints = false
            endDateLbl.translatesAutoresizingMaskIntoConstraints = false
            dashLbl.translatesAutoresizingMaskIntoConstraints = false
            
            self.addSubview(startDateLbl)
            self.addSubview(endDateLbl)
            self.addSubview(dashLbl)
        } else {
            startDateLbl.isHidden = true
            endDateLbl.isHidden = true
            dashLbl.isHidden = true
            
            self.addSubview(startDateLbl)
            self.addSubview(endDateLbl)
            self.addSubview(dashLbl)
        }
        
        if careerInfo.isWorking == true {
            isWorkingLbl.text = "재직중입니다"
        } else {
            isWorkingLbl.text = "재직중이 아닙니다"
        }
        isWorkingLbl.font = UIFont.appExtraLightFontWith(size: CGFloat(defaultFontSize - 5))
        isWorkingLbl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(isWorkingLbl)
        
        
        self.widthAnchor.constraint(equalToConstant: addStackView.frame.width).isActive = true
        
        companyLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        companyLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        companyLbl.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        
        deleteBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        deleteBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        deleteBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        deleteBtn.heightAnchor.constraint(equalTo: deleteBtn.widthAnchor).isActive = true
        
        endDateLbl.trailingAnchor.constraint(equalTo: deleteBtn.trailingAnchor).isActive = true
        endDateLbl.topAnchor.constraint(equalTo: deleteBtn.bottomAnchor, constant: 2).isActive = true
        
        dashLbl.trailingAnchor.constraint(equalTo: endDateLbl.leadingAnchor, constant: -5).isActive = true
        dashLbl.centerYAnchor.constraint(equalTo: endDateLbl.centerYAnchor).isActive = true
        
        startDateLbl.trailingAnchor.constraint(equalTo: dashLbl.leadingAnchor, constant: -5).isActive = true
        startDateLbl.centerYAnchor.constraint(equalTo: dashLbl.centerYAnchor).isActive = true
        
        isWorkingLbl.trailingAnchor.constraint(equalTo: endDateLbl.trailingAnchor, constant: 10).isActive = true
        isWorkingLbl.topAnchor.constraint(equalTo: endDateLbl.bottomAnchor, constant: 2).isActive = true
        
        companyLbl.bottomAnchor.constraint(equalTo: endDateLbl.bottomAnchor).isActive = true
        companyLbl.trailingAnchor.constraint(lessThanOrEqualTo: startDateLbl.leadingAnchor).isActive = true
        
        self.bottomAnchor.constraint(equalTo: isWorkingLbl.bottomAnchor).isActive = true
    }
    
}
