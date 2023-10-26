//
//  ViewController.swift
//  0903ImageViewer
//
//  Created by yeoboya3 on 2023/09/03.
//

import UIKit

class ViewController: UIViewController {
    var maxImage = 4
    var numImage = 1
    
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgView.image = UIImage(named: "1.png")
    }

    @IBAction func btnPre(_ sender: Any) {
        numImage = numImage - 1
        // numImage가 1일때 이전버튼을 누르면 4로~
        if (numImage < 1) {
            numImage = maxImage
        }
        let imageName = String(numImage) + ".png"
        imgView.image = UIImage(named:imageName)
    }
    
    @IBAction func btnNext(_ sender: Any) {
        numImage = numImage + 1
        
        if (numImage > 4) {
            numImage = 1
        }
        let imageNmae = String(numImage) + ".png"
        imgView.image = UIImage(named: imageNmae)
    }
    
}

