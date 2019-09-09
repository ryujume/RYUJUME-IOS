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

class LoginVC: UIViewController{

    @IBOutlet weak var idTxtField: UITextField!
    @IBOutlet weak var pwTxtField: UITextField!
    
    @IBOutlet weak var idUnderlineView: UIView!
    @IBOutlet weak var pwUnderlineView: UIView!
    
    @IBOutlet weak var doneBtn: UIButton!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func bindViewModel() {
        let input = LoginVM.Input(id: idTxtField.rx.text.orEmpty.asDriver(),
                                  pw: pwTxtField.rx.text.orEmpty.asDriver(),
                                  loginTaps: doneBtn.rx.tap.asSignal())
        let output = LoginVM().transform(input: input)
        
        output.infoCheck.filter{$0 == false}
            .drive(onNext: {[unowned self] _ in self.presentOKAlert(title: "로그인 정보 확인", message: "모두 4글자 이상 입력", completion: nil)})
            .disposed(by: disposeBag)
        
        output.result
            .filter { [unowned self] (result) -> Bool in
                if result == .failure {
                    self.presentOKAlert(title: "로그인 실패", message: nil, completion: nil)
                    return false
                }
                return true
            }.drive(onNext: { [unowned self] _ in
                self.presentOKAlert(title: "회원가입 성공", message: nil, completion: {[unowned self] _ in
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainTC") as! UITabBarController
                    self.present(vc, animated: true, completion: nil)
                })
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func joinBtnAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
