//
//  MyRyujumes.swift
//  RyujumeApp
//
//  Created by baby1234 on 25/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit
import TextFieldEffects
import SwiftyPickerPopover
import Kingfisher
import Alamofire

class MyRyujumeVC: UIViewController, MyRyujumeProvider {
    
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var identityImgView: UIImageView!
    @IBOutlet weak var addImgBtn: UIButton!
    @IBOutlet weak var phoneNumberTxtField: HoshiTextField!
    @IBOutlet weak var emailTxtField: HoshiTextField!
    @IBOutlet weak var simpleIntroduceTxtView: UITextView!
    @IBOutlet weak var simpleIntroducePlaceholderLbl: UILabel!
    
    @IBOutlet weak var careerView: UIView!
    @IBOutlet weak var academicBackgroundView: UIView!
    @IBOutlet weak var prizeView: UIView!
    @IBOutlet weak var foreignLanguageView: UIView!
    @IBOutlet weak var linkView: UIView!
    
    @IBOutlet weak var careerStackView: UIStackView!
    @IBOutlet weak var addCareerBtn: UIButton!
    
    @IBOutlet weak var academicBackgroundStackView: UIStackView!
    @IBOutlet weak var addAcademicBackgroundBtn: UIButton!
    
    @IBOutlet weak var prizeStackView: UIStackView!
    @IBOutlet weak var addPrizeBtn: UIButton!
    
    @IBOutlet weak var foreignLanguageStackView: UIStackView!
    @IBOutlet weak var addForeignLanguageBtn: UIButton!
    
    @IBOutlet weak var linkStackView: UIStackView!
    @IBOutlet weak var addLinkBtn: UIButton!
    
