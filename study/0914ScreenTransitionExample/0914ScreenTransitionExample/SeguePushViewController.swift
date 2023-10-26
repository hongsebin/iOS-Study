//
//  SeguePushViewController.swift
//  0914ScreenTransitionExample
//
//  Created by yeoboya3 on 2023/09/14.
//

import UIKit

class SeguePushViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tapBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
//        self.navigationController?.popToRootViewController(animated: true)
    }
}
