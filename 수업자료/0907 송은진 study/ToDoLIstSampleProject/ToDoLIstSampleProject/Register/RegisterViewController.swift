//
//  RegisterViewController.swift
//  ToDoLIstSampleProject
//
//  Created by ejsong on 2023/09/05.
//

import Foundation
import UIKit

protocol RegigsterDelegate: AnyObject {
    func didTapRegister(_ text: String)
}

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var registerBtn: UIButton!
    
    weak var delegate: RegigsterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        textView.layer.borderWidth     = 1
        textView.layer.borderColor     = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1).cgColor
        textView.layer.cornerRadius    = 10
        registerBtn.layer.cornerRadius = 10
        textView.contentInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    }
    
    @IBAction func didTapRegister(_ sender: Any) {
        if textView.text.isEmpty { setAlert(); return }
        guard let label = textView.text else { return }
        delegate?.didTapRegister(label)
//        self.dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    private func setAlert() {
        let alert   = UIAlertController(title: "내용을 입력해주세요.", message: nil, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default)
        let cancel  = UIAlertAction(title: "취소", style: .cancel)
        [cancel, confirm].forEach(alert.addAction(_:))
        present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.endEditing(true)
    }
    
    deinit {
        print("RegisterVC deinit")
    }
}
