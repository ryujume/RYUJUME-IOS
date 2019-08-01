//
//  MainVC.swift
//  RyujumeApp
//
//  Created by baby1234 on 25/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

class MainVC: UIViewController, MainProvider{

    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var mainSegmentControl: UISegmentedControl!
    
    let httpClient = HTTPClient()
    var simpleRyujumes: [SimpleRyujumesModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !self.loginCheck() {
            print(Token.token as Any)
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "AuthNC") else { return }
            self.present(vc, animated: false, completion: nil)
        } else {
            print(Token.token as Any)
        }
        
        if UserDefaults.standard.integer(forKey: "SeletedSegentIndex") == 0 {
            mainSegmentControl.selectedSegmentIndex = 0
        } else {
            mainSegmentControl.selectedSegmentIndex = 1
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if mainSegmentControl.selectedSegmentIndex == 0 {
            getLikeRyujumes()
            UserDefaults.standard.setValue(0, forKey: "SeletedSegentIndex")
        } else {
            getLatestRyujumes()
            UserDefaults.standard.setValue(1, forKey: "SeletedSegentIndex")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToDetail" {
            guard let ryujumeId = sender as? String else { return }
            guard let vc = segue.destination as? DetailRyujumeVC else { return }
            vc.ryujumeId = ryujumeId
        }
    }

    func getLatestRyujumes() {
        httpClient
            .get(url: MainAPI.getLatestRyujumes.getPath(), params: nil, header: Header.tokenIsExist.getHeader())
            .responseJSON(completionHandler: { [weak self] (response) in
                guard let strongSelf = self else { return }
                switch response.response?.statusCode {
                case 200 :
                    guard let value = response.value as? Data else { return }
                    guard let model = try? JSONDecoder().decode([SimpleRyujumesModel].self, from: value) else { return }
                    DispatchQueue.main.async {
                        strongSelf.simpleRyujumes = model
                    }
                    return
                default :
                    return
                }
                
            })
    }
    
    func getLikeRyujumes(){
        httpClient
            .get(url: MainAPI.getLikeRyujumes.getPath(), params: nil, header: Header.tokenIsExist.getHeader())
            .responseJSON(completionHandler: { [weak self] (response) in
                guard let strongSelf = self else { return }
                switch response.response?.statusCode {
                case 200 :
                    guard let value = response.value as? Data else { return }
                    guard let model = try? JSONDecoder().decode([SimpleRyujumesModel].self, from: value) else { return }
                    DispatchQueue.main.async {
                        strongSelf.simpleRyujumes = model
                    }
                    return
                default :
                    return
                }
                
            })
    }
}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return simpleRyujumes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as! MainCell
        cell.configure(model: simpleRyujumes[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MainToDetail", sender: simpleRyujumes[indexPath.row].ryujumeId)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewCellWidth = collectionView.frame.width / 2 - 20
        return CGSize(width: collectionViewCellWidth, height: collectionViewCellWidth)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 5
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 5
        
    }
}

class MainCell: UICollectionViewCell {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var simpleIntroduceTxtView: UITextView!
    @IBOutlet weak var likeCountLbl: UILabel!
    
    func configure(model: SimpleRyujumesModel) {
        nameLbl.text = model.userName
        simpleIntroduceTxtView.text = model.simpleIntroduce
        likeCountLbl.text = String(model.likeCount)
    }
}
