//
//  ViewController.swift
//  0830PageControl
//
//  Created by yeoboya3 on 2023/08/30.
//

import UIKit

var images = [ "01.png", "02.png", "03.png", "04.png", "05.png", "06.png" ]

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    // 뷰가 로드되었을 때 호출됨
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 페이지 컨트롤의 전체 페이지를 images 배열의 전체 개수 값으로 설정
        pageControl.numberOfPages = images.count
        
        pageControl.currentPage = 0
        
        // 페이지 표시 색상을 초록색으로 설정
        pageControl.pageIndicatorTintColor = UIColor.green
        
        // 현재 페이지 표시 색상을 빨간색으로 설정
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        imgView.image = UIImage(named: images[0])
    }

    // 페이지가 변하면 호출됨
    @IBAction func pageControl(_ sender: UIPageControl) {
        // images라는 배열에서 pageControl이 가리키는 현재 페이지에 해당하는 이미지를 imgView에 할당
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
}

