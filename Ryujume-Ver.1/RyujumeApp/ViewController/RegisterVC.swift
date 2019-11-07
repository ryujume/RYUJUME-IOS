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
    private let viewModel = RegisterVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()

        idTxtField.effectActivation(underlineView: idUnderlineView, disposeBag: disposeBag)
        pwTxtField.effectActivation(underlineView: pwUnderlineView, disposeBag: disposeBag)
        nameTxtField.effectActivation(underlineView: nameUnderlineView, disposeBag: disposeBag)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

    private func bindViewModel() {
        let input = RegisterVM.Input(userID: idTxtField.rx.text.orEmpty.asDriver(),
                                     userPW: pwTxtField.rx.text.orEmpty.asDriver(),
                                     userName: nameTxtField.rx.text.orEmpty.asDriver(),
                                     registerTaps: doneBtn.rx.tap.asSignal())
        let output = viewModel.transform(input: input)

        output.infoCheck.filter {$0 == .failure}
            .drive(onNext: { [unowned self] _ in self.showCheckAlert(title: "회원가입 정보 확인", message: "모두 4글자 이상 입력", completion: nil) })
            .disposed(by: disposeBag)

        output.result
            .filter { [unowned self] (result) -> Bool in
                if result == .failure {
                    self.showToast(message: "회원가입 실패")
                    return false
                }
                return true
            }
            .drive(onNext: { [unowned self] _ in
                self.showCheckAlert(title: "회원가입 성공", message: nil, completion: { _ in self.goPreviousVC()})
            })
            .disposed(by: disposeBag)
    }
}
