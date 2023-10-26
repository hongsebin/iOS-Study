//
//  TableViewCell.swift
//  0831Study
//
//  Created by yeoboya3 on 2023/08/31.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    static let Identifier = "TableViewCell"
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
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
