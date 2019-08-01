//
//  Base.swift
//  RyujumeApp
//
//  Created by baby1234 on 25/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit
import SwiftyPickerPopover
import Alamofire

extension UIViewController {
    
    func networkCheck() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    func loginCheck() -> Bool {
        if Token.token == nil {
            return false
        } else {
            return true
        }
    }
    
    func goVC(id: String) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: id) else { return }
        self.present(vc, animated: true, completion: nil)
    }
    
    func presentYesOrNoAlert(alertTitle: String?, alertMessage: String?, yesHandler: ((UIAlertAction) -> Void)? = nil, noHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "예", style: .default, handler: yesHandler))
        alert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: noHandler))
        present(alert, animated: true, completion: nil)
    }
    
    func presentOkAlert(alertTitle: String?, alertMessage: String?) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showToast(message: String) {
        let toast = UILabel(frame: CGRect(x: 40, y: view.frame.height - 200, width: view.frame.size.width - 80, height: 40))
        toast.backgroundColor = Color.main3.getColor()
        toast.textAlignment = NSTextAlignment.center
        view.addSubview(toast)
        
        toast.text = message
        toast.font = UIFont.appBoldFontWith(size: 15)
        toast.alpha = 0.5
        toast.layer.cornerRadius = toast.frame.height / 2
        toast.clipsToBounds = true
        
        UIView.animate(withDuration: 1, delay: 1, animations: {
            toast.alpha = 0.0
        }, completion: { _ in
            toast.removeFromSuperview()
        })
    }
    
    func addAddView(stateOfButton state : MoreInfomation, stackView: UIStackView){
        let idx = stackView.arrangedSubviews.count - 1
        
        switch state {
        case .career:
            let newView = AddCareerView()
            newView.configureView(addStackView: stackView, defaultFontSize: 17)
            newView.isHidden = true
            
            stackView.insertArrangedSubview(newView, at: idx)
            
            UIView.animate(withDuration: 0) {
                newView.isHidden = false
            }
            
            newView.startDateBtn.addTarget(self, action: #selector(tapedDateBtn), for: .touchUpInside)
            newView.endDateBtn.addTarget(self, action: #selector(tapedDateBtn), for: .touchUpInside)
            
            return
        case .academicBackground:
            let newView = AddAcademicBackgroundView()
            newView.configureView(addStackView: stackView, defaultFontSize: 17)
            newView.isHidden = true
            
            stackView.insertArrangedSubview(newView, at: idx)
            
            UIView.animate(withDuration: 0) {
                newView.isHidden = false
            }
            
            newView.startDateBtn.addTarget(self, action: #selector(tapedDateBtn), for: .touchUpInside)
            newView.endDateBtn.addTarget(self, action: #selector(tapedDateBtn), for: .touchUpInside)
            
            return
        case .prize:
            let newView = AddPrizeView()
            newView.configureView(addStackView: stackView, defaultFontSize: 17)
            newView.isHidden = true
            
            stackView.insertArrangedSubview(newView, at: idx)
            
            UIView.animate(withDuration: 0) {
                newView.isHidden = false
            }
            
            newView.prizedDateBtn.addTarget(self, action: #selector(tapedDateBtn), for: .touchUpInside)
            
            return
        case .foreignLanguage:
            let newView = AddForeignLanguageView()
            newView.configureView(addStackView: stackView, defaultFontSize: 17)
            newView.isHidden = true
            
            stackView.insertArrangedSubview(newView, at: idx)
            
            UIView.animate(withDuration: 0) {
                newView.isHidden = false
            }
            
            newView.levelBtn.addTarget(self, action: #selector(tapedDateBtn), for: .touchUpInside)
            
            return
        case .link:
            let newView = AddLinkView()
            newView.configureView(addStackView: stackView, defaultFontSize: 17)
            newView.isHidden = true
            
            stackView.insertArrangedSubview(newView, at: idx)
            
            UIView.animate(withDuration: 0) {
                newView.isHidden = false
            }
            
            return
        }
    }
    
    func putMoreInfoToAddStackView(ryujume: RyujumeModel, careerStackView: UIStackView, academicBackgroundStackView: UIStackView, prizeStackView: UIStackView, foreignLanguageStackView: UIStackView, linkStackView: UIStackView) {
        if let careerInfo = ryujume.career {
            let idx = careerStackView.arrangedSubviews.count - 1
            if idx < careerInfo.count {
                for _ in 0...(careerInfo.count - idx) {
                    addAddView(stateOfButton: .career, stackView: careerStackView)
                }
            } else if idx > careerInfo.count {
                for i in 0...(idx - careerInfo.count) {
                    guard let view = careerStackView.arrangedSubviews[i] as? AddCareerView else { return }
                    deleteView(btn: view.deleteBtn)
                }
            }
            
            for i in 0...idx {
                guard let view = careerStackView.arrangedSubviews[i] as? AddCareerView else { return }
                if let startDate = careerInfo[i].startDate, let endDate = careerInfo[i].endDate {
                    view.startDateBtn.setTitle(String(startDate), for: .normal)
                    view.endDateBtn.setTitle(String(endDate), for: .normal)
                } else {
                    view.startDateBtn.setTitle("시작일", for: .normal)
                    view.endDateBtn.setTitle("마지막일", for: .normal)
                }
                view.companyTxtField.text = careerInfo[i].company
                if careerInfo[i].isWorking {
                    view.isWorkingBtn.setTitle("O", for: .normal)
                } else {
                    view.isWorkingBtn.setTitle("X", for: .normal)
                }
            }
        }
        
        if let academicBackgroundInfo = ryujume.academicBackground {
            let idx = academicBackgroundStackView.arrangedSubviews.count - 1
            if idx < academicBackgroundInfo.count {
                for _ in 0...(academicBackgroundInfo.count - idx) {
                    addAddView(stateOfButton: .academicBackground, stackView: academicBackgroundStackView)
                }
            } else if idx > academicBackgroundInfo.count {
                for i in 0...(idx - academicBackgroundInfo.count) {
                    guard let view = academicBackgroundStackView.arrangedSubviews[i] as? AddAcademicBackgroundView else { return }
                    deleteView(btn: view.deleteBtn)
                }
            }
            
            for i in 0...idx {
                guard let view = academicBackgroundStackView.arrangedSubviews[i] as? AddAcademicBackgroundView else { return }
                if let startDate = academicBackgroundInfo[i].startDate, let endDate = academicBackgroundInfo[i].endDate {
                    view.startDateBtn.setTitle(String(startDate), for: .normal)
                    view.endDateBtn.setTitle(String(endDate), for: .normal)
                } else {
                    view.startDateBtn.setTitle("시작일", for: .normal)
                    view.endDateBtn.setTitle("마지막일", for: .normal)
                }
                view.schoolTxtField.text = academicBackgroundInfo[i].school
                if academicBackgroundInfo[i].isAttending {
                    view.isAttendingBtn.setTitle("O", for: .normal)
                } else {
                    view.isAttendingBtn.setTitle("X", for: .normal)
                }
            }
        }
        
        if let prizeInfo = ryujume.prize {
            let idx = prizeStackView.arrangedSubviews.count - 1
            if idx < prizeInfo.count {
                for _ in 0...(prizeInfo.count - idx) {
                    addAddView(stateOfButton: .prize, stackView: prizeStackView)
                }
            } else if idx > prizeInfo.count {
                for i in 0...(idx - prizeInfo.count) {
                    guard let view = prizeStackView.arrangedSubviews[i] as? AddPrizeView else { return }
                    deleteView(btn: view.deleteBtn)
                }
            }
            
            for i in 0...idx {
                guard let view = prizeStackView.arrangedSubviews[i] as? AddPrizeView else { return }
                if let prizeDate = prizeInfo[i].prizedDate {
                    view.prizedDateBtn.setTitle(String(prizeDate), for: .normal)
                } else {
                    view.prizedDateBtn.setTitle("수상일", for: .normal)
                }
                view.prizeTxtField.text = prizeInfo[i].prize
            }
        }
        
        if let foreignLanguageInfo = ryujume.foreignLanguage {
            let idx = foreignLanguageStackView.arrangedSubviews.count - 1
            if idx < foreignLanguageInfo.count {
                for _ in 0...(foreignLanguageInfo.count - idx) {
                    addAddView(stateOfButton: .foreignLanguage, stackView: foreignLanguageStackView)
                }
            } else if idx > foreignLanguageInfo.count {
                for i in 0...(idx - foreignLanguageInfo.count) {
                    guard let view = foreignLanguageStackView.arrangedSubviews[i] as? AddForeignLanguageView else { return }
                    deleteView(btn: view.deleteBtn)
                }
            }
            for i in 0...idx {
                guard let view = foreignLanguageStackView.arrangedSubviews[i] as? AddForeignLanguageView else { return }
                view.levelBtn.setTitle(foreignLanguageInfo[i].level, for: .normal)
                view.languageTxtField.text = foreignLanguageInfo[i].language
            }
        }
        
        if let linkInfo = ryujume.link {
            let idx = linkStackView.arrangedSubviews.count - 1
            if idx < linkInfo.count {
                for _ in 0...(linkInfo.count - idx) {
                    addAddView(stateOfButton: .foreignLanguage, stackView: foreignLanguageStackView)
                }
            } else if idx > linkInfo.count {
                for i in 0...(idx - linkInfo.count) {
                    guard let view = foreignLanguageStackView.arrangedSubviews[i] as? AddLinkView else { return }
                    deleteView(btn: view.deleteBtn)
                }
            }
            for i in 0...idx {
                guard let view = foreignLanguageStackView.arrangedSubviews[i] as? AddLinkView else { return }
                view.linkTxtField.text = linkInfo[i]
            }
        }
    }
    
    func careerIntoModel(careerStackView: UIStackView) -> [Career] {
        var careerInfo = [Career]()
        for i in 0...careerStackView.arrangedSubviews.count - 1 {
            guard let view = careerStackView.arrangedSubviews[i] as? AddCareerView else { return [] }
            if self.isDateExist(startDateBtn: view.startDateBtn, endDateBtn: view.endDateBtn) {
                careerInfo.append(Career(isWorking: self.isSelected(btn: view.isWorkingBtn),
                                          company: view.companyTxtField.text!,
                                          startDate: Int(view.startDateBtn.currentTitle!),
                                          endDate: Int(view.endDateBtn.currentTitle!)))
            } else {
                careerInfo.append(Career(isWorking: self.isSelected(btn: view.isWorkingBtn),
                                          company: view.companyTxtField.text!,
                                          startDate: nil,
                                          endDate: nil))
            }
        }
        return careerInfo
    }
    
    func academicBackgroundIntoModel(academicBackgroundStackView: UIStackView) -> [AcademicBackground] {
        var academicBackgroundInfo = [AcademicBackground]()
        for i in 0...academicBackgroundStackView.arrangedSubviews.count - 1 {
            guard let view = academicBackgroundStackView.arrangedSubviews[i] as? AddAcademicBackgroundView else { return [] }
            if self.isDateExist(startDateBtn: view.startDateBtn, endDateBtn: view.endDateBtn) {
                academicBackgroundInfo.append(AcademicBackground(isAttending: self.isSelected(btn: view.isAttendingBtn),
                                                                  school: view.schoolTxtField.text!,
                                                                  startDate: Int(view.startDateBtn.currentTitle!),
                                                                  endDate: Int(view.endDateBtn.currentTitle!)))
            } else {
                academicBackgroundInfo.append(AcademicBackground(isAttending: self.isSelected(btn: view.isAttendingBtn),
                                                                  school: view.schoolTxtField.text!,
                                                                  startDate: nil,
                                                                  endDate: nil))
            }
        }
        return academicBackgroundInfo
    }
    
    func prizeIntoModel(prizeStackView: UIStackView) -> [Prize] {
        var prizeInfo = [Prize]()
        for i in 0...prizeStackView.arrangedSubviews.count - 1 {
            guard let view = prizeStackView.arrangedSubviews[i] as? AddPrizeView else { return [] }
            if view.prizedDateBtn.currentTitle != "수상일" {
                prizeInfo.append(Prize(prize: view.prizeTxtField.text!, prizedDate: Int(view.prizedDateBtn.currentTitle!)))
            } else {
                prizeInfo.append(Prize(prize: view.prizeTxtField.text!, prizedDate: nil))
            }
        }
        return prizeInfo
    }
    
    func foreignLanguageIntoModel(foreignLanguageStackView: UIStackView) -> [ForeignLanguage] {
        var foreignLanguageInfo = [ForeignLanguage]()
        for i in 0...foreignLanguageStackView.arrangedSubviews.count - 1 {
            guard let view = foreignLanguageStackView.arrangedSubviews[i] as? AddForeignLanguageView else { return [] }
            if view.levelBtn.currentTitle != "수준" {
                foreignLanguageInfo.append(ForeignLanguage(language: view.languageTxtField.text!, level: view.levelBtn.currentTitle!))
            }
        }
        return foreignLanguageInfo
    }
    
    func linkIntoModel(linkStackView: UIStackView) -> [String] {
        var linkInfo = [String]()
        for i in 0...linkStackView.arrangedSubviews.count - 1 {
            guard let view = linkStackView.arrangedSubviews[i] as? AddLinkView else { return [] }
            linkInfo.append(view.linkTxtField.text!)
        }
        return linkInfo
    }
    
    func isMoreInfoFull(careerStackView: UIStackView, academicBackgroundStackView: UIStackView, prizeStackView: UIStackView, foreignLanguageStackView: UIStackView, linkStackView: UIStackView) -> Bool {
        
        for i in 0...careerStackView.arrangedSubviews.count - 1 {
            guard let view = careerStackView.arrangedSubviews[i] as? AddCareerView else { break }
            if view.companyTxtField.text == nil { return false }
        }
        
        for i in 0...academicBackgroundStackView.arrangedSubviews.count - 1 {
            guard let view = academicBackgroundStackView.arrangedSubviews[i] as? AddAcademicBackgroundView else { break }
            if view.schoolTxtField.text == nil { return false }
        }
        
        for i in 0...prizeStackView.arrangedSubviews.count - 1 {
            guard let view = prizeStackView.arrangedSubviews[i] as? AddPrizeView else { break }
            if view.prizeTxtField.text == nil { return false }
        }
        
        for i in 0...foreignLanguageStackView.arrangedSubviews.count - 1 {
            guard let view = foreignLanguageStackView.arrangedSubviews[i] as? AddForeignLanguageView else { break }
            if view.languageTxtField.text == nil { return false }
        }
        
        for i in 0...linkStackView.arrangedSubviews.count - 1 {
            guard let view = linkStackView.arrangedSubviews[i] as? AddLinkView else { break }
            if view.linkTxtField.text == nil { return false }
        }
        return true
    }
    
    func deleteView(btn: UIButton) {
        guard let view = btn.superview else { return }
        UIView.animate(withDuration: 0.05, animations: {view.isHidden = true}) {(_) -> Void in view.removeFromSuperview()}
    }
    
    func isSelected(btn: UIButton) -> Bool {
        if btn.isSelected {
            return true
        } else {
            return false
        }
    }
    
    func isDateExist(startDateBtn: UIButton, endDateBtn: UIButton) -> Bool{
        if startDateBtn.currentTitle == "시작일" || endDateBtn.currentTitle == "마지막일" {
            return false
        } else {
            return true
        }
    }
    
    @objc func tapedDateBtn(sender: UIButton) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY.MM"
        
        if sender.tag == 0 {
            DatePickerPopover(title: "시작일")
                .setDateMode(.date)
                .setSelectedDate(Date())
                .setDoneButton { (popover, selectedDate) in
                    sender.setTitle(formatter.string(from: selectedDate), for: .normal)}
                .appear(originView: sender, baseViewController: self)
        } else if sender.tag == 1{
            DatePickerPopover(title: "마지막일")
                .setDateMode(.date)
                .setSelectedDate(Date())
                .setDoneButton { (popover, selectedDate) in
                    sender.setTitle(formatter.string(from: selectedDate), for: .normal)}
                .appear(originView: sender, baseViewController: self)
        } else if sender.tag == 2{
            DatePickerPopover(title: "수상일")
                .setDateMode(.date)
                .setSelectedDate(Date())
                .setDoneButton { (popover, selectedDate) in
                    sender.setTitle(formatter.string(from: selectedDate), for: .normal)}
                .appear(originView: sender, baseViewController: self)
        } else {
            StringPickerPopover(title: "수준", choices: ["유창함", "비즈니스회화", "일상회화"])
                .setDoneButton { (popover, selectedRow, selectedString) in
                    sender.setTitle(selectedString, for: .normal)
                }
                .appear(originView: sender, baseViewController: self)
        }
    }
    
}

extension UIView {
    @objc func tapedDeleteBtn(sender: UIButton) {
        guard let view = sender.superview else { return }
        UIView.animate(withDuration: 0.05, animations: {view.isHidden = true}) {(_) -> Void in view.removeFromSuperview()}
    }
    
    @objc func tapedStateBtn(sender: UIButton) {
        if sender.isSelected == false {
            sender.setTitle("O", for: .normal)
            sender.isSelected = true
        } else {
            sender.setTitle("X", for: .normal)
            sender.isSelected = false
        }
    }

}

extension UIFont {
    class func appThinFontWith( size:CGFloat ) -> UIFont{
        return  UIFont(name: "SCDream1", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    class func appExtraLightFontWith( size:CGFloat ) -> UIFont{
        return  UIFont(name: "SCDream2", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    class func appLightFontWith( size:CGFloat ) -> UIFont{
        return  UIFont(name: "SCDream3", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    class func appRegularFontWith( size:CGFloat ) -> UIFont{
        return  UIFont(name: "SCDream4", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    class func appMidiumFontWith( size:CGFloat ) -> UIFont{
        return  UIFont(name: "SCDream5", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    class func appBoldFontWith( size:CGFloat ) -> UIFont{
        return  UIFont(name: "SCDream6", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    class func appExtraBoldFontWith( size:CGFloat ) -> UIFont{
        return  UIFont(name: "SCDream7", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    class func appHeavyFontWith( size:CGFloat ) -> UIFont{
        return  UIFont(name: "SCDream8", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    class func appBlackFontWith( size:CGFloat ) -> UIFont{
        return  UIFont(name: "SCDream9", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

struct Token {
    static var _token: String?
    static var token: String? {
        get {
            _token = UserDefaults.standard.string(forKey: "Token")
            return _token
        }
        
        set(newToken) {
            UserDefaults.standard.setValue(newToken, forKey: "Token")
            _token = UserDefaults.standard.string(forKey: "Token")
        }
    }
    
    static func remove() {
        token = nil
    }
}

enum Header {
    case tokenIsExist, tokenIsEmpty
    
    func getHeader() -> HTTPHeaders {
        guard let token = Token.token else { return ["Content-Type" : "application/json"] }
        
        switch self {
        case .tokenIsExist:
            return HTTPHeaders(["x-access-token" : token, "Content-Type" : "application/json"])
        case .tokenIsEmpty:
            return HTTPHeaders(["Content-Type" : "application/json"])
        }
    }
}
