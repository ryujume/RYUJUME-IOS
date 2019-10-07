//
//  MainVC.swift
//  RyujumeApp
//
//  Created by baby1234 on 25/06/2019.
//  Copyright © 2019 baby1234. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class MainVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    private let disposeBag = DisposeBag()
    private let viewModel = MainVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToDetail" {
            let detailVC = segue.destination as! DetailRyujumeVC
            guard let detailRyujumeID = sender as? String else { return }
            detailVC.detailRyujumeID.accept(detailRyujumeID)
        }
    }

    private func bindViewModel() {
        let input = MainVM.Input(likeRyujumeTaps: segmentedControl.rx.value.filter {$0 == 0}.asSignal(onErrorJustReturn: 0),
                                 latestRyujumeTaps: segmentedControl.rx.value.filter {$0 == 1}.asSignal(onErrorJustReturn: 1),
                                 selectedIndex: collectionView.rx.itemSelected.asDriver())
        let output = viewModel.transform(input: input)

        output.simpleRyujumes.asObservable().subscribe { [unowned self] (event) in
            if let simpleRyujumes = event.element, simpleRyujumes.isEmpty {
                self.showToast(message: "데이터를 불러올 수 없습니다")
            }
        }
        .disposed(by: disposeBag)

        output.simpleRyujumes.drive(collectionView.rx.items(cellIdentifier: "MainCell", cellType: MainCell.self)) { _, data, cell in
            cell.configure(simpleInfo: data)
        }
        .disposed(by: disposeBag)

        output.detailRyujumeID.asObservable().subscribe { [unowned self] (event) in
            guard let detailRyujumeID = event.element else { return }
            self.performSegue(withIdentifier: "MainToDetail", sender: detailRyujumeID)
        }
        .disposed(by: disposeBag)
    }
}

class MainCell: UICollectionViewCell {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var simpleIntroduceTxtView: UITextView!
    @IBOutlet weak var likeCountLbl: UILabel!

    func configure(simpleInfo: SimpleRyujumesModel) {
        nameLbl.text = simpleInfo.userName
        simpleIntroduceTxtView.text = simpleInfo.simpleIntroduce
        likeCountLbl.text = String(simpleInfo.likeCount)
    }
    
    override func awakeFromNib() {
        self.contentView.layer.cornerRadius = 10
    }
}
