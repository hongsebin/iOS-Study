//
//  CoffeeOrderViewController.swift
//  Coffee
//
//  Created by yeoboya3 on 2023/09/20.
//

import Foundation
import UIKit

class CoffeeOrderViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: CoffeeOrderViewModel = CoffeeOrderViewModel()
    
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

extension CoffeeOrderViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // cell 수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.menuList.count
    }
    
    // cell 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as? MenuCell else { return UICollectionViewCell() }
        
        let menu = viewModel.menuList[indexPath.item]
        cell.setData(menu: menu)
        return cell
    }
    
    // FlowLayout
    // 위아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    // cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width - 40) / 2 - 20
        let height = width + 55
        
        return CGSize(width: width, height: height)
    }
    
    
    // 셀 선택하고 화면 전환
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // 선택한 셀 메뉴 정보 가져오기
        let selectedMenu = viewModel.menuList[indexPath.item]
        
        // DetailViewController 인스턴스 생성
        if let detailVC = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            detailVC.selectedMenu = selectedMenu
            
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
