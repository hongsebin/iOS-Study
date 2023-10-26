//
//  CoffeeOrderViewModel.swift
//  0919CoffeeAndImage
//
//  Created by yeoboya3 on 2023/09/19.
//

import Foundation

class CoffeeOrderViewModel {
    
    // menuList 배열에 Menu 구조체의 인스턴스들을 저장할 수 있다.
    var menuList: [Menu] = []
    
    init() {
        
        addMenu()
        
        func addMenu() {
            let menu1: Menu = .init(name: "콜드브루", imageName: "coldBrew", onlyCold: true)
            let menu2: Menu = .init(name: "아메리카노", imageName: "americano")
            let menu3: Menu = .init(name: "카라멜 마끼아또", imageName: "caramel")
            let menu4: Menu = .init(name: "카푸치노", imageName: "cafuchino")
            let menu5: Menu = .init(name: "돌체라떼", imageName: "dolce")
            let menu6: Menu = .init(name: "카페모카", imageName: "cafeMocha")
            let menu7: Menu = .init(name: "에스프레소", imageName: "espresso")
            let menu8: Menu = .init(name: "자바칩 프라푸치노", imageName: "javaFrapuchino")
            let menu9: Menu = .init(name: "녹차 프라푸치노", imageName: "greenfrapuchino")
            let menu10: Menu = .init(name: "망고 블렌디드", imageName: "mangoBlended")
            let menu11: Menu = .init(name: "피치 블렌디드", imageName: "peachBlended")
            let menu12: Menu = .init(name: "딸기 리프레셔", imageName: "strawberryRefresher")
            let menu13: Menu = .init(name: "자몽 허니 블랙 티", imageName: "jamongHoneyBlackTea")
            let menu14: Menu = .init(name: "얼그레이 티", imageName: "earlgreyTea")
            let menu15: Menu = .init(name: "히비스커스 티", imageName: "hibiscusTea")
            let menu16: Menu = .init(name: "캐모마일 티", imageName: "camomile")
            let menu17: Menu = .init(name: "핫 초코", imageName: "hotChoco", onlyHot: true)
            let menu18: Menu = .init(name: "우유", imageName: "milk")
            let menu19: Menu = .init(name: "여수 피지오", imageName: "yeosuFigio")
            let menu20: Menu = .init(name: "레몬 피지오", imageName: "lemonFigio")
            
            self.menuList = [menu1, menu2, menu3, menu4, menu5, menu6, menu7, menu8, menu9, menu10, menu11, menu12, menu13, menu14, menu15, menu16, menu17, menu18, menu19, menu20]
        }
    }
}
