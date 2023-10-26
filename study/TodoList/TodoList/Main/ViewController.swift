//
//  ViewController.swift
//  TodoList
//
//  Created by yeoboya3 on 2023/09/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // navigation bar에 title, +버튼 추가
    private func setUI() {
        let registerBtn = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: nil)
        navigationItem.title = "To Do List"
        navigationItem.rightBarButtonItem = registerBtn
    }


}

