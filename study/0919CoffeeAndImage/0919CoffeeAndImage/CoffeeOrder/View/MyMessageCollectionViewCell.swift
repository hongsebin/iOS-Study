//
//  MyMessageCollectionViewCell.swift
//  0919CoffeeAndImage
//
//  Created by yeoboya3 on 2023/10/19.
//

import Foundation
import UIKit

class MyMessageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var chatLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let targetSize = CGSize(width: layoutAttributes.frame.width, height: 40)
        layoutAttributes.frame.size = self.contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        
        return layoutAttributes
    }
}
