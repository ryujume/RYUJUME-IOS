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
    @IBOutlet weak var addCareerBtn: UIButton!
    
    @IBOutlet weak var academicBackgroundView: UIView!
    @IBOutlet weak var addAcademicBackgroundBtn: UIButton!
    
    @IBOutlet weak var prizeAndOtherView: UIView!
    @IBOutlet weak var addPrizeAndOtherBtn: UIButton!
    
    @IBOutlet weak var foreignLanguageView: UIView!
    @IBOutlet weak var addForeignLanguageBtn: UIButton!
    
    @IBOutlet weak var linkView: UIView!
    @IBOutlet weak var addLinkBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

}
