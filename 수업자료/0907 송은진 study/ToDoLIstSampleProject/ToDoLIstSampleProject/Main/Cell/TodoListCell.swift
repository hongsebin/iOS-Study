//
//  ToDoListCell.swift
//  ToDoLIstSampleProject
//
//  Created by ejsong on 2023/09/05.
//

import Foundation
import UIKit

protocol TodoListCellDelegate : AnyObject {
    func didTapCheckBtn(_ index: Int)
}

class TodoListCell: UITableViewCell {
    
    static let identifier = "TodoListCell"
    
    weak var delegate : TodoListCellDelegate?
    var index : Int = 0
    
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var label: UILabel!
     
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder : NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        selectedBackgroundView?.backgroundColor = .clear
    }
    
    func setUI(_ data: TodoList) {
        label.text = data.content
        checkBtn.isSelected = data.isCompleted
    }

    @IBAction func didTapCheckBtn(_ sender: Any) {
        checkBtn.isSelected.toggle()
        delegate?.didTapCheckBtn(index)
    }
}
