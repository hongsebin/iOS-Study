//
//  CodePushViewController.swift
//  0914ScreenTransitionExample
//
//  Created by yeoboya3 on 2023/09/14.
//

import UIKit

class CodePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tabBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
