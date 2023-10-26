//
//  ComposeViewController.swift
//  Memo
//
//  Created by yeoboya3 on 2023/09/15.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // 취소 버튼
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // 저장 버튼
    // 입력되어있는 텍스트를 가져와서 새로운 메모를 생성한 다음에 배열에 저장
    @IBAction func save(_ sender: Any) {
        // TextView에 입력되어 있는 문자열을 memo 상수에 저장
        // memoTextView = 텍스트뷰 아울렛 변수 이름
        let memo = memoTextView.text
        
        // 새로운 메모를 생성하고, 배열에 저장
        // ?? => nil 병함 연산자.
        // memo는 UITextView에서 가져온 텍스트로 옵셔널 String 타입이다. 즉, memo는 문자열일 수도 있고, nil일 수도 있다는 것. ?? 연산자는 memo값이 nil인 경우를 대비하여 기본값으로 빈 문자열 ""을 사용하도록 함.
        let newMemo = Memo(content: memo ?? "")
            Memo.dummyMemoList.append(newMemo)
        
        // 화면 닫기 전 notification 전달
        NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)
        
        dismiss(animated: true, completion: nil)
    }
}

// 노티피케이션 추가
extension ComposeViewController {
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
}
