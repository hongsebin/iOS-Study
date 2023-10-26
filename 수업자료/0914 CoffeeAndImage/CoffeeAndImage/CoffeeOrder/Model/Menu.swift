//
//  Menu.swift
//  CoffeeAndSearchImage
//
//  Created by inforex on 2023/09/13.
//

import Foundation

struct Order {
    var menu: Menu
    var option: Option
}

struct Menu {
    var name: String
    var imageName: String
    var onlyCold: Bool = false
    var onlyHot: Bool = false
}

struct Option {
    var temperature: Temperature
    var size: Size
    var cup: Cup
}

enum Temperature: Int {
    case hot
    case cold
}

enum Size: Int {
    case small
    case medium
    case large
}

enum Cup: Int {
    case store
    case individual
    case disposable
}
