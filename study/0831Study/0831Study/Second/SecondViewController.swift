//
//  SecondViewController.swift
//  0831Study
//
//  Created by yeoboya3 on 2023/08/31.
//

import Foundation
import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondVC ViewDidLoad")
        setDelegate()
        registerNib()
    }
    
    private func setDelegate() {
        tableView.delegate  = self
        tableView.dataSource = self
    }
    
    private func registerNib() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: TableViewCell.Identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.Identifier) as? TableViewCell else { return UITableViewCell() }
        
        cell.imgView.backgroundColor = indexPath.row % 2 == 0 ? .black : .red
        cell.label.text = "item\(indexPath.row)"
        return cell
    }
    
    // 셀 높이 리턴
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt \(indexPath.row)")
    }
    
}
