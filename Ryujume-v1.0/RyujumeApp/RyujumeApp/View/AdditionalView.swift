//
//  AdditionalView.swift
//  RyujumeApp
//
//  Created by baby1234 on 12/09/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

class AdditionalView: UIView {
    let titleTxtField: RyujumeTextField = RyujumeTextField()
    let titleUnderlineView: UIView = UIView()
    let deleteBtn: UIButton = UIButton()

    var startDateBtn: UIButton! = nil
    var dashLbl: UILabel! = nil
    var endDateOrLevelBtn: UIButton! = nil
    var statusLbl: UILabel! = nil
    var statusBtn: UIButton! = nil

    init(stackView: UIStackView, viewType: ViewType) {
        super.init(frame: CGRect())

        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: stackView.frame.width).isActive = true

        switch viewType {
        case .career: createCareerView()
        case .academicBackground: createAcademicBackgroundView()
        case .prize: createPrizeView()
        case .foreignLanguage: createForeignLanguage()
        case .link: createLinkView()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initialConfigure(title: String, endDateOrLevel: String) {
        endDateOrLevelBtn = UIButton()
        titleTxtField.placeholder = title
        deleteBtn.setTitle("삭제", for: .normal)
        endDateOrLevelBtn.setTitle(endDateOrLevel, for: .normal)
        titleTxtField.font = UIFont.systemFont(ofSize: 14)
        deleteBtn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        endDateOrLevelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        deleteBtn.setTitleColor(Color.main1, for: .normal)
        endDateOrLevelBtn.setTitleColor(Color.main2, for: .normal)
        titleUnderlineView.backgroundColor = Color.main3

        self.addSubview(titleTxtField)
        self.addSubview(titleUnderlineView)
        self.addSubview(deleteBtn)
        self.addSubview(endDateOrLevelBtn)

        titleTxtField.translatesAutoresizingMaskIntoConstraints = false
        titleUnderlineView.translatesAutoresizingMaskIntoConstraints = false
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        endDateOrLevelBtn.translatesAutoresizingMaskIntoConstraints = false

        titleTxtField.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        titleTxtField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleTxtField.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: 32).isActive = true
        titleUnderlineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        titleUnderlineView.topAnchor.constraint(equalTo: titleTxtField.bottomAnchor).isActive = true
        titleUnderlineView.leadingAnchor.constraint(equalTo: titleTxtField.leadingAnchor).isActive = true
        titleUnderlineView.trailingAnchor.constraint(equalTo: titleTxtField.trailingAnchor).isActive = true
        deleteBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        deleteBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        endDateOrLevelBtn.trailingAnchor.constraint(equalTo: deleteBtn.trailingAnchor).isActive = true
        endDateOrLevelBtn.topAnchor.constraint(equalTo: deleteBtn.bottomAnchor, constant: 2).isActive = true
        titleTxtField.bottomAnchor.constraint(equalTo: endDateOrLevelBtn.bottomAnchor).isActive = true
        titleTxtField.trailingAnchor.constraint(lessThanOrEqualTo: endDateOrLevelBtn.leadingAnchor).isActive = true
    }

    private func createCareerView() {
        initialConfigure(title: "회사명*", endDateOrLevel: "종료일")
        createAllOption(status: "재직중인가요?*")
    }

    private func createAcademicBackgroundView() {
        initialConfigure(title: "학교명*", endDateOrLevel: "종료일")
        createAllOption(status: "재학중인가요?*")
    }

    private func createPrizeView() {
        initialConfigure(title: "수상명*", endDateOrLevel: "수상일")
        endDateOrLevelBtn.tag = 2
        self.bottomAnchor.constraint(equalTo: endDateOrLevelBtn.bottomAnchor).isActive = true
    }

    private func createForeignLanguage() {
        initialConfigure(title: "언어*", endDateOrLevel: "수준")
        endDateOrLevelBtn.tag = 3
        self.bottomAnchor.constraint(equalTo: endDateOrLevelBtn.bottomAnchor).isActive = true
    }

    private func createLinkView() {
        titleTxtField.placeholder = "링크*"
        deleteBtn.setTitle("삭제", for: .normal)
        titleTxtField.font = UIFont.systemFont(ofSize: 14)
        deleteBtn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        deleteBtn.setTitleColor(Color.main1, for: .normal)

        self.addSubview(titleTxtField)
        self.addSubview(deleteBtn)

        titleTxtField.translatesAutoresizingMaskIntoConstraints = false
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        titleTxtField.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        titleTxtField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleTxtField.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: 32).isActive = true
        deleteBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        deleteBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        self.bottomAnchor.constraint(equalTo: titleTxtField.bottomAnchor).isActive = true
    }

    private func createAllOption(status: String) {
        startDateBtn = UIButton()
        dashLbl = UILabel()
        statusLbl = UILabel()
        statusBtn = UIButton()

        startDateBtn.setTitle("시작일", for: .normal)
        dashLbl.text = "-"
        statusLbl.text = status
        statusBtn.setTitle("X", for: .normal)
        startDateBtn.tag = 0
        endDateOrLevelBtn.tag = 1

        statusLbl.font = UIFont.systemFont(ofSize: 12)
        startDateBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        dashLbl.font = UIFont.systemFont(ofSize: 12)
        statusBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        startDateBtn.setTitleColor(Color.main2, for: .normal)
        dashLbl.textColor = Color.main2
        statusBtn.setTitleColor(Color.main2, for: .normal)

        self.addSubview(startDateBtn)
        self.addSubview(dashLbl)
        self.addSubview(statusLbl)
        self.addSubview(statusBtn)

        startDateBtn.translatesAutoresizingMaskIntoConstraints = false
        dashLbl.translatesAutoresizingMaskIntoConstraints = false
        statusLbl.translatesAutoresizingMaskIntoConstraints = false
        statusBtn.translatesAutoresizingMaskIntoConstraints = false

        dashLbl.trailingAnchor.constraint(equalTo: endDateOrLevelBtn.leadingAnchor, constant: -4).isActive = true
        dashLbl.centerYAnchor.constraint(equalTo: endDateOrLevelBtn.centerYAnchor).isActive = true
        startDateBtn.trailingAnchor.constraint(equalTo: dashLbl.leadingAnchor, constant: -4).isActive = true
        startDateBtn.centerYAnchor.constraint(equalTo: dashLbl.centerYAnchor).isActive = true
        statusBtn.trailingAnchor.constraint(equalTo: endDateOrLevelBtn.trailingAnchor, constant: 8).isActive = true
        statusBtn.topAnchor.constraint(equalTo: endDateOrLevelBtn.bottomAnchor, constant: 4).isActive = true
        statusLbl.trailingAnchor.constraint(equalTo: statusBtn.leadingAnchor).isActive = true
        statusLbl.centerYAnchor.constraint(equalTo: statusBtn.centerYAnchor).isActive = true
        titleTxtField.bottomAnchor.constraint(equalTo: endDateOrLevelBtn.bottomAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: statusBtn.bottomAnchor).isActive = true
    }
}
