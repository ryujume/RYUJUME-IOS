//
//  PrizeView.swift
//  RyujumeApp
//
//  Created by baby1234 on 31/07/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

class PrizeView: UIView {
    
    let prizeLbl = UILabel()
    let deleteBtn = UIButton()
    var prizedDateLbl: UILabel!
    
    func configureView(addStackView: UIStackView, defaultFontSize: Int, prizeInfo: Prize){
        
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        
        prizeLbl.text = prizeInfo.prize
        prizeLbl.font = UIFont.appMidiumFontWith(size: CGFloat(defaultFontSize - 3))
        prizeLbl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(prizeLbl)
        
        deleteBtn.setTitle("삭제", for: .normal)
        deleteBtn.titleLabel?.font = UIFont.appExtraLightFontWith(size: CGFloat(defaultFontSize + 3))
        deleteBtn.setTitleColor(UIColor.blue, for: .normal)
        deleteBtn.tag = 0
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        deleteBtn.addTarget(self, action: #selector(tapedDeleteBtn), for: .touchUpInside)
        self.addSubview(deleteBtn)
        
        if let prizeDate = prizeInfo.prizedDate {
            prizedDateLbl.text = String(prizeDate)
            prizedDateLbl.font = UIFont.appExtraLightFontWith(size: CGFloat(defaultFontSize - 5))
            prizedDateLbl.translatesAutoresizingMaskIntoConstraints = false
            
            self.addSubview(prizedDateLbl)
        } else {
            prizedDateLbl.isHidden = true
            self.addSubview(prizedDateLbl)
        }
        
        self.widthAnchor.constraint(equalToConstant: addStackView.frame.width).isActive = true
        
        prizeLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        prizeLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        prizeLbl.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        
        deleteBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        deleteBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        deleteBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        deleteBtn.heightAnchor.constraint(equalTo: deleteBtn.widthAnchor).isActive = true
        
        prizedDateLbl.trailingAnchor.constraint(equalTo: deleteBtn.trailingAnchor).isActive = true
        prizedDateLbl.topAnchor.constraint(equalTo: deleteBtn.bottomAnchor, constant: 2).isActive = true
        
        prizeLbl.bottomAnchor.constraint(equalTo: prizeLbl.bottomAnchor).isActive = true
        prizeLbl.trailingAnchor.constraint(lessThanOrEqualTo: prizeLbl.leadingAnchor).isActive = true
        
        self.bottomAnchor.constraint(equalTo: prizedDateLbl.bottomAnchor).isActive = true
    }
    
}
