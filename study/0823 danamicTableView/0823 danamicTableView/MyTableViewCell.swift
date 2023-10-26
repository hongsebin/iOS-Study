//
//  MyTableViewCell.swift
//  0823 danamicTableView
//
//  Created by yeoboya3 on 2023/08/23.
//

import Foundation
import UIKit

class MyTableViewCell: UITableViewCell {
    
    // cell이 렌더링될 때
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("MyTableViewCell - awakeFromNib() called")
    }
}

