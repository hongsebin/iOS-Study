//
//  ImageViewController.swift
//  0919CoffeeAndImage
//
//  Created by yeoboya3 on 2023/10/05.
//

import Foundation
import UIKit
// 설치
import Alamofire
import Kingfisher

import Photos
import PhotosUI

class ImageViewController: UIViewController, PHPhotoLibraryChangeObserver {
    
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        DispatchQueue.main.sync {
            
            if let changeDetails = changeInstance.changeDetails(for: fetchResult) {
                fetchResult = changeDetails.fetchResultAfterChanges
            }
            
        }
    }
    
    
    
    
    var fetchResult: PHFetchResult<PHAsset>!
    var availableWidth: CGFloat = .zero
    
    fileprivate let  imageManager = PHCachingImageManager()
    fileprivate var thumbnailSize: CGSize!
    fileprivate var previousPreheatRect = CGRect.zero
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textFieldContainerView: UIView!
    
    var photoURLForcell = ""
    var photoUrls: [String] = []
    
    // 뷰컨이 뷰모델을 가지고 있어야됨.
    // viewModel은 껍데기. imageviewmodel 타입을 가지고 있어야됨.
    var viewModel: ImageViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
        setNotification()
        
        setDelegate()
        registerCell()
        
        
        PHPhotoLibrary.shared().register(self)
    }
    
    // collectionView의 데이터소스, 델리게이트를 설정하는 메서드
    func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // collectionView에 MenuCell을 등록하는 메서드
    func registerCell() {
        let cell = UINib(nibName: "ImageCell", bundle: nil)
        self.collectionView.register(cell, forCellWithReuseIdentifier: "ImageCell")
    }
    
    private func addTarget() {
        // view 를 tap하면 viewTap함수가 실행된다.
        let viewTapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTap(_:)))
        self.view.addGestureRecognizer(viewTapGesture)
        
        self.textField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    private func setNotification() {
        
        //observer등록
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillUp(_ notification: NSNotification) {
        print("키보드 업")
        
        // 뷰도 올리기
        // 키보드 사이즈를 구하는 이유 : 그만큼 뷰를 올리기 위해
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            // 0.3초동안 animations 안에 있는 클러저를 실행한다.
            UIView.animate(withDuration: 0.3, animations: {
                self.view.transform = CGAffineTransform(translationX: 0, y: -keyboardSize.height) // 올라가면 -, 내려가면 +
            })
            
        }
    }
    
    
    @objc func viewTap(_ notification: NSNotification) {
        // 키보드 내리기
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillDown(_ notification: NSNotification) {
        // 뷰 같이 내리기
        self.view.transform = .identity // .identity : 키보드 올라가기 전 원래 상태로 돌려줌
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        // 텍스트필드가 변경되었을떄 실행됨
        
        viewModel?.inputText = textField.text
        
        print(textField.text)
        print(viewModel?.inputText)
    }
    
    
    @IBAction func searchButtonTap(_ sender: Any) {
        viewModel?.searchButtonTap()
        
        let url = "https://api.unsplash.com/search/photos"
        
        let parameters: Parameters = ["query" : "food"]
        let headers: HTTPHeaders = .init([HTTPHeader(name: "Authorization", value: "Client-ID tFaKyim13VKDvfaN5R8J_FYhuNvBJ6ULWrmpTMkWmPY")])
        
        AF.request(url, method: .get, parameters: parameters, headers: headers)
            .validate(statusCode: (200...299))
        
        // 과제) 디코더블 사용
        // Decodable 프로토콜을 준수한는 모델을 만들고,
        // 이 모델을 .responseDecodable과 함께
            .responseDecodable(of: PhotoResponse.self) { response in
                switch response.result {
                case .success(let photoResponse):
                    // 응답에서 사진에 접근
                    let photoURLs = photoResponse.results.map { $0.urls.regular }
                    self.photoUrls = photoURLs
                    
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        
        func search2() {
            let url = "https://api.unsplash.com/search/photos"
            
            let parameters: Parameters = ["query" : "food"]
            let headers: HTTPHeaders = .init([HTTPHeader(name: "Authorization", value: "Client-ID tFaKyim13VKDvfaN5R8J_FYhuNvBJ6ULWrmpTMkWmPY")])
            
            // alamofire 사용
            AF.request(url, method: .get, parameters: parameters, headers: headers)
                .validate(statusCode: (200...299))
            
                .responseData { (response: AFDataResponse<Data>) in
                    switch response.result {
                    case .success(let data):
                        print(data)
                        do {
                            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                            let results = json?["results"] as? [Any]
                            
                            
                            results?.forEach({ result in
                                guard let result = result as? [String: Any] else { return }
                                
                                let urls = result["urls"] as? [String : String]
                                
                                let photoUrlString = urls?["regular"] as? String
                                
                                // self.photoURLForcell = photoUrlString!
                                self.photoUrls.append(photoUrlString!)
                                
                                DispatchQueue.main.async {
                                    self.collectionView.reloadData()
                                }
                                
                                print(photoUrlString)
                            })
                        } catch {
                            print("ddd")
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
        }
        
        func search1() {
            guard let textFieldImage = textField.text else { return }
            
            var url = "api.unsplash.com"
            var path = "/search/photos"
            var component = URLComponents()
            component.scheme = "https"
            component.host = url
            component.path = path
            component.queryItems = [
                URLQueryItem(name: "client_id", value: "bDzO-zuYVuQNaDM4gukaqseccsnOYIN0tey4VHSspqY"),
                URLQueryItem(name: "query", value: textFieldImage)
            ]
            
            guard let reqURL = component.url else {
                return
            }
            
            var request = URLRequest(url: reqURL)
            request.httpMethod = "GET"
            
            
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                do {
                    guard error == nil,
                          let response = response as? HTTPURLResponse,
                          let data = data else {
                        print("Search Photos Network Error")
                        return
                    }
                    
                    switch response.statusCode {
                    case(200...299):
                        
                        let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                        let results = json?["results"] as? [Any]
                        
                        
                        results?.forEach({ result in
                            guard let result = result as? [String: Any] else { return }
                            
                            let urls = result["urls"] as? [String : String]
                            
                            let photoUrlString = urls?["regular"] as? String
                            
                            // self.photoURLForcell = photoUrlString!
                            self.photoUrls.append(photoUrlString!)
                            
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            
                            print(photoUrlString)
                        })
                        
                        
                    default:
                        print(response.statusCode)
                    }
                } catch {
                    print(error)
                }
                
            }.resume()
        }
        
    }
}
    
    extension ImageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return photoUrls.count
            return fetchResult.count
        }
        
        
        
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let asset = fetchResult.object(at: indexPath.item)
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCell else {
                return UICollectionViewCell() }
            
//            cell.imageVIew.kf.setImage(with: URL(string: photoUrls[indexPath.row]))
            cell.imageVIew.backgroundColor = .systemRed
            
            imageManager.requestImage(for: asset, targetSize: CGSize(width: 80, height: 80), contentMode: .aspectFill, options: nil) { image, dict in
                cell.imageVIew.image = image
            }
            
            return cell
            
        }
        
        
        
        // flowlayout
        // 위아래
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
        // 셀옆
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
        // 상하좌우 여백(인셋)
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        // 셀 크기
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let width = collectionView.frame.width / 3
            let height = width
            
            return CGSize(width: width, height: height)
        }
        
        
        
    }
    