    let httpClient = HTTPClient()
    let imgPicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        simpleIntroduceTxtView.delegate = self
        imgPicker.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getMyRyujume()
    }
    
    @IBAction func addCareerBtnAction(_ sender: UIButton) {
        addAddView(stateOfButton: .career, stackView: careerStackView)
    }
    
    @IBAction func addAcademicBackgroundBtnAction(_ sender: UIButton) {
        addAddView(stateOfButton: .academicBackground, stackView: academicBackgroundStackView)
    }
    
    @IBAction func addPrizeBtnAction(_ sender: UIButton) {
        addAddView(stateOfButton: .prize, stackView: prizeStackView)
    }
    
    @IBAction func addForeignLanguageBtnAction(_ sender: UIButton) {
        addAddView(stateOfButton: .foreignLanguage, stackView: foreignLanguageStackView)
    }
    
    @IBAction func addLinkBtnAction(_ sender: UIButton) {
        addAddView(stateOfButton: .link, stackView: linkStackView)
    }
    
    @IBAction func logoutBtnAction(_ sender: UIButton) {
        presentYesOrNoAlert(alertTitle: "정말 로그아웃??", alertMessage: nil, yesHandler: { [weak self] action in
            guard let strongSelf = self else { return }
            Token.remove()
            strongSelf.goVC(id: "AuthNC")
            }, noHandler: nil)
    }
    
    @IBAction func saveBtnAction(_ sender: UIButton) {
        if isInfoFull() {
            putUpdateRyujume(putMyRyujumeIntoModel())
            guard let img = identityImgView.image else { return }
            guard let imageData = img.jpegData(compressionQuality: 0.1) else { return }
            let encodedImageDataString = imageData.base64EncodedString(options: [])
            postUpdateIdentityImg(identityImg: encodedImageDataString)
        }
    }
    
    @IBAction func addIdentityImgBtnAction(_ sender: UIButton) {
        presentYesOrNoAlert(alertTitle: "사진앨범에서 증명사진을 가져오시겠어요?", alertMessage: "정식규격\n가로 3.5, 세로 4.5 비율에 맞춰주세요", yesHandler: { [weak self] (action) in
            guard let strongSelf = self else { return }
            strongSelf.openLibrary()
            }, noHandler: nil)
    }
    
    func postUpdateIdentityImg(identityImg: String) {
        httpClient
            .post(url: MyPageAPI.postUpdateIdentityImg.getPath(), params: ["profileImg" : identityImg], header: Header.tokenIsExist.getHeader())
            .responseJSON(completionHandler: { [weak self] (response) in
                guard let strongSelf = self else { return }

                switch response.response?.statusCode {
                case 200,204 :
                    DispatchQueue.main.async {
                        strongSelf.showToast(message: "이미지저장완료!")
                    }
                    return
                default :
                    DispatchQueue.main.async {
                        strongSelf.showToast(message: "이미지저장실패")
                    }
                    return
                }
            })
    }
    
    func putUpdateRyujume(_ ryujume: RyujumeModel) {
        guard let param = try? JSONEncoder().encode(ryujume), let params = param.toDictionary() else { return }
        
        httpClient
            .put(url: MyPageAPI.putUpdateRyujume.getPath(), params: params, header: Header.tokenIsExist.getHeader())
            .responseJSON(completionHandler: { [weak self] (response) in
                guard let strongSelf = self else { return }
                
                switch response.response?.statusCode {
                case 200,204 :
                    DispatchQueue.main.async {
                        strongSelf.showToast(message: "저장완료!")
                    }
                    return
                default :
                    DispatchQueue.main.async {
                        strongSelf.showToast(message: "저장실패")
                    }
                    print(response.response?.statusCode as Any)
                    return
                }
            })
    }
    
    func getMyRyujume() {
        httpClient
            .get(url: MyPageAPI.getMyRyujume.getPath(), params: nil, header: Header.tokenIsExist.getHeader())
            .responseJSON(completionHandler: { [weak self] (response) in
                guard let strongSelf = self else { return }
                
                switch response.response?.statusCode {
                case 200 :
                    guard let value = response.data else { return }
                    guard let model = try? JSONDecoder().decode(RyujumeModel.self, from: value) else { return }
                    DispatchQueue.main.async {
                        strongSelf.putDataIntoMyRyujumeFromModel(ryujume: model)
                        if strongSelf.simpleIntroduceTxtView.text == "" {
                            strongSelf.simpleIntroducePlaceholderLbl.isHidden = false
                        } else {
                            strongSelf.simpleIntroducePlaceholderLbl.isHidden = true
                        }
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
    
    func putDataIntoMyRyujumeFromModel(ryujume: RyujumeModel) {
        nameLbl.text = ryujume.userName
        phoneNumberTxtField.text = ryujume.phoneNumber
        emailTxtField.text = ryujume.email
        simpleIntroduceTxtView.text = ryujume.simpleIntroduce
        putMoreInfoToAddStackView(ryujume: ryujume, careerStackView: careerStackView, academicBackgroundStackView: academicBackgroundStackView, prizeStackView: prizeStackView, foreignLanguageStackView: foreignLanguageStackView, linkStackView: linkStackView)
        guard let identityImg = ryujume.identityImg else { return }
        identityImgView.kf.setImage(with: URL(string: identityImg))
    }
    
    func putMyRyujumeIntoModel() -> RyujumeModel {
        return RyujumeModel(userName: nameLbl.text!,
                            identityImg: identityImgView.image?.jpegData(compressionQuality: 1)?.base64EncodedString(),
                            phoneNumber: phoneNumberTxtField.text!,
                            email: emailTxtField.text!,
                            simpleIntroduce: simpleIntroduceTxtView.text!,
                            career: careerIntoModel(careerStackView: careerStackView),
                            academicBackground: academicBackgroundIntoModel(academicBackgroundStackView: academicBackgroundStackView),
                            prize: prizeIntoModel(prizeStackView: prizeStackView),
                            foreignLanguage: foreignLanguageIntoModel(foreignLanguageStackView: foreignLanguageStackView),
                            link: linkIntoModel(linkStackView: linkStackView),
                            isLiked: false)
    }
    
    func isInfoFull() -> Bool {
        if phoneNumberTxtField.text == "" || emailTxtField.text == "" || simpleIntroduceTxtView.text == "" {
            self.presentOkAlert(alertTitle: "필수정보를 모두 입력해주세요!", alertMessage: nil)
            return false
        } else {
            if !self.isMoreInfoFull(careerStackView: careerStackView, academicBackgroundStackView: academicBackgroundStackView, prizeStackView: prizeStackView, foreignLanguageStackView: foreignLanguageStackView, linkStackView: linkStackView) {
                self.presentOkAlert(alertTitle: "추가정보의 필수입력란을 모두 입력해주세요!", alertMessage: nil)
                return false
            } else {
                return true
            }
        }
    }
}

extension MyRyujumeVC: UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        simpleIntroducePlaceholderLbl.isHidden = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            simpleIntroducePlaceholderLbl.isHidden = false
        }
    }
    
    func openLibrary() {
        imgPicker.sourceType = .photoLibrary
        present(imgPicker, animated: false, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            identityImgView.image = image
            addImgBtn.isHidden = true
        } else {
            showToast(message: "이미지를 불러오는데 실패했습니다")
        }
        dismiss(animated: true, completion: nil)
    }
}
