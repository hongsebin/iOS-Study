//
//  SeguePresentViewController.swift
//  0914ScreenTransitionExample
//
//  Created by yeoboya3 on 2023/09/14.
//

import UIKit

class SeguePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tapBackBtn(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
