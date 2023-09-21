//
//  DetailViewController.swift
//  Coffee
//
//  Created by yeoboya3 on 2023/09/20.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var selectedMenu: Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 선택한 메뉴 정보
        if let menu = selectedMenu {
            imageView.image = UIImage(named: menu.imageName)
            nameLabel.text = menu.name
        }
    }
}
