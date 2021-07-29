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
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    setupView()
  }

  //MARK: - Functions
  private func configureUI() {
    view.backgroundColor = .lightGray
    
    [myImageView1, myImageView2].forEach {
      view.addSubview($0)
    }
    
    myImageView1.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
    
    myImageView2.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  private func setupView() {
    myImageView1.alpha = 1.0
    myImageView2.alpha = 0.0
    
  }
}

