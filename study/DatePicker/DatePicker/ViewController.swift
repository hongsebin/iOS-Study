//
//  ViewController.swift
//  DatePicker
//
//  Created by yeoboya3 on 2023/09/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        // 데이트피커를 선택할때 changeDatePicker 액션함수가 실행되는데, 이때 sender라는 UIDatePicker 자료형 인수가 전달된다.
        // 이 sender를 datePickerView라는 상수에 저장한다.
        let datePickerView = sender
        
        // 날짜를 출력하기 위해 DateFormatter라는 클래스 상수 formatter을 선언
        let formatter = DateFormatter()
        
        // formatter의 dateFormat 속성 설정
        formatter.dateFormat = "yyyy-MMM-dd HH:mm EEE"
        
        
        lblPickerTime.text = "선택한 시간은 -> " + formatter.string(from: datePickerView.date)
        
        
        
    }
    
}

