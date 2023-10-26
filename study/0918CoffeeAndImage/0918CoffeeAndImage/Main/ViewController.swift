//
//  ViewController.swift
//  0918CoffeeAndImage
//
//  Created by yeoboya3 on 2023/09/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var coffeeOrderButton: UIButton!
    
    @IBOutlet weak var imageSearchButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func coffeeOrderButtonTap(_ sender: Any) {
        
        let story = UIStoryboard(name: "CoffeeOrderViewController", bundle: nil)
        
        guard let vc = story.instantiateViewController(withIdentifier: "CoffeeOrderViewController") as? CoffeeOrderViewController,
              let navi = self.navigationController else { return }
        
        navi.pushViewController(vc, animated: true)
    }
    
    @IBAction func imageSearchButtonTap(_ sender: Any) {
    }
}

