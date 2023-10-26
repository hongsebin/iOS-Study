//
//  Menu.swift
//  0919CoffeeAndImage
//
//  Created by yeoboya3 on 2023/09/19.
//

import Foundation

struct Menu {
    var name: String
    var imageName: String
    var onlyCold: Bool = false
    var onlyHot: Bool = false
}

enum Temperature: Int {
    case hot
    case cold
}

enum Size: Int {
    case small
    case medium
    case large
    
    var name: String {
        switch self {
        case .small:
            return "small"
        case .medium:
            return "medium"
        case .large:
            return "large"
        }
    }
}

enum Cup: Int {
    case store
    case individual
    case disposable
}

struct Option {
    var temperature: Temperature
    var size: Size
    var cup: Cup
}

struct Order {
    var menu: Menu // 메뉴 구조체 사용
    var option: Option
}
