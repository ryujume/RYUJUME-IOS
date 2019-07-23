//
//  DetailResumeVC.swift
//  RyujumeApp
//
//  Created by baby1234 on 25/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

class DetailResumeVC: UIViewController {
    
    @IBOutlet weak var likeBtn: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var identityImgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var simpleIntroduceTxtView: UITextView!
    
    @IBOutlet weak var careerView: UIView!
    @IBOutlet weak var careerStackView: UIStackView!
    @IBOutlet weak var careerNotWriteLbl: UILabel!
    
    @IBOutlet weak var academicBackgroundView: UIView!
    @IBOutlet weak var academicStackView: UIStackView!
    @IBOutlet weak var academicBackgroundNotWriteLbl: UILabel!
    
    @IBOutlet weak var prizeView: UIView!
    @IBOutlet weak var prizeStackView: UIStackView!
    @IBOutlet weak var prizeNotWriteLbl: UILabel!
    
    @IBOutlet weak var foreignLanguageView: UIView!
    @IBOutlet weak var foreignLanguageStackView: UIStackView!
    @IBOutlet weak var foreignLanguageNotWriteLbl: UILabel!
    
    @IBOutlet weak var linkView: UIView!
    @IBOutlet weak var linkStackView: UIStackView!
    @IBOutlet weak var linkNotWriteLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
