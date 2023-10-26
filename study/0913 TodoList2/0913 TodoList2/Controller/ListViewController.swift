//
//  LIstViewController.swift
//  0913 TodoList2
//
//  Created by yeoboya3 on 2023/09/13.
//
// import Foundation

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButton(_ sender: Any) {
        alertWithTextField(with: "Add Item",
                           "",
                           "Add",
                           "Cancel",
                           "Enter here") { text in
        }
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        
        return cell
    }
}
