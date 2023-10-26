//
//  DetailViewController.swift
//  0919CoffeeAndImage
//
//  Created by yeoboya3 on 2023/09/20.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModel?
    // viewModel이라는 변수 정의.
    // 이 변수에 DetailViewModel 클래스를 할당한다.
    // viewModel 변수는 nil값을 가질 수 있음
    
    
    // @IBOutlet ------------------------------------------------------
    // 선택한 셀 이미지, 라벨
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // temp segment
    @IBOutlet weak var tempSegment: UISegmentedControl!
    
    // cup size
    @IBOutlet weak var smallView: UIView!
    @IBOutlet weak var mediumView: UIView!
    @IBOutlet weak var largeView: UIView!
    
    // cup size UiView radius 설정
    func viewRadius () {
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
    
    // cup segment
    @IBOutlet weak var cupSegment: UISegmentedControl!
    
    // discount
    @IBOutlet weak var discountView: UIView!
    
    
    @IBOutlet weak var orderButton: UIButton!
    // @IBOutlet ------------------------------------------------------
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewRadius()
        addTarget()
        
        // viewModel의 delegate를 DetailViewController에서 실행
        viewModel?.delegate = self
        
        // 선택한 메뉴 정보
        if let menu = viewModel?.selectedMenu {
            nameLabel.text = menu.name
            imageView.image = UIImage(named: menu.imageName)
            
            // 선택한 메뉴 이름을 ViewModel에 전달
            viewModel?.selectedMenuName = menu.name
        }
    }
    
    
    
    
    // actionTempSegment
    @IBAction func actionTempSegment(_ sender: Any) {
        print(tempSegment.selectedSegmentIndex)
        
        if tempSegment.selectedSegmentIndex == 0 {
            viewModel?.didTapTemperatureOption(option: "Hot")
        } else {
            viewModel?.didTapTemperatureOption(option: "Cold")
        }
    }
    
    // actionCupSegment
    // 개인 컵 사용 시 500원할인 Ui View 보이게.
    @IBAction func actionCupSegment(_ sender: Any) {
        let selectedCupSegment = cupSegment.selectedSegmentIndex
        
        /*
        if selectedCupSegment != 1 {
            discountView.isHidden = true
        } else {
            discountView.isHidden = false
        }
        */
        
        discountView.isHidden = selectedCupSegment != 1
        
        if selectedCupSegment == 0 {
            viewModel?.didTapCupOption(option: "일회용 컵")
        } else if selectedCupSegment == 1 {
            viewModel?.didTapCupOption(option: "개인 컵")
        } else {
            viewModel?.didTapCupOption(option: "매장 컵")
        }
    }
    
    @IBAction func orderButton(_ sender: Any) {

        let story = UIStoryboard(name: "OrderViewController", bundle: nil)
        
        guard let vc = story.instantiateViewController(withIdentifier: "OrderViewController") as? OrderViewController,
        let navi = self.navigationController else { return }
        
        // OrderViewController의 menuName에 선택한 메뉴 이름 전달
        vc.menuName = viewModel?.selectedMenuName
        // 온도 옵션 전달
        vc.temperatureOption = viewModel?.selectedTemperature
        
        vc.selectedSize = viewModel?.selectedSize
        
        vc.selectedCup = viewModel?.selectedCup
        
        navi.pushViewController(vc, animated: true)
    }
    
    
    
    // small, medium, large tap action
    // Ui View는 action/outlet 변수와 연결할 수 없음
    // 각 뷰에 탭 제스처를 추가하고, 탭 이벤트가 발생했을 때 해당 메서드를 호출하도록 설정.
    func addTarget() {
        let smallViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(smallViewTap(_:)))
        // UITapGestureRecognizer을 사용해 각 뷰에 대한 탭 제스처를 생성.
        // #selector을 사용하여 호출할 메서드를 지정 (smallViewTap() 등)
        smallView.addGestureRecognizer(smallViewTapGesture)
        // 각 뷰에 생성된 제스처를 추가하고, 해당 뷰에서 탭이 감지될 때 연결된 메서드가 호출됨
        
        // _:
        // 외부에서 메서드를 호출할 때 메서드에 전달되는 인자(매개변수)를 가리킨다.
        // 구체적인 인자 이름 없이 메서드를 호출할 수 있다.
        
        
        let mediumViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(mediumViewTap(_:)))
        mediumView.addGestureRecognizer(mediumViewTapGesture)
        
        let largeViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(largeViewTap(_:)))
        largeView.addGestureRecognizer(largeViewTapGesture)
    }
    
    @objc func smallViewTap(_ gesture: UITapGestureRecognizer) {
        // print("small view tap")
        viewModel?.didTapSizeButton(size: .small)
        viewModel?.selectedSize = .small
    }
    
    @objc func mediumViewTap(_ gesture: UIGestureRecognizer) {
        // print("medium view tap")
        viewModel?.didTapSizeButton(size: .medium)
        viewModel?.selectedSize = .medium
    }
    
    @objc func largeViewTap(_ gesture: UIGestureRecognizer) {
        // print("large view tap")
        viewModel?.didTapSizeButton(size: .large)
        viewModel?.selectedSize = .large
    }
}


extension DetailViewController: DetailOutput {
    func didchangeSize(size: Size) {
         print("delegate \(size)")
        
        switch size {
        case .small:
            smallView.backgroundColor = .systemGreen
            mediumView.backgroundColor = .white
            largeView.backgroundColor = .white
        case .medium:
            mediumView.backgroundColor = .systemGreen
            smallView.backgroundColor = .white
            largeView.backgroundColor = .white
        case .large:
            largeView.backgroundColor = .systemGreen
            smallView.backgroundColor = .white
            mediumView.backgroundColor = .white
        }
    }
    
    func didChangeOrderButtonState(isEnabled: Bool) {
        orderButton.isEnabled = isEnabled
    }
}
