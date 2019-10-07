//
//  LoginVC.swift
//  RyujumeApp
//
//  Created by baby1234 on 25/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class LoginVC: UIViewController {
    @IBOutlet weak var idTxtField: UITextField!
    @IBOutlet weak var pwTxtField: UITextField!
    @IBOutlet weak var idUnderlineView: UIView!
    @IBOutlet weak var pwUnderlineView: UIView!
    @IBOutlet weak var doneBtn: UIButton!

    private let disposeBag = DisposeBag()
    private let viewModel = LoginVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        loginCheck()
        bindViewModel()
        idTxtField.effectActivation(underlineView: idUnderlineView, disposeBag: disposeBag)
        pwTxtField.effectActivation(underlineView: pwUnderlineView, disposeBag: disposeBag)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    private func loginCheck() {
        if Token.token != nil {
            let mainTC = self.storyboard?.instantiateViewController(withIdentifier: "MainTC") as! UITabBarController
            self.present(mainTC, animated: false, completion: nil)
        }
    }

    private func bindViewModel() {
        let input = LoginVM.Input(userID: idTxtField.rx.text.orEmpty.asDriver(),
                                  userPW: pwTxtField.rx.text.orEmpty.asDriver(),
                                  loginTaps: doneBtn.rx.tap.asSignal())
        let output = viewModel.transform(input: input)

        output.infoCheck.filter { $0 == false }
            .drive(onNext: {[unowned self] _ in self.showCheckAlert(title: "로그인 정보 확인", message: "모두 4글자 이상 입력", completion: nil)})
            .disposed(by: disposeBag)

        output.result
            .filter { [unowned self] (result) -> Bool in
                if result == .failure {
                    self.showToast(message: "로그인 실패")
                    return false
                }
                return true
            }
            .drive(onNext: { [unowned self] _ in
                self.showCheckAlert(title: "회원가입 성공", message: nil, completion: { _ in
                    let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "MainTC") as! UITabBarController
                    self.present(loginVC, animated: true, completion: nil)
                })
            })
            .disposed(by: disposeBag)
    }

    @IBAction func registerBtnAction(_ sender: UIButton) {
        let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        self.navigationController?.pushViewController(registerVC, animated: true)
    }

}
