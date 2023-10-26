//
//  ViewController.swift
//  0913 TodoList
//
//  Created by yeoboya3 on 2023/09/13.
//

import UIKit

// ViewController 클래스 정의.
// ViewController 클래스는 UIViewController 클래스를 상속하며
// iOS 앱의 화면을 관리하는 데 사용됨
class ViewController: UIViewController {
    
    // tableView 라는 UITableView 타입의 프로퍼티를 선언하고
    // 프로퍼티를 초기화하는 클로저를 사용하여 UITableView를 생성.
    
    // register(_:forCellReuseIdentifier:) 메서드를 사용하여
    // 테이블 뷰의 재사용 가능한 셀을 등록.
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    // items라는 배열을 선언해서 투두리스트의 항목을 저장.
    var items = [String]()
    
    
    // ViewDidLoad 메서드 : 뷰컨트롤러가 로드된 후 호출됨
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // items배열을 UserDefaults를 사용하여 이전에 저장된 항목을 불러옴
        self.items = UserDefaults.standard.stringArray(forKey: "items") ?? []
        
        // 화면 제목 설정
        title = "투두리스트"
        // tableView를 현재 뷰에 추가
        view.addSubview(tableView)
        // tableView의 데이터 소스를 현재 뷰 컨트롤러('self')로 설정
        tableView.dataSource = self
        
        // 네비게이션 바 오른쪽에 +(추가)버튼을 추가하고, 해당 버튼 누르면 addItemBtn 메서드 실행됨
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemsBtn))
    }
    
    // 뷰의 하위 뷰가 레이아웃일때 호출됨
    // tableView의 프레임을 현재 뷰의 경계(view.bounds)로 설정하여 화면 크기에 맞게 조정
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // +(추가)버튼을 누를때 호출되는 메서드
    @objc func addItemsBtn() {
        let alert = UIAlertController(title: "추가", message: "리스트를 추가하시겠습니까?", preferredStyle: .alert)
        alert .addTextField { textField in
            textField.placeholder = "리스트를 작성해주세요."
        }
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        // 확인을 누르면 ..
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (_) in
            if let textField = alert.textFields?.first{
                if let text = textField.text, !text.isEmpty {
                    DispatchQueue.main.async {
                        var currentItem = UserDefaults.standard.stringArray(forKey: "items") ?? []
                        currentItem.append(text)
                        UserDefaults.standard.setValue(currentItem, forKey: "items")
                        self.items.append(text)
                        self.tableView.reloadData()
                    }
                }
            }
        }))
        present(alert, animated: true)
    }
}

// UITableViewDataSource 프로토콜 구현. : 테이블뷰의 데이터를 제공하는데 사용됨.
// ViewController 클래스가 UITableViewDataSource 츠로토콜을 채택.
extension ViewController: UITableViewDataSource {
    // 빈 테이블을 생성하며, 모든 행의 개수를 0으로 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // 각 셀은 'cell' 식별자를 가진 재사용 가능한 셀을 사용한다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}
