//
//  ViewController.swift
//  ToDoLIstSampleProject
//
//  Created by ejsong on 2023/09/05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDelegate()
        registerNib()
    }
    
    private func setUI() {
        let registerBtn = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain
                                          , target: self, action: #selector(moveToRegisterVC))
        navigationItem.title = "투두리스트"
        navigationItem.rightBarButtonItem = registerBtn
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerNib() {
        tableView.register(UINib(nibName: "TodoListCell", bundle: nil), forCellReuseIdentifier: TodoListCell.identifier)
    }
    
    @objc private func moveToRegisterVC() {
        let storyboard = UIStoryboard(name: "RegisterViewController", bundle: nil)
        guard let registerVC = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController else { return }
//        registerVC.delegate = self
        
//        navigationController?.present(registerVC, animated: true)
        navigationController?.pushViewController(registerVC, animated: true)
    }
}


/**
 화면 전환 방식
    1. Stack에 쌓아가는 방식 (push)    :  popViewController 제거
    2. 바로 띄우는 방식 (present)         :  dismiss 제거
 */

