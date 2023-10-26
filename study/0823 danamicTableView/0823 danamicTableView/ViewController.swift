//
//  ViewController.swift
//  0823 danamicTableView
//
//  Created by yeoboya3 on 2023/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var MyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}



extension ViewController: UITableViewDelegate {
    
}



extension ViewController: UITableViewDataSource {
    // numberOfRowsInSection : 테이블 뷰 cell의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

