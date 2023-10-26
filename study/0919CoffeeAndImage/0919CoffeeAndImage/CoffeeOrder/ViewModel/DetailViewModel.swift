//
//  DetailViewModel.swift
//  0919CoffeeAndImage
//
//  Created by yeoboya3 on 2023/09/25.
//

import Foundation

protocol DetailOutput: AnyObject {
    func didchangeSize(size: Size)
    
    func didChangeOrderButtonState(isEnabled: Bool)
}

class DetailViewModel {
    var selectedMenu: Menu?
    var size: Size = .small {
        didSet {
            delegate?.didchangeSize(size: size)
        }
    }
    
    var selectedSize: Size?
    var selectedMenuName: String? // 선택한 메뉴 이름
    var selectedTemperature: String? // 선택한 온도 옵션
    var selectedCup: String? // 선택한 컵 종류
    
    weak var delegate: DetailOutput?
    
    init(selectedMenu: Menu? = nil) {
        self.selectedMenu = selectedMenu
        if let menu = selectedMenu {
            selectedMenuName = menu.name // 선택한 메뉴의 이름 설정
        }
    }
    
    func didTapSizeButton(size: Size) {
        self.size = size
        
        // 사이즈 선택 후 orderButton 활성화
        self.selectedSize = size
        delegate?.didchangeSize(size: size)
        updateOrderButtonState()
    }
    
    func didTapTemperatureOption(option: String) {
        self.selectedTemperature = option // 온도 옵션 저장
    }
    
    func didTapCupOption(option: String) {
        self.selectedCup = option // 컵 종류 저장
    }
    
    // 버튼 상태 업데이트 메서드
    private func updateOrderButtonState() {
        if let selectedSize = selectedSize {
            delegate?.didChangeOrderButtonState(isEnabled: true)
        } else {
            delegate?.didChangeOrderButtonState(isEnabled: false)
        }
    }
}
