//
//  DetailViewController.swift
//  CoffeeAndImage
//
//  Created by yeoboya3 on 2023/09/21.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModel?
    
    // temp segment
    @IBOutlet weak var tempSegment: UISegmentedControl!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // small, medium, large
    @IBOutlet weak var smallView: UIView!
    @IBOutlet weak var mediumView: UIView!
    @IBOutlet weak var largeView: UIView!
    
    // 컵 선택
    @IBOutlet weak var cupSegment: UISegmentedControl!
    
    // 할인
    @IBOutlet weak var discountView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // viewModel의 delegate를 DetailViewController에서 실행. (self)
        viewModel?.delegate = self
        
        // 선택한 메뉴 정보
        if let menu = viewModel?.selectedMenu {
            nameLabel.text = menu.name
            imageView.image = UIImage(named: menu.imageName)
        }
        addTarget()
    }
    
    // temp segment action
    @IBAction func actionTempSegment(_ sender: Any) {
        print(tempSegment.selectedSegmentIndex)
    }
    
    // 컵 선택
    @IBAction func actionCupSegment(_ sender: Any) {
        print(cupSegment.selectedSegmentIndex)
        
        //if cupSegment.selectedSegmentIndex == 1 {
            //discountView.isHidden = false
        //} else {
            //discountView.isHidden = true
        //}
        
        discountView.isHidden = cupSegment.selectedSegmentIndex != 1
    }
    
    // small, medium, large tap action
    func addTarget() {
        let smallViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(smallViewTap(_:)))
        smallView.addGestureRecognizer(smallViewTapGesture)
        
        let mediumViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(mediumViewTap(_:)))
        mediumView.addGestureRecognizer(mediumViewTapGesture)
        
        let largeViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(largeViewTap(_:)))
        largeView.addGestureRecognizer(largeViewTapGesture)
    }
    
    @objc func smallViewTap(_ gesture: UITapGestureRecognizer) {
        print("스몰뷰탭")
        viewModel?.didTapSizeButton(size: .small)
    }
    
    @objc func mediumViewTap(_ gesture: UITapGestureRecognizer) {
        print("미디움뷰탭")
        viewModel?.didTapSizeButton(size: .medium)
    }
    
    @objc func largeViewTap(_ gesture: UITapGestureRecognizer) {
        print("라지뷰탭")
        viewModel?.didTapSizeButton(size: .large)
    }
}

extension DetailViewController: DetailOutput {
    func didchangeSize(size: Size) {
        print("delegate \(size)")
        switch size {
        case .large:
            largeView.backgroundColor = .red
            smallView.backgroundColor = .white
            mediumView.backgroundColor = .white
            
        case .small:
            largeView.backgroundColor = .white
            smallView.backgroundColor = .red
            mediumView.backgroundColor = .white
            
        case .medium:
            largeView.backgroundColor = .white
            smallView.backgroundColor = .white
            mediumView.backgroundColor = .red
        }
    } 
}
