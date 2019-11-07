//
//  MyCareerView.swift
//  RyujumeApp
//
//  Created by baby1234 on 2019/10/13.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class MyCareerView: XibView {
    @IBOutlet weak var companyTxtField: UITextField!
    @IBOutlet weak var underlineView: UIView!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var startDateBtn: UIButton!
    @IBOutlet weak var dashLbl: UILabel!
    @IBOutlet weak var endDateBtn: UIButton!
    @IBOutlet weak var isWorkingBtn: UIButton!

    override func initUI() {
        deleteBtn.addTarget(self, action: #selector(deleteBtnTaps), for: .touchUpInside)
        isWorkingBtn.addTarget(self, action: #selector(isWorkingBtnTaps), for: .touchUpInside)
        companyTxtField.effectActivation(underlineView: underlineView, disposeBag: disposeBag)
    }

    @objc func isWorkingBtnTaps(sender: UIButton) {
        if sender.isSelected {
            endDateBtn.isHidden = false
            dashLbl.isHidden = false
            sender.isSelected = false
        } else {
            endDateBtn.isHidden = true
            dashLbl.isHidden = true
            sender.isSelected = true
        }
    }
}
