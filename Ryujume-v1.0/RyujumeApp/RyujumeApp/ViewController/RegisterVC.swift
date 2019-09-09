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
        let input = RegisterVM.Input(id: idTxtField.rx.text.orEmpty.asDriver(),
                                     pw: pwTxtField.rx.text.orEmpty.asDriver(),
                                     name: nameTxtField.rx.text.orEmpty.asDriver(),
                                     registerTaps: doneBtn.rx.tap.asSignal())
        let output = RegisterVM().transform(input: input)
        
        output.infoCheck.filter {$0 == false}
            .drive(onNext: { [unowned self] _ in self.presentOKAlert(title: "회원가입 정보를 확인", message: "모두 4글자 이상 입력", completion: nil) })
            .disposed(by: disposeBag)
        
        output.result
            .filter { [unowned self] (result) -> Bool in
                if result == .failure {
                    self.presentOKAlert(title: "회원가입에 실패", message: nil, completion: nil)
                    return false
                }
                return true
            }.drive(onNext: { [unowned self] _ in
                self.presentOKAlert(title: "회원가입 성공", message: nil, completion: {[unowned self] _ in self.goPreviousVC()})
            })
            .disposed(by: disposeBag)
    }
    
}
