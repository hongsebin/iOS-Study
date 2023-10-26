//
//  ViewController+Delegate.swift
//  GallerySampleProject
//
//  Created by ejsong on 2023/09/05.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        
        if let img = imgList[indexPath.row] {
            cell.imgView.image = img
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "선택한 사진을\n삭제하시겠습니까?", message: nil, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default) { _ in
            self.imgList.remove(at: indexPath.row)
            self.collectionView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        [cancel, confirm].forEach(alert.addAction(_:))
        present(alert, animated: true, completion: nil)
    }

}

extension ViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imgList.append(image)
            dismiss(animated: true, completion: { [weak self]  in
                self?.collectionView.reloadData()
            })
        }
    }
}
