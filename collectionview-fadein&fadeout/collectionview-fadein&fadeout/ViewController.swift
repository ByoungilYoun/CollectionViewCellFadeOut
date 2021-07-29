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
    layout.scrollDirection = .horizontal
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
    collectionView.backgroundColor = .clear
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    collectionView.isPagingEnabled = true
    
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
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let x = scrollView.contentOffset.x
    let index = getCurrentIndex()
    let fadeInAlpha = (x - (collectionViewWidth * CGFloat(index))) / collectionViewWidth
    let fadeOutAlpha = 1 - fadeInAlpha
    
    guard index < 1 else {return}
    myImageView1.alpha = fadeOutAlpha
    myImageView2.alpha = fadeInAlpha
  }
  
  func getCurrentIndex() -> Int {
    return Int(collectionView.contentOffset.x / collectionView.frame.width)
  }
  
  var collectionViewWidth : CGFloat {
    return collectionView.frame.width
  }
}

  //MARK: - UICollectionvViewDataSource
extension ViewController : UICollectionViewDataSource  {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    cell.backgroundColor = .clear
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
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}
