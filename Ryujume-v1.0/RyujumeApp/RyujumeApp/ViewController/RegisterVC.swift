//
//  JoinVC.swift
//  RyujumeApp
//
//  Created by baby1234 on 25/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class RegisterVC: UIViewController {

    @IBOutlet weak var idTxtField: UITextField!
    @IBOutlet weak var pwTxtField: UITextField!
    @IBOutlet weak var nameTxtField: UITextField!
    
    @IBOutlet weak var idUnderlineView: UIView!
    @IBOutlet weak var pwUnderlineView: UIView!
    @IBOutlet weak var nameUnderlineView: UIView!
    
    @IBOutlet weak var doneBtn: UIButton!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func bindViewModel() {
        let input = RegisterVM.input(id: idTxtField.rx.text.orEmpty.asDriver(),
                                     pw: pwTxtField.rx.text.orEmpty.asDriver(),
                                     name: nameTxtField.rx.text.orEmpty.asDriver(),
                                     registerTaps: doneBtn.rx.tap.asSignal())
        let output = RegisterVM().transform(input: input)
        
        output.registerInfoCheck.filter {$0 == false}
            .drive(onNext: { [unowned self] _ in self.presentOKAlert(title: "회원가입 정보를 확인해주세요", message: nil) })
            .disposed(by: disposeBag)
        
        output.registerResult
            .filter { [unowned self] (result) -> Bool in
                if result == .failure {
                    self.presentOKAlert(title: "회원가입에 실패했습니다", message: nil)
                    return false
                }
                return true
            }.drive(onNext: { [unowned self] _ in
                self.presentOKAlert(title: "회원가입 성공", message: "로그인화면으로 돌아가\n 로그인해주세요")
            })
            .disposed(by: disposeBag)
    }
    
}
