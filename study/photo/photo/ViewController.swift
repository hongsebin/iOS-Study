import UIKit
import Then
//import Snapkit : constraint 잡을때 쓰는거. viewDidLoad 안에 씀.

class ViewController: UIViewController, UINavigationControllerDelegate {

    var imgArray = [ UIImage(named:"1"), UIImage(named:"2"), UIImage(named:"3"), UIImage(named:"4"), UIImage(named:"5")]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        registerNib()
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func registerNib() {
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }
    
    @IBAction func btnImage(_ sender: Any) {
        let alert = UIAlertController(title: "선택해주세요", message: nil, preferredStyle: .actionSheet)
        
        // 앨범 옵션 추가
        let albumAction = UIAlertAction(title: "앨범에서 선택", style: .default) { [weak self] (_) in
            self?.openAlbum()
        }
        
        // 카메라 옵션 추가
        let cameraAction = UIAlertAction(title: "카메라로 찍기", style: .default) { [weak self] (_) in
            self?.openCamera()
        }
        
        // 취소 옵션 추가
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(albumAction)
        alert.addAction(cameraAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func openAlbum() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    private func openCamera() {
        // 카메라로 찍기 옵션 구현...
    }
}



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let img = imgArray[indexPath.item]
        cell.imgView.image = img
        
        return cell
    }
    
    // 이미지 선택 취소 시 알림
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true) {
            let cancelAlert = UIAlertController(title: "", message: "취소되었습니다", preferredStyle: .alert)
            cancelAlert.addAction(UIAlertAction(title: "확인", style: .cancel))
            self.present(cancelAlert, animated: true)
        }
    }

    // 이미지 선택 시 처리
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true) {
            if let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
                self.imgArray.append(selectedImage)
                self.collectionView.reloadData()
            }
        }
    }
}
