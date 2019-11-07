//
//  MyLinkView.swift
//  RyujumeApp
//
//  Created by baby1234 on 2019/10/13.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

class MyLinkView: XibView {
    @IBOutlet weak var linkTxtField: UITextField!
    @IBOutlet weak var underlineView: UIView!
    @IBOutlet weak var deleteBtn: UIButton!

    override func initUI() {
        deleteBtn.addTarget(self, action: #selector(deleteBtnTaps), for: .touchUpInside)
        linkTxtField.effectActivation(underlineView: underlineView, disposeBag: disposeBag)
    }
}
