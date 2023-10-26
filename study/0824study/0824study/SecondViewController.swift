//
//  SecondViewController.swift
//  0824study
//
//  Created by yeoboya3 on 2023/08/24.
//

import Foundation
import UIKit
protocol SecondVCDelegate: AnyObject {
    func setTextLabel(_ text: String)
}

class SecondViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    var titleText : String?
    weak var delegate : SecondVCDelegate?
    var completion: ((String) -> ())? // 클로저 선언
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleText
    }
    
    @IBAction func gotoMainVC(_ sender: Any) {
//        delegate?.setTextLabel("ddd")
//        completion?("안녕하세요")
        // post : 보내는
        NotificationCenter.default.post(name: NSNotification.Name("notification"), object: "데이터전달")
        
        self.dismiss(animated: true)
    }
    
    deinit {
        print("SecondViewController deinit")
    }
    
    
}
