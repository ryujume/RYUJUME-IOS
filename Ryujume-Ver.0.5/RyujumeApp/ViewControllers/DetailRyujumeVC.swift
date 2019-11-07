//
//  DetailResumeVC.swift
//  RyujumeApp
//
//  Created by baby1234 on 25/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

class DetailRyujumeVC: UIViewController, DetailRyujumeProvider {
    
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
    @IBOutlet weak var academicBackgroundStackView: UIStackView!
    
    @IBOutlet weak var prizeView: UIView!
    @IBOutlet weak var prizeStackView: UIStackView!
    
    @IBOutlet weak var foreignLanguageView: UIView!
    @IBOutlet weak var foreignLanguageStackView: UIStackView!
    
    @IBOutlet weak var linkView: UIView!
    @IBOutlet weak var linkStackView: UIStackView!
    
    var ryujumeId = String()
    var isLiked = Bool()
    let httpClient = HTTPClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isLiked == true {
            likeBtn.isSelected = true
        } else {
            likeBtn.isSelected = false
        }
        getDetailRyujume()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func likeBtnAction(_ sender: UIButton) {

    }
    
    func getDetailRyujume() {
        httpClient
            .get(url: MainAPI.getLDetailRyujume(ryujumeId: ryujumeId).getPath(), params: nil, header: Header.tokenIsExist.getHeader())
            .responseJSON(completionHandler: { [weak self] (response) in
                guard let strongSelf = self else { return }
                
                switch response.response?.statusCode {
                case 200 :
                    guard let value = response.data else { return }
                    guard let model = try? JSONDecoder().decode(RyujumeModel.self, from: value) else { return }
                    DispatchQueue.main.async {
                        strongSelf.putDataIntoRyujumeFromModel(ryujume: model)
                    }
                    return
                default :
                    DispatchQueue.main.async {
                        strongSelf.showToast(message: "류주메 불러오기 실패")
                    }
                    print(response.response?.statusCode as Any)
                    return
                }
            })
    }
    
    func putDataIntoRyujumeFromModel(ryujume: RyujumeModel) {
        nameLbl.text = ryujume.userName
        phoneNumberLbl.text = ryujume.phoneNumber
        emailLbl.text = ryujume.email
        simpleIntroduceTxtView.text = ryujume.simpleIntroduce
        if ryujume.isLiked == true {
            likeBtn.isSelected = true
        } else {
            likeBtn.isSelected = false
        }
        putMoreInfoToAddStackView(ryujume: ryujume, careerStackView: careerStackView, academicBackgroundStackView: academicBackgroundStackView, prizeStackView: prizeStackView, foreignLanguageStackView: foreignLanguageStackView, linkStackView: linkStackView)
        guard let identityImg = ryujume.identityImg else { return }
        identityImgView.kf.setImage(with: URL(string: identityImg), placeholder: nil, options: nil) { (result) in
            switch result {
            case .success(let success) :
                print(success)
            case .failure(let failure) :
                print(failure)
            }
        }
    }

}
