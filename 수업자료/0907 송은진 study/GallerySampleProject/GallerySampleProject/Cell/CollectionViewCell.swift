//
//  CollectionViewCell.swift
//  GallerySampleProject
//
//  Created by ejsong on 2023/09/05.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    @IBOutlet weak var imgView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func commonInit() {
        setUI()
        setConstraint()
    }
    
    func setUI() {
        
    }
    
    func setConstraint() {
        
    }
}
