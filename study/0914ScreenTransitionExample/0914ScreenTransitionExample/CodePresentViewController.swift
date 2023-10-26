//
//  CodePresentViewController.swift
//  0914ScreenTransitionExample
//
//  Created by yeoboya3 on 2023/09/14.
//

import UIKit

class CodePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tabBackBtn(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
