//
//  ViewController.swift
//  collectionview-fadein&fadeout
//
//  Created by 윤병일 on 2021/07/29.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

  //MARK: - Properties
  
  private let myImageView1 : UIImageView = {
    let v = UIImageView()
    v.image = UIImage(named: "JoopdaClothes")
    return v
  }()
  
  private let myImageView2 : UIImageView = {
    let v = UIImageView()
    v.image = UIImage(named: "JoopdaCollaboration")
    return v
  }()
  
  let collectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    return UICollectionView(frame: .zero, collectionViewLayout: layout)
  }()
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    setupView()
  }

  //MARK: - Functions
  private func configureUI() {
    view.backgroundColor = .lightGray
    collectionView.backgroundColor = .systemBlue
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    
    
    [myImageView1, myImageView2, collectionView].forEach {
      view.addSubview($0)
    }
    
    myImageView1.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
    
    myImageView2.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
    
    collectionView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  private func setupView() {
    myImageView1.alpha = 1.0
    myImageView2.alpha = 0.0
  }
}

  //MARK: - UICollectionvViewDataSource
extension ViewController : UICollectionViewDataSource  {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    cell.backgroundColor = .yellow
    return cell
  }
}

  //MARK: - UIColletionViewDelegate
extension ViewController : UICollectionViewDelegate {
  
}

  //MARK: - UICollectionViewDelegateFlowLayout
extension ViewController : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return collectionView.frame.size
  }
}
