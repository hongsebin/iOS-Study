//
//  OrderViewController.swift
//  0919CoffeeAndImage
//
//  Created by yeoboya3 on 2023/10/05.
//

import Foundation
import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var cupLabel: UILabel!
    
    var menuName: String?
    var temperatureOption: String? // 온도 옵션
    var selectedSize: Size?
    var selectedCup: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = menuName
        tempLabel.text = temperatureOption
        sizeLabel.text = selectedSize?.name
        cupLabel.text = selectedCup
        
       
    }
}
