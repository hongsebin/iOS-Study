//
//  ViewController+Delegate.swift
//  ToDoListSampleProject
//
//  Created by yeoboya3 on 2023/09/07.
//

import Foundation
import UIKit

// ViewController에서 extension으로 분리
extension ViewController: UITabBarDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoListCell.identifier) as? TodoListCell else { return UITableViewCell() }
        
        return cell
    }
}
