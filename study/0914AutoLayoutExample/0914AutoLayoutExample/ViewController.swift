//
//  ViewController.swift
//  0914AutoLayoutExample
//
//  Created by yeoboya3 on 2023/09/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapChangeColorButton(_ sender: UIButton) {
        self.colorView.backgroundColor = UIColor.red
        print("색상 변경 버튼이 클릭되었습니다.")
    }
    
}

