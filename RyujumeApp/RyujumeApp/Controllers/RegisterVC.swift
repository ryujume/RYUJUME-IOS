//
//  JoinVC.swift
//  RyujumeApp
//
//  Created by baby1234 on 25/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit
import TextFieldEffects

class RegisterVC: UIViewController, RegisterProvider {

    @IBOutlet weak var idTxtField: HoshiTextField!
    @IBOutlet weak var pwTxtField: HoshiTextField!
    @IBOutlet weak var nameTxtField: HoshiTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pwTxtField.passwordRules = nil
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneBtnAction(_ sender: UIButton) {
        if isInfoFull() {
            postRegister(id: idTxtField.text!, pw: pwTxtField.text!, userName: nameTxtField.text!)
        }
    }
    
    func postRegister(id: String, pw: String, userName: String) {
        HTTPClient()
            .post(url: AuthAPI.postRegister.getPath(), params: ["id" : id, "pw" : pw, "userName" : userName], header: Header.tokenIsEmpty.getHeader())
            .responseJSON { (response) in
                switch response.response?.statusCode {
                case 200 :
                    DispatchQueue.main.async {
                        self.presentOkAlert(alertTitle: "류주메에 오신걸 환영해요!", alertMessage: nil)
                    }
                    return
                default :
                    DispatchQueue.main.async {
                        self.showToast(message: "회원가입 실패")
                    }
                    print(response.response?.statusCode as Any)
                    return
                }
        }
    }
    
    func isInfoFull() -> Bool {
        if idTxtField.text == "" || pwTxtField.text == "" || nameTxtField.text == "" {
            self.presentOkAlert(alertTitle: "모든 정보를 입력해주세요!", alertMessage: "확인")
            return false
        } else {
            return true
        }
    }
}
