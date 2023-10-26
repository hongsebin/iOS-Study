//
//  MenuCell.swift
//  CoffeeAndImage
//
//  Created by yeoboya3 on 2023/09/14.
//

import Foundation
import UIKit

class MenuCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        imageView.layer.cornerRadius = 20
    }
    
    func setData(menu: Menu) {
        nameLabel.text = menu.name
        imageView.image = UIImage(named: menu.imageName)
    }
}
