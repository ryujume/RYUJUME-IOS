//
//  MyRyujumes.swift
//  RyujumeApp
//
//  Created by baby1234 on 25/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa
import SwiftyPickerPopover

class MyRyujumeVC: UIViewController {
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var identityImgView: UIImageView!
    @IBOutlet weak var addImgBtn: UIButton!
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var phoneNumberUnderlineView: UIView!
    @IBOutlet weak var emailUnderlineView: UIView!
    @IBOutlet weak var simpleIntroduceTxtView: UITextView!
    @IBOutlet weak var simpleIntroducePlaceholderLbl: UILabel!

    @IBOutlet weak var careerView: UIView!
    @IBOutlet weak var academicBackgroundView: UIView!
    @IBOutlet weak var prizeView: UIView!
    @IBOutlet weak var foreignLanguageView: UIView!
    @IBOutlet weak var linkView: UIView!

    @IBOutlet weak var careerStackView: UIStackView!
    @IBOutlet weak var academicBackgroundStackView: UIStackView!
    @IBOutlet weak var prizeStackView: UIStackView!
    @IBOutlet weak var foreignLanguageStackView: UIStackView!
    @IBOutlet weak var linkStackView: UIStackView!

    @IBOutlet weak var addCareerBtn: UIButton!
    @IBOutlet weak var addAcademicBackgroundBtn: UIButton!
    @IBOutlet weak var addPrizeBtn: UIButton!
    @IBOutlet weak var addForeignLanguageBtn: UIButton!
    @IBOutlet weak var addLinkBtn: UIButton!

    private let disposeBag = DisposeBag()
    private let viewModel = MyRyujumeVM()

    override func viewDidLoad() {
        super.viewDidLoad()
//        bindViewModel()
        subscribeUIEvent()
        emailTxtField.effectActivation(underlineView: emailUnderlineView, disposeBag: disposeBag)
        phoneNumberTxtField.effectActivation(underlineView: phoneNumberUnderlineView, disposeBag: disposeBag)
    }

    private func bindViewModel() {
        let career = BehaviorRelay<[MyCareer]?>(value: nil)
        let academicBackground = BehaviorRelay<[MyAcademicBackground]?>(value: nil)
        let prize = BehaviorRelay<[MyPrize]?>(value: nil)
        let foreignLangyage = BehaviorRelay<[MyForeignLanguage]?>(value: nil)
        let link = BehaviorRelay<[String]?>(value: nil)


    }

    private func career() {
        var myCareer = MyCareer()
        careerStackView.arrangedSubviews.forEach { (view) in
            guard let view = view as? MyCareerView else { return }
        }
    }
}

extension MyRyujumeVC {

    private func subscribeUIEvent() {
        addCareerBtn.rx.tap.subscribe { [unowned self] (_) in
            self.addAdditionalView(stackView: self.careerStackView, viewType: .career)
        }.disposed(by: disposeBag)

        addAcademicBackgroundBtn.rx.tap.subscribe { [unowned self] (_) in
            self.addAdditionalView(stackView: self.academicBackgroundStackView, viewType: .academicBackground)
        }.disposed(by: disposeBag)

        addPrizeBtn.rx.tap.subscribe { [unowned self] (_) in
            self.addAdditionalView(stackView: self.prizeStackView, viewType: .prize)
        }.disposed(by: disposeBag)

        addForeignLanguageBtn.rx.tap.subscribe { [unowned self] (_) in
            self.addAdditionalView(stackView: self.foreignLanguageStackView, viewType: .foreignLanguage)
        }.disposed(by: disposeBag)

        addLinkBtn.rx.tap.subscribe { [unowned self] (_) in
            self.addAdditionalView(stackView: self.linkStackView, viewType: .link)
        }.disposed(by: disposeBag)

        simpleIntroduceTxtView.rx.didBeginEditing.subscribe { [unowned self] (_) in
            self.simpleIntroducePlaceholderLbl.isHidden = true
        }.disposed(by: disposeBag)

        simpleIntroduceTxtView.rx.didEndEditing.subscribe { [unowned self] (_) in
            self.simpleIntroducePlaceholderLbl.isHidden = false
        }.disposed(by: disposeBag)
    }

    private func addAdditionalView(stackView: UIStackView, viewType: ViewType) {
        let idx = stackView.arrangedSubviews.count - 1
        var newView: XibView

        switch viewType {
        case .career:
            newView = MyCareerView()
            if let view = newView as? MyCareerView {
                view.startDateBtn.addTarget(self, action: #selector(dateAndLevelBtnTaps), for: .touchUpInside)
                view.endDateBtn.addTarget(self, action: #selector(dateAndLevelBtnTaps), for: .touchUpInside)
            }
        case .academicBackground:
            newView = MyAcademicBackgroundView()
            if let view = newView as? MyAcademicBackgroundView {
                view.startDateBtn.addTarget(self, action: #selector(dateAndLevelBtnTaps), for: .touchUpInside)
                view.endDateBtn.addTarget(self, action: #selector(dateAndLevelBtnTaps), for: .touchUpInside)
            }
        case .prize:
            newView = MyPrizeView()
            if let view = newView as? MyPrizeView {
                view.prizeDateBtn.addTarget(self, action: #selector(dateAndLevelBtnTaps), for: .touchUpInside)
            }
        case .foreignLanguage:
            newView = MyForeignLanguageView()
            if let view = newView as? MyForeignLanguageView {
                view.levelBtn.addTarget(self, action: #selector(dateAndLevelBtnTaps), for: .touchUpInside)
            }
        case .link:
            newView = MyLinkView()
        }

        newView.initUI()
        newView.isHidden = true
        stackView.insertArrangedSubview(newView, at: idx)
        UIView.animate(withDuration: 0) { newView.isHidden = false }

    }

    @objc func dateAndLevelBtnTaps(sender: UIButton) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY.MM"

        switch sender.tag {
        case 0:
            DatePickerPopover(title: "시작일")
                .setDateMode(.date)
                .setSelectedDate(Date())
                .setDoneButton { (_, selectedDate) in sender.setTitle(formatter.string(from: selectedDate), for: .normal)}
                .appear(originView: sender, baseViewController: self)
        case 1:
            DatePickerPopover(title: "종료일")
                .setDateMode(.date)
                .setSelectedDate(Date())
                .setDoneButton { (_, selectedDate) in sender.setTitle(formatter.string(from: selectedDate), for: .normal)}
                .appear(originView: sender, baseViewController: self)
        case 2:
            DatePickerPopover(title: "수상일")
                .setDateMode(.date)
                .setSelectedDate(Date())
                .setDoneButton { (_, selectedDate) in sender.setTitle(formatter.string(from: selectedDate), for: .normal)}
                .appear(originView: sender, baseViewController: self)
        default:
            StringPickerPopover(title: "수준", choices: ["유창함", "비즈니스회화", "일상회화"])
                .setDoneButton { (_, _, selectedString) in sender.setTitle(selectedString, for: .normal)}
                .appear(originView: sender, baseViewController: self)
        }
    }

}
