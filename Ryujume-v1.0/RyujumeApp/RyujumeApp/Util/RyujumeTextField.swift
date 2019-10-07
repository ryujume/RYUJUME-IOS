//
//  RyujumeTextField.swift
//  RyujumeApp
//
//  Created by baby1234 on 12/09/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

final class RyujumeTextField: UITextField {
    private let underlineView = UIView()
    private let disposeBag = DisposeBag()
    init() {
        super.init(frame: CGRect())
        self.borderStyle = .none
        self.underlineView.translatesAutoresizingMaskIntoConstraints = false
        self.underlineView.backgroundColor = Color.main3
        self.underlineView.tintColor = Color.main3
        self.underlineView.heightAnchor.constraint(equalToConstant: 0.5)
        self.underlineView.topAnchor.constraint(equalTo: self.bottomAnchor)
        self.underlineView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        self.underlineView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        self.addSubview(underlineView)
        self.effectActivation(underlineView: self.underlineView, disposeBag: disposeBag)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
