//
//  ViewController.swift
//  0830Navigation
//
//  Created by yeoboya3 on 2023/08/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            // 버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use button"
        } else if  segue.identifier == "editBarButton" {
            // 바버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use Bar button"
        }
    }


}

