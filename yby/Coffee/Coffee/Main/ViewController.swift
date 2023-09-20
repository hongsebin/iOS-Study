//
//  ViewController.swift
//  Coffee
//
//  Created by yeoboya3 on 2023/09/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageSearchBtn: UIButton!
    @IBOutlet weak var coffeeOrderBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func coffeeOrderBtnTap(_ sender: Any) {
        
        // CoffeeOrderViewController storyboard 찾아서 저장
        let story = UIStoryboard(name: "CoffeeOrderViewController", bundle: nil)
        
        // 위 스토리보드와 연결된 vc 저장
        let vc = story.instantiateViewController(withIdentifier: "CoffeeOrderViewController")
    }
    
    @IBAction func imageSearchBtnTap(_ sender: Any) {
        print("Tap imageSearchBtn")
    }
    
}

