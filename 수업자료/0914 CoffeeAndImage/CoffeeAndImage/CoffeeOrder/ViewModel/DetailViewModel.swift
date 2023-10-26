//
//  DetailViewModel.swift
//  CoffeeAndImage
//
//  Created by yeoboya3 on 2023/09/21.
//

import Foundation

// delegate

// weak var 하려면 :AnyObject 해야됨
protocol DetailOutput: AnyObject {
    func didchangeSize(size: Size)
}
// viewController가 DetailOutput을 채택해야됨


class DetailViewModel {
    var selectedMenu: Menu?
    var size: Size = .small { // 기본값을 small로 초기화
        didSet {
            // size 변수가 바뀌고 나서 하고싶은 일
            
// DetailViewModel 위임자는 didchangeSize를 하라고 시키는거
            // 디테일아웃풋을 채택한 사람만 위임할 수 있는데 디테일뷰컨이 extenstion으로 채택했으니까 디테일뷰컨이 didchangeSize하는거
            delegate?.didchangeSize(size: size)
        }
    }
    
    // weak를 하지 않으면 순환참조가 일어나서 디테일뷰컨을 벗어나도 메모리에 남아있음.
    weak var delegate: DetailOutput?
    
    
    init(selectedMenu: Menu? = nil) {
        self.selectedMenu = selectedMenu
    }
    
    func didTapSizeButton(size: Size) { // 어떤 사이즈의 컵을 눌렀는지 값을 파라미터로 받음
        self.size = size // 선택한 사이즈를 그대로 넣음
    }
    // 미디움 버튼을 누르면 뷰모델에는 미디움에 들어가 있는거.
}
