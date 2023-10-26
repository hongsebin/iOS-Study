//
//  CollectionViewCell.swift
//  0831Study
//
//  Created by yeoboya3 on 2023/08/31.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    @IBOutlet weak var label: UILabel!
    
    
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
