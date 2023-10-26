//
//  TodoListCell.swift
//  TodoList
//
//  Created by yeoboya3 on 2023/09/15.
//

import Foundation
import UIKit

protocol TodoListCellDelegate : AnyObject {
    func didTabCheckBtn(_ index: Int)
}

class TodoListCell: UITableViewCell {
    
    static let identifier = "TodoListCell"
    
    weak var delegate : TodoListCellDelegate?
    var index : Int = 0
    
}
