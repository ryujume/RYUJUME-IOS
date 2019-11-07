//
//  LoginVC.swift
//  RyujumeApp
//
//  Created by baby1234 on 25/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit
import TextFieldEffects

class LoginVC: UIViewController, LoginProvider{

    @IBOutlet weak var idTxtField: HoshiTextField!
    @IBOutlet weak var pwTxtField: HoshiTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pwTxtField.passwordRules = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func doneBtnAction(_ sender: UIButton) {
        if isInfoFull() {
            postLogin(id: idTxtField.text!, pw: pwTxtField.text!)
        }
    }

    func postLogin(id: String, pw: String) {
        let httpClient = HTTPClient()
        
        httpClient
            .post(url: AuthAPI.postLogin.getPath(), params: ["id" : id, "pw" : pw], header: Header.tokenIsEmpty.getHeader())
            .responseJSON(completionHandler: { [weak self] (response) in
                guard let strongSelf = self else { return }
                
                switch response.response?.statusCode {
                case 200 :
                    guard let value = response.data else { return }
                    guard let model = try? JSONDecoder().decode(LoginModel.self, from: value) else { return }
                    Token.token = model.token
                    DispatchQueue.main.async {
                        strongSelf.goVC(id: "MainTC")
                    }
                    return
                default :
                    DispatchQueue.main.async {
                        strongSelf.presentOkAlert(alertTitle: "로그인실패", alertMessage: "아이디와 비밀번호를 확인해주세요")
                    }
                    print(response.response?.statusCode as Any)
                    return
                }
                
            })
    }
    
    func isInfoFull() -> Bool {
        if idTxtField.text == "" || pwTxtField.text == "" {
            self.presentOkAlert(alertTitle: "모든 정보를 입력해주세요!", alertMessage: nil)
            return false
        } else {
            return true
        }
    }
}
