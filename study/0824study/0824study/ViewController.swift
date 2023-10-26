//
//  ViewController.swift
//  0824study
//
//  Created by yeoboya3 on 2023/08/24.
//

import UIKit

class ViewController: UIViewController, SecondVCDelegate {
    
    func setTextLabel(_ text: String) {
        button.setTitle(text, for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        addObserver()
        // Do any additional setup after loading the view.
        // 뷰가 만들어질때 최초에 따 한번만 실행됨. / 초기 ui 화면 세팅
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 뷰가 나타나기 직전에 호출
        // 다른 뷰에서 돌아올 때 호출
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 뷰가 화면에 나타난 직후에 실행
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 뷰가 사라지기 직전에 호출
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // 뷰가 제거되었음을 알려줌
    }
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func btnAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SecondViewController", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
//        vc.modalPresentationStyle = .fullScreen
//        default는 모달형식. 다른 것도 나중에 써보기.
        vc.delegate = self// 2. delegate pattern을 통해 데이터 전달 방식
        vc.titleText = "타이틀을 입력해주세요." // 1. 프로퍼티를 통해 데이터 전달 방식
        vc.completion = { [weak self] data in self?.button.setTitle(data, for: .normal)
        }
        self.present(vc, animated: true)
    }
    
    // 4. Notification를 통해 값 전달
    // addobserver : 데이터 선언을 해주는.
    func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(BtnClicked), name: NSNotification(name: "notification"), object: nil)
    }
    
    @objc func BtnClicked(notification : NSNotification) {
        if let text = notification.object as? String{
            button.setTitle(text, for: .normal)
        }
    }
    
}

