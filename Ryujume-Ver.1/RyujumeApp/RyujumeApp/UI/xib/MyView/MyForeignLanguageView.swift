//
//  MyForeignLanguageView.swift
//  RyujumeApp
//
//  Created by baby1234 on 2019/10/13.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

class MyForeignLanguageView: XibView {
    @IBOutlet weak var languageTxtField: UITextField!
    @IBOutlet weak var underlineView: UIView!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var levelBtn: UIButton!

    override func initUI() {
        deleteBtn.addTarget(self, action: #selector(deleteBtnTaps), for: .touchUpInside)
        languageTxtField.effectActivation(underlineView: underlineView, disposeBag: disposeBag)
    }
}
