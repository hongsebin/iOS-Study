//
//  DetailViewController.swift
//  Coffee
//
//  Created by yeoboya3 on 2023/09/20.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    
    
    // viewModel 변수에 DetailViewModel 클래스 할당.
    // nil값을 가질 수 있음
    var viewModel: DetailViewModel?
    
    
    
    // 선택한 음료 이름,사진
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // temp segment
    @IBOutlet weak var tempSegment: UISegmentedControl!
    
    // cup size
    @IBOutlet weak var smallView: UIView!
    @IBOutlet weak var mediumView: UIView!
    @IBOutlet weak var largeView: UIView!
    
    // cup size Uiview radius 설정
    func viewRadius() {
        smallView.layer.cornerRadius = 8
        mediumView.layer.cornerRadius = 8
        largeView.layer.cornerRadius = 8
        
        smallView.layer.borderWidth = 2
        smallView.layer.borderColor = UIColor.systemGray5.cgColor
        
        mediumView.layer.borderWidth = 2
        mediumView.layer.borderColor = UIColor.systemGray5.cgColor
        
        largeView.layer.borderWidth = 2
        largeView.layer.borderColor = UIColor.systemGray5.cgColor
    }
    
    // 컵 선택
    @IBOutlet weak var cupSegment: UISegmentedControl!
    
    // 할인
    @IBOutlet weak var discountView: UIView!
    
    // 선택 완료
    @IBAction func orderButton(_ sender: Any) {
    }
    
    
    // 수정
    var selectedMenu: Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewRadius()
//        addTarget()
        
        
        
        // viewModel의 delegate를 DetailViewController에서 실행
        viewModel?.delegate = self
        
        
        
        // 선택한 메뉴 정보
        if let menu = selectedMenu {
            imageView.image = UIImage(named: menu.imageName)
            nameLabel.text = menu.name
        }
    }
    
    
    // temp segment action ( Hot = 0 / Cold = 1 )
    @IBAction func actionTempSegment(_ sender: Any) {
        print(tempSegment.selectedSegmentIndex)
    }
    
    // cupSegment action ( 일회용 = 0 / 개인 = 1 / 매장 = 2 )
    @IBAction func actionCupSegment(_ sender: Any) {
        print(cupSegment.selectedSegmentIndex)
        
        // 개인컵일때만 discountView 보이게
        discountView.isHidden = cupSegment.selectedSegmentIndex != 1
    }
    
    // cup size button select action ( 색상 변경 )
    @IBAction func actionSmallButton(_ sender: Any) {
        smallButton.backgroundColor = .systemGreen
        mediumButton.backgroundColor = .white
        largeButton.backgroundColor = .white
        
        viewModel?.didTapSizeButton(size: .small)
    }
    @IBAction func actionMediumButton(_ sender: Any) {
        smallButton.backgroundColor = .white
        mediumButton.backgroundColor = .systemGreen
        largeButton.backgroundColor = .white
        
        viewModel?.didTapSizeButton(size: .medium)
    }
    @IBAction func actionLargeButton(_ sender: Any) {
        smallButton.backgroundColor = .white
        mediumButton.backgroundColor = .white
        largeButton.backgroundColor = .systemGreen
        
        viewModel?.didTapSizeButton(size: .large)
    }
}



extension DetailViewController: DetailOutput {
    func didchangeSize(size: Size) {
        print("delegate \(size)")
    }
}
