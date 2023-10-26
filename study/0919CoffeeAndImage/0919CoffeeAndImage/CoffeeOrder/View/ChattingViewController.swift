//
//  ChattingViewController.swift
//  0919CoffeeAndImage
//
//  Created by yeoboya3 on 2023/10/19.
//

import Foundation
import UIKit

    

class ChattingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendBtn: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!

    
    var chatArray: [String] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        let mine = UINib(nibName: "MyMessageCollectionViewCell", bundle: nil)
        let others = UINib(nibName: "OtherMessageCollectionViewCell", bundle: nil)
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.estimatedItemSize = CGSize(width: collectionView.bounds.width, height: 40)
        collectionView.collectionViewLayout = flowlayout
        
        collectionView.register(mine, forCellWithReuseIdentifier: "MyMessageCollectionViewCell")
        
        collectionView.register(others, forCellWithReuseIdentifier: "OtherMessageCollectionViewCell")
        
    
        
        let mynib = UINib(nibName: "MyMessageCell", bundle: nil)
        let othernib = UINib(nibName: "OtherMessageCell", bundle: nil)
        
//        let flowlayout = UICollectionViewFlowLayout()
//        flowlayout.estimatedItemSize = CGSize(width: collectionView.bounds.width, height: 40)
//        collectionView.collectionViewLayout = flowlayout
        
        tableView.register(mynib, forCellReuseIdentifier: "MyMessageCell")
        tableView.register(othernib, forCellReuseIdentifier: "OtherMessageCell")
        
        addkeyboardObserver()
    }
    
    @IBAction func sendChat(_ sender: Any) {
        
        chatArray.append(
            textField.text ?? "")
        
        // 전송 버튼 누르면 키보드 내려가게
        // textField.resignFirstResponder()
        textField.endEditing(true)
        
        tableView.reloadData()
        collectionView.reloadData()
    }
    
    
    func addkeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardUp(_ sender: Notification) {
        let userInfo = sender.userInfo!
        if let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            let keyboardHeight = keyboardFrame.height
            
            self.view.frame.origin.y = -keyboardHeight
            
        }
    }
    
    @objc func keyboardDown(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    
}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tablebView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 200
        } else {
            return UITableView.automaticDimension
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            
            let myCell = tableView.dequeueReusableCell(withIdentifier: "MyMessageCell", for: indexPath) as? MyMessageCell ?? MyMessageCell()
            
            myCell.chatLabel.text = chatArray[indexPath.row]
            
            return myCell
            
        } else {
            
            let otherCell = tableView.dequeueReusableCell(withIdentifier: "OtherMessageCell", for: indexPath) as? OtherMessageCell ?? OtherMessageCell()
            
            otherCell.chatLabel.text = chatArray[indexPath.row]
            
            return otherCell
        }
        
        
    }
    
    
}

extension ChattingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row % 2 == 0 {
            
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyMessageCollectionViewCell", for: indexPath) as? MyMessageCollectionViewCell ?? MyMessageCollectionViewCell()
            
            myCell.chatLabel.text = chatArray[indexPath.row]
            
            return myCell
            
        } else {
            
            let otherCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherMessageCollectionViewCell", for: indexPath) as? OtherMessageCollectionViewCell ?? OtherMessageCollectionViewCell()
            
            otherCell.chatLabel.text = chatArray[indexPath.row]
            
            return otherCell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatArray.count
    }
    
}
