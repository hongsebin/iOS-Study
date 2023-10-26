//
//  CoffeeOrderViewController.swift
//  0919CoffeeAndImage
//
//  Created by yeoboya3 on 2023/09/19.
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
    
    // collectionView의 데이터소스, 델리게이트를 설정하는 메서드
    func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // collectionView에 MenuCell을 등록하는 메서드
    func registerCell() {
        let cell = UINib(nibName: "MenuCell", bundle: nil)
        self.collectionView.register(cell, forCellWithReuseIdentifier: "MenuCell")
    }
}


extension CoffeeOrderViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // cell이 몇 개인지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.menuList.count
    }
    
    
    // cell에 필요한 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as? MenuCell else { return UICollectionViewCell() }
        
        // 메뉴 리스트를 순서대로 넣음
        let menu = viewModel.menuList[indexPath.item]
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
        
        return UIEdgeInsets(top: 0, left: 20                            , bottom: 0, right: 20)
    }
    
    // 셀 size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (collectionView.frame.width - 40) / 2 - 20
        let height = width + 55
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // 선택한 셀 메뉴 정보 가져오기
        let selectedMenu = viewModel.menuList[indexPath.item]
        
        
        
        // 1. Storyboard를 이용한 방법 --------------------------
        // CoffeeOrderViewController의 스토리보드를 직접 로드하고,
        // 해당 스토리보드에서 CoffeeOrderViewController 인스턴스를 생성한다.
        // 스토리보드에서 인스턴스를 로드하고 초기화해야할때 사용
        
        // DetailViewController 찾아서 story 상수에 저장
        // DetailViewController 인스턴스 생성
        let story = UIStoryboard(name: "DetailViewController", bundle: nil)
        
        guard let vc = story.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController,
        let navi = self.navigationController else { return }
    
        // 선택한 메뉴 정보를 DetailViewController의 selectedMenu에 할당
        // vc.selectedMenu = selectedMenu
        vc.viewModel = DetailViewModel(selectedMenu: selectedMenu)
        
        navi.pushViewController(vc, animated: true)
        
        
        
        // 2. 코드로 직접 뷰컨트롤러를 생성하는 방법 --------------------------
        // 스토리보드를 직접 로드하지 않고 코드로 DetailViewController 인스턴스를
        // 생성하고 초기화한다. 이후에 selectedMenu 값ㅇ르 설정하고
        // pushViewController을 사용해 뷰컨트롤러를 표시한다.
        // 스토리보드에서 뷰컨을 초기화하지 않고, 코드로 직접 생성하고 설정할 수 있음
        
        // DetailViewController 인스턴스 생성
        
        /*
        if let detailVC = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            // DetailViewController에 메뉴 정보 전달
            detailVC.selectedMenu = selectedMenu

            // DetailViewController를 표시
            navigationController?.pushViewController(detailVC, animated: true)
        }
        */
    }
    
}
