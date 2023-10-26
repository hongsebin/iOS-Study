//
//  ViewController.swift
//  CoffeeAndImage
//
//  Created by yeoboya3 on 2023/09/14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var coffeeOrderButton: UIButton!
    @IBOutlet weak var imageSearchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func coffeeOrderButtonTap(_ sender: Any) {
        // 스토리보드 찾기
        let story = UIStoryboard(name: "CoffeeOrderViewController", bundle: nil)
        
        guard let vc = story.instantiateViewController(withIdentifier: "CoffeeOrderViewController") as? CoffeeOrderViewController,
            let navi = self.navigationController
        else { return }
        
        navi.pushViewController(vc, animated: true)
        
    }
    @IBAction func imageSearchButtonTap(_ sender: Any) {
        
    }
    
}

