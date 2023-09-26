//
//  DetailViewModel.swift
//  Coffee
//
//  Created by yeoboya3 on 2023/09/26.
//

import Foundation

// 'DetailViewModel' 클래스는 선택한 메뉴의 정보와 해당 화면에서 사용자의 작업에 대한 데이터를 관리하고, 뷰컨트롤러('DetailViewController')와 데이터를 주고받을 수 있는 인터페이스를 제공한다.
// 선택된 메뉴와 컵 사이즈에 대한 데이터를 관리하고, 이벤트를 처리하는데 사용된다.
// 뷰컨과 뷰모델 사이의 상호 작용을 통해 화면을 업데이트..



// 'DetailOutput' 프로토콜은 'DetailViewModel' 클래스가 뷰 컨트롤러로부터 이벤트나 데이터를 전달하기 위한 인터페이스를 정의한다.
// 'DetailOutput' 프로토콜은 하나의 메서드 'didchangeSize(size:)'를 선언하고 있으며, 이 메스드를 통해 뷰 컨트롤러에게 사이즈 변경 이벤트를 알릴 수 있다.

protocol DetailOutput {
    func didchangeSize(size: Size) // enum Size
}



// 'DetailViewModel' 클래스는 'selectedMenu' 프로퍼티를 통해 선택된 메뉴의 정보를 저장한다. 초기값은 nil로 설정.
class DetailViewModel {
    var selectedMenu: Menu?
    
    
    
    // delegate 프로퍼티는 DetailOutput 프로토콜을 따르는 객체를 참조한다.
    var delegate: DetailOutput?
    
    
    
    // 'size' 프로퍼티는 선택된 컵의 크기를 나타낸다. 기본값은 .small로 설정
    // 이 프로퍼티의 값이 변경될때 ('didSet')
    // delegate를 통해 뷰 컨트롤러에게 사이즈 변경 이벤트를 알린다.
    var size: Size = .small {
        didSet {
            delegate?.didchangeSize(size: size)
        }
    }
    // delegate 프로퍼티는 DetailOutput 프로토콜을 채택하고 있고,
    // DetailOutput 프로토콜은 didchangeSize 메서드를 구현해야 한다.
    
    
    
    // init(selectedMenu:) 생성자는 선택된 메뉴 정보를 초기화할때 사용됨
    // 이 생성자를 통해 초기 선택된 메뉴를 설정할 수 있다.
    init(selectedMenu: Menu? = nil) {
        self.selectedMenu = selectedMenu
    }
    
    
    
    // didTapSizeButton(size:) 메서드는 사용자가 화면에서 컵 사이즈를 선택했을 때 호출됨
    // 이 메서드를 통해 선택된 컵 사이즈를 업데이트하고, 변경된 사이즈를 delegate를 통해 뷰컨에 알린다.
    func didTapSizeButton(size: Size) {
        self.size = size
    }
}
