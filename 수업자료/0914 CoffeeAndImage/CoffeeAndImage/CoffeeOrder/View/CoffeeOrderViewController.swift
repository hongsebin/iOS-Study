//
//  CoffeeOrderViewController.swift
//  CoffeeAndImage
//
//  Created by yeoboya3 on 2023/09/14.
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

extension CoffeeOrderViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // cell이 몇 개인가?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.menuList.count
    }
    
    // cell을 어떻게 할 것인지. 어떤 셀이고, 어떻게 그리고, 셀에 필요한 작업들..
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as? MenuCell else { return UICollectionViewCell()}
        
        // 메뉴 리스트를 순서대로 넣음
        let menu = viewModel.menuList[indexPath.item]
        // 0번 셀에는 0번 메뉴 / 1번셀-1번메뉴 ...
        cell.setData(menu: menu)
        
        return cell
    }
    
    
    // FlowLayout
    // 위아래 간격 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    // 셀 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    // 컬렉션뷰 인셋
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    // 셀 size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (collectionView.frame.width - 40) / 2 - 20
        let height = width + 55
        
        return CGSize(width: width, height: height)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // 선택한 셀 정보 가져오기
        // selectedMenu = 내가 고른 메뉴
        let selectedMenu = viewModel.menuList[indexPath.item]
        
        let story = UIStoryboard(name: "DetailViewController", bundle: nil)
        guard let vc = story.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController,
        let navi = self.navigationController else { return }

        // 내가 고른 메뉴를 가지고 있는 뷰모델
        // let viewModel = DetailViewModel(selectedMenu: selectedMenu)
        // 새로 만들 뷰컨트롤러 뷰모델에 내가 위에서 만든 뷰모델 넣어주기
        // vc.viewModel = viewModel
        
        // 위 두줄 코드를 줄여서 아래 한줄로.
        vc.viewModel = DetailViewModel(selectedMenu: selectedMenu)
        // DetailViewModel에는 무조건 selectedMenu 값을 가지고 있어야 됨.(DetailViewModel init 참고)
        // 선택한 셀 정보를 DetailViewModel에 넣어서 vc(DetailViewController)로 넘겨준다

        
        // 위 vc.viewModel...는 옵셔널이라서 없어도 됨. 근데 없으면 메뉴 사진과 이름이 화면에 나타나지 않음.
        
        navi.pushViewController(vc, animated: true)
    }
    
}
