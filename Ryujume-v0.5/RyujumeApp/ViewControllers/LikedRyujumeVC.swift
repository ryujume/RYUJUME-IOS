//
//  LikeResumeVC.swift
//  RyujumeApp
//
//  Created by baby1234 on 25/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

class LikedRyujumeVC: UIViewController, LikedRyujumeProvider {

    @IBOutlet weak var likedCollectionView: UICollectionView!
    
    let httpClient = HTTPClient()
    var simpleRyujumes = [SimpleRyujumesModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        likedCollectionView.delegate = self
        likedCollectionView.dataSource = self
        
        getLikedRyujumes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LikedToDetail" {
            guard let ryujumeId = sender as? String else { return }
            guard let vc = segue.destination as? DetailRyujumeVC else { return }
            vc.ryujumeId = ryujumeId
            vc.isLiked = true
        }
    }
    
    func getLikedRyujumes() {
        httpClient
            .get(url: MainAPI.getLikeRyujumes.getPath(), params: nil, header: Header.tokenIsExist.getHeader())
            .responseJSON(completionHandler: { [weak self] (response) in
                guard let strongSelf = self else { return }
                switch response.response?.statusCode {
                case 200 :
                    guard let value = response.data else { return }
                    guard let model = try? JSONDecoder().decode([SimpleRyujumesModel].self, from: value) else { return }
                    for i in 0...model.count - 1 {
                        if model[i].simpleIntroduce != "" {
                            strongSelf.simpleRyujumes.append(model[i])
                        }
                    }
                    DispatchQueue.main.async {
                        strongSelf.likedCollectionView.reloadData()
                    }
                    return
                default :
                    DispatchQueue.main.async {
                        strongSelf.showToast(message: "데이터 불러오기 실패")
                    }
                    print(response.response?.statusCode as Any)
                    return
                }
                
            })
    }
}

extension LikedRyujumeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return simpleRyujumes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LikedCell", for: indexPath) as! LikedCell
        cell.configure(model: simpleRyujumes[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "LikedToDetail", sender: simpleRyujumes[indexPath.row].ryujumeId)
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

class LikedCell: UICollectionViewCell {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var simpleIntroduceTxtView: UITextView!
    @IBOutlet weak var likeCountLbl: UILabel!
    
    func configure(model: SimpleRyujumesModel) {
        nameLbl.text = model.userName
        simpleIntroduceTxtView.text = model.simpleIntroduce
        likeCountLbl.text = String(model.likeCount)
    }
}
