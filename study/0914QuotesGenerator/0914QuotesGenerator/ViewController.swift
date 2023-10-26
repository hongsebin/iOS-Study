//
//  ViewController.swift
//  0914QuotesGenerator
//
//  Created by yeoboya3 on 2023/09/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelContent: UILabel!
    
    let Quotes = [
        Quote(content: "1명언입니다. 명언명언명언", name: "이름1"),
        Quote(content: "2명언입니다. 명언명언명언", name: "이름2"),
        Quote(content: "3명언입니다. 명언명언명언", name: "이름3"),
        Quote(content: "4명언입니다. 명언명언명언", name: "이름4"),
        Quote(content: "5명언입니다. 명언명언명언", name: "이름5"),
        Quote(content: "6명언입니다. 명언명언명언", name: "이름6"),
        Quote(content: "7명언입니다. 명언명언명언", name: "이름7")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tabGenerateBtn(_ sender: Any) {
        let random = Int(arc4random_uniform(7))
        
        let quote = Quotes[random]
        
        self.labelName.text = quote.name
        self.labelContent.text = quote.content
    }
    
}

