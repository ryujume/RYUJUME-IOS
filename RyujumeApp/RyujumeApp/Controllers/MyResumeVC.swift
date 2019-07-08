//
//  MyResume.swift
//  RyujumeApp
//
//  Created by baby1234 on 25/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit
import TextFieldEffects

class MyResumeVC: UIViewController {
    
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var identityImgView: UIImageView!
    @IBOutlet weak var phoneNumberTxtField: HoshiTextField!
    @IBOutlet weak var emailTxtField: HoshiTextField!
    @IBOutlet weak var simpleIntroduceTxtView: roundTxtView!
    
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
        viewArr.addCareerViewArray.append(newView)
    }
    @IBAction func addAcademicBackgroundBtnAction(_ sender: UIButton) {
        viewArr.addAcademicBackgroundViewArray = Array<AddAcademicBackgroundView>()
        guard let newView = self.addView(stateOfButton: .academicBackground, stackView: academicBackgroundStackView) as? AddAcademicBackgroundView else {return}
        viewArr.addAcademicBackgroundViewArray.append(newView)
    }
    @IBAction func addPrizeAndOthersBtnAction(_ sender: UIButton) {
        viewArr.addPrizeAndOthersViewArray = Array<AddPrizeAndOthersView>()
        guard let newView = self.addView(stateOfButton: .prizeAndOthers, stackView: prizeAndOthersStackView) as? AddPrizeAndOthersView else {return}
        viewArr.addPrizeAndOthersViewArray.append(newView)
    }
    @IBAction func addForeignLanguageBtnAction(_ sender: UIButton) {
        viewArr.addForeignLanguageViewArray = Array<AddForeignLanguageView>()
        guard let newView = self.addView(stateOfButton: .foreignLanguage, stackView: foreignLanguageStackView) as? AddForeignLanguageView else {return}
        viewArr.addForeignLanguageViewArray.append(newView)
    }
    @IBAction func addLinkBtnAction(_ sender: Any) {
        viewArr.addLinkViewArray = Array<AddLinkView>()
        guard let newView = self.addView(stateOfButton: .link, stackView: linkStackView) as? AddLinkView else {return}
        viewArr.addLinkViewArray.append(newView)
    }
}
