//
//  MyResume.swift
//  RyujumeApp
//
//  Created by baby1234 on 25/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit
import TextFieldEffects
import SwiftyPickerPopover

class MyResumeVC: UIViewController {
    
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var identityImgView: UIImageView!
    @IBOutlet weak var phoneNumberTxtField: HoshiTextField!
    @IBOutlet weak var emailTxtField: HoshiTextField!
    @IBOutlet weak var simpleIntroduceTxtView: UITextView!
    
    @IBOutlet weak var careerView: UIView!
    @IBOutlet weak var academicBackgroundView: UIView!
    @IBOutlet weak var prizeAndOthersView: UIView!
    @IBOutlet weak var foreignLanguageView: UIView!
    @IBOutlet weak var linkView: UIView!
    
    @IBOutlet weak var careerStackView: UIStackView!
    @IBOutlet weak var addCareerBtn: UIButton!
    
    @IBOutlet weak var academicBackgroundStackView: UIStackView!
    @IBOutlet weak var addAcademicBackgroundBtn: UIButton!
    
    @IBOutlet weak var prizeAndOthersStackView: UIStackView!
    @IBOutlet weak var addPrizeAndOthersBtn: UIButton!
    
    @IBOutlet weak var foreignLanguageStackView: UIStackView!
    @IBOutlet weak var addForeignLanguageBtn: UIButton!
    
    @IBOutlet weak var linkStackView: UIStackView!
    @IBOutlet weak var addLinkBtn: UIButton!
    
    let viewArr = ViewArrayInStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addCareerBtnAction(_ sender: UIButton) {
        viewArr.addCareerViewArray = Array<AddCareerView>()
        guard let newView = self.addView(stateOfButton: .career, stackView: careerStackView) as? AddCareerView else {return}
        newView.startDateBtn.addTarget(self, action: #selector(tapedDateBtn), for: .touchUpInside)
        newView.endDateBtn.addTarget(self, action: #selector(tapedDateBtn), for: .touchUpInside)
        viewArr.addCareerViewArray.append(newView)
    }
    
    @IBAction func addAcademicBackgroundBtnAction(_ sender: UIButton) {
        viewArr.addAcademicBackgroundViewArray = Array<AddAcademicBackgroundView>()
        guard let newView = self.addView(stateOfButton: .academicBackground, stackView: academicBackgroundStackView) as? AddAcademicBackgroundView else {return}
        newView.startDateBtn.addTarget(self, action: #selector(tapedDateBtn), for: .touchUpInside)
        newView.endDateBtn.addTarget(self, action: #selector(tapedDateBtn), for: .touchUpInside)
        viewArr.addAcademicBackgroundViewArray.append(newView)
    }
    
    @IBAction func addPrizeAndOthersBtnAction(_ sender: UIButton) {
        viewArr.addPrizeAndOthersViewArray = Array<AddPrizeAndOthersView>()
        guard let newView = self.addView(stateOfButton: .prizeAndOthers, stackView: prizeAndOthersStackView) as? AddPrizeAndOthersView else {return}
        newView.prizedDateBtn.addTarget(self, action: #selector(tapedDateBtn), for: .touchUpInside)
        viewArr.addPrizeAndOthersViewArray.append(newView)
    }
    
    @IBAction func addForeignLanguageBtnAction(_ sender: UIButton) {
        viewArr.addForeignLanguageViewArray = Array<AddForeignLanguageView>()
        guard let newView = self.addView(stateOfButton: .foreignLanguage, stackView: foreignLanguageStackView) as? AddForeignLanguageView else {return}
        newView.levelBtn.addTarget(self, action: #selector(tapedDateBtn), for: .touchUpInside)
        viewArr.addForeignLanguageViewArray.append(newView)
    }
    
    @IBAction func addLinkBtnAction(_ sender: Any) {
        viewArr.addLinkViewArray = Array<AddLinkView>()
        guard let newView = self.addView(stateOfButton: .link, stackView: linkStackView) as? AddLinkView else {return}
        viewArr.addLinkViewArray.append(newView)
    }
    
    @objc func tapedDateBtn(sender: UIButton) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY.MM"
        
        if sender.tag == 0 {
            DatePickerPopover(title: "시작일")
                .setDateMode(.date)
                .setSelectedDate(Date())
                .setDoneButton { (popover, selectedDate) in
                    sender.setTitle(formatter.string(from: selectedDate), for: .normal)}
                .appear(originView: sender, baseViewController: self)
        } else if sender.tag == 1{
            DatePickerPopover(title: "마지막일")
                .setDateMode(.date)
                .setSelectedDate(Date())
                .setDoneButton { (popover, selectedDate) in
                    sender.setTitle(formatter.string(from: selectedDate), for: .normal)}
                .appear(originView: sender, baseViewController: self)
        } else if sender.tag == 2{
            DatePickerPopover(title: "수상일")
                .setDateMode(.date)
                .setSelectedDate(Date())
                .setDoneButton { (popover, selectedDate) in
                    sender.setTitle(formatter.string(from: selectedDate), for: .normal)}
                .appear(originView: sender, baseViewController: self)
        } else {
            StringPickerPopover(title: "수준", choices: ["유창함", "비즈니스회화", "일상회화"])
                .setDoneButton { (popover, selectedRow, selectedString) in
                    sender.setTitle(selectedString, for: .normal)
                }
                .appear(originView: sender, baseViewController: self)
        }
    }
}
