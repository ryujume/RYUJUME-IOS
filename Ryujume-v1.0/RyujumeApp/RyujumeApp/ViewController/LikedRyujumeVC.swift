//
//  LikeResumeVC.swift
//  RyujumeApp
//
//  Created by baby1234 on 25/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

class LikedRyujumeVC: UIViewController {

    @IBOutlet weak var likedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
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
