//
//  ViewController.swift
//  0914ScreenTransitionExample
//
//  Created by yeoboya3 on 2023/09/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tabCodePushBtn(_ sender: UIButton) {
        // instantiateViewController 사용해서
        // storyboard에 있는 viewcontroller를 instance화 해야됨
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePushViewController") else {return}
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tabCodePresentBtn(_ sender: UIButton) {
        guard let ViewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") else {return}
        ViewController.modalPresentationStyle = .fullScreen
        self.present(ViewController, animated: true, completion: nil)
    }
}

