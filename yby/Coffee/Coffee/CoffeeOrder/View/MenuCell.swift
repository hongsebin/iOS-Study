//
//  MenuCell.swift
//  Coffee
//
//  Created by yeoboya3 on 2023/09/20.
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
        imageView.image = UIImage(named: menu.imageName)
        
        nameLabel.text = menu.name
    }
}
