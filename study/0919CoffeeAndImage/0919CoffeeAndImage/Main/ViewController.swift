//
//  ViewController.swift
//  0919CoffeeAndImage
//
//  Created by yeoboya3 on 2023/09/19.
//

import UIKit
import Photos

class ViewController: UIViewController, PHPhotoLibraryChangeObserver {

    
    
    var allPhotos: PHFetchResult<PHAsset>!

    @IBOutlet weak var coffeeOrderButton: UIButton!
    @IBOutlet weak var ImageSearchButton: UIButton!
    
    @IBOutlet weak var chattingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let allPhotosOptions = PHFetchOptions()
        allPhotosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        allPhotos = PHAsset.fetchAssets(with: allPhotosOptions)
        
        PHPhotoLibrary.shared().register(self)
        
    }
    
    deinit {
        PHPhotoLibrary.shared().unregisterChangeObserver(self)
    }

    
    
    // 커피 주문
    @IBAction func coffeeOrderButtonTap(_ sender: Any) {
        
        // CoffeeOrderViewController 스토리보드 찾아서 story 상수에 저장
        let story = UIStoryboard(name: "CoffeeOrderViewController", bundle: nil)
        
        // (,)로 guard let 2개 사용
        guard let vc = story.instantiateViewController(withIdentifier: "CoffeeOrderViewController") as? CoffeeOrderViewController,
              
              // 현재 뷰컨트롤러의 속성 및 메서드에 접근
              let navi = self.navigationController else { return }
        
        navi.pushViewController(vc, animated: true)
    }
    
    
    
    
    // 이미지 검색
    @IBAction func imageButtonTap(_ sender: Any) {
        let story = UIStoryboard(name: "ImageViewController", bundle: nil)
        
        guard let imageVC = story.instantiateViewController(withIdentifier: "ImageViewController") as? ImageViewController,
              
              
              let navi = self.navigationController else { return }
        
        imageVC.viewModel = ImageViewModel()
        
        imageVC.fetchResult = allPhotos
        
        navi.pushViewController(imageVC, animated: true)
    }
    
    
    // 채팅
    @IBAction func chattingButtonTap(_ sender: Any) {
        let story = UIStoryboard(name: "ChattingViewController", bundle: nil)
        guard let chattingVC = story.instantiateViewController(withIdentifier: "ChattingViewController") as? ChattingViewController,
              
              let navi = self.navigationController else { return }
        
        navi.pushViewController(chattingVC, animated: true)
    }
}

extension ViewController {
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        DispatchQueue.main.sync {
            if let changeDetail = changeInstance.changeDetails(for: allPhotos) {
                allPhotos = changeDetail.fetchResultAfterChanges
            }
        }
    }
}
