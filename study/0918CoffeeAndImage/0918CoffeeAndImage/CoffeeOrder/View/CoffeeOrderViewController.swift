//
//  CoffeeOrderViewController.swift
//  0918CoffeeAndImage
//
//  Created by yeoboya3 on 2023/09/18.
//

import Foundation
import UIKit

class CoffeeOrderViewController: UIViewController {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        registerCell()

    }
    
    func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func registerCell() {
        let cell = UINib(nibName: "MenuCell", bundle: nil)
        self.collectionView.register(cell, forCellWithReuseIdentifier: "MenuCell")
    }
}

extension CoffeeOrderViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    // cell이 몇 개인가?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CoffeeOrderViewModel().menuList.count
    }
    
    // cell을 어떻게 할지. 셀에 필요한 작업들
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as? MenuCell else { return UICollectionViewCell()}
        
        // 메뉴 리스트에 순서대로 넣음
        let menu = CoffeeOrderViewModel().menuList[indexPath.item]
        // 0번 cell에는 0번 메뉴 ...
        cell.setData(menu: menu)
        
        return cell
    }
    
}
