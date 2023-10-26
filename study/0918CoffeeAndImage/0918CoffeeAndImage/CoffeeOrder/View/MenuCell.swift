//
//  MenuCell.swift
//  0918CoffeeAndImage
//
//  Created by yeoboya3 on 2023/09/18.
//

import Foundation
import UIKit

class MenuCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func setData(menu: Menu) {
        imageView.image = UIImage(named: menu.imageName)
        
        nameLabel.text = menu.name
    }
}
