import UIKit

class TodoListCell: UITableViewCell {
    static let identifier = "TodoListCell"
//
//    weak var delegate : TodoListCellDelegate?
//    var index : Int = 0
    
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    
    @IBAction func didTabCheckBtn(_ sender: Any) {
        checkBtn.isSelected.toggle()
        // delegate?.didTapCheckBtn(index)
    }

}
