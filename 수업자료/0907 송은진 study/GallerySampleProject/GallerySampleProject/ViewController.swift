//
//  ViewController.swift
//  GallerySampleProject
//
//  Created by ejsong on 2023/09/05.
//

import UIKit
import Photos

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imgList : [UIImage?] = [UIImage(named: "image1"),
                               UIImage(named: "image2"),
                               UIImage(named: "image3"),
                               UIImage(named: "image4"),
                               UIImage(named: "image5")]
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setDelegate()
        registerNib()
    }

    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
        imagePicker.delegate = self
    }
    
    private func registerNib() {
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }
    
    @IBAction func didTapGallery(_ sender: Any) {
        let alert = UIAlertController(title: "선택해 주세요", message: nil, preferredStyle: .actionSheet)
        let gallery = UIAlertAction(title: "갤러리", style: .default) { _ in
            self.openResource(.gallery)
        }
        
        let camera = UIAlertAction(title: "카메라", style: .default) { _ in
            self.openResource(.camera)
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        [gallery, camera, cancel].forEach(alert.addAction(_:))
        
        present(alert, animated: true, completion: nil)
    }
    
    private func openResource(_ type: SourceType) {
        imagePicker.sourceType = type == .camera ? .camera : .photoLibrary

        let status = PHPhotoLibrary.authorizationStatus()
        if status == PHAuthorizationStatus.authorized{
            present(imagePicker, animated: true, completion: nil)
        }else{
            PHPhotoLibrary.requestAuthorization({(status) in
                DispatchQueue.main.async{
                    if status == PHAuthorizationStatus.authorized{
                        self.present(self.imagePicker, animated: false, completion: nil)
                    }
                }
            })
        }
    }
    
}

enum SourceType {
    case gallery
    case camera
}
