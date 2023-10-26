//
//  ViewController.swift
//  ToDoListSampleProject
//
//  Created by yeoboya3 on 2023/09/07.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDelegate()
        registerNib()
        // Do any additional setup after loading the view.
    }
    
    private func setUI() {
        let registerBtn = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(moveToRegisterVC))
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
        // registerVC.delegate = self
        
        // present 방식 : navigation이랑 같은 stack으로 쌓이는 방식.
        // navigationController?.present(registerVC, animated: true)
        
        // push 방식
        navigationController?.pushViewController(registerVC, animated: true)
    }
    


}

