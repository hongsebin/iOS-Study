//
//  ViewController.swift
//  0903ImageView
//
//  Created by yeoboya3 on 2023/09/03.
//

import UIKit

class ViewController: UIViewController {
    
    // 변수 추가
    var isZoom = false
    var imgOn: UIImage? // 켜진 전구 이미지가 있는 UIImage 타입의 변수
    var imgOff: UIImage? // 꺼진 전구 이미지가 있는 UIImage 타입의 변수

    @IBOutlet var btnResize: UIButton!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // UIImage 타입의 변수에 이미지를 지정하기 위한 코드 추가
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn
        // imgView.image에 lamp_on.png를 지정했으니 해당 이미지가 화면에 나타남
    }

    // 확대 버튼에 대한 action 함수
    @IBAction func btnResizeImage(_ sender: UIButton) {
        // CGFloat: 실수형 타입
        // scale상수: 이미지를 확대할 배율값을 의미
        let scale:CGFloat = 2.0
        // newWidth,newHeight: 확대/축소 했을때 이미지의 가로,세로 길이를 저장할 변수
        var newWidth:CGFloat, newHeight:CGFloat
        
        if (isZoom) { // true
            // 이미지 프레임의 가로,세로 크기에 scale값을 나누어 newWidth,newHeight에 할당
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            
            // btnResize의 텍스트를 "확대"로 변경
            btnResize.setTitle("확대", for: .normal)
        }
        else { // false
            // 이미지 프레임의 가로,세로 크기에 scale값을 곱해 newWidth,newHeight에 할당
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        // CGSize 메서드를 사용해 이미지 뷰의 프레임 크기를 변경
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
        }
    }
}

