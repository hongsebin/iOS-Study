//
//  ImageViewModel.swift
//  0919CoffeeAndImage
//
//  Created by yeoboya3 on 2023/10/05.
//

import Foundation

class ImageViewModel {
    
    // 뷰모델 역활
    // 1. 텍스트 필드의 값을 가지고 있고
    // 텍스트필드 값
    var inputText: String?
    // 이미지 데이터
    var imageList: [String] = []
    
    // 2. 검색 버튼을 눌럿을때 api 네트워크 통신
    func searchButtonTap() {
        guard let searchWord = self.inputText else { return }
        // inputtext가 nil이면 return.
        
        print(searchWord)
        // searchWord를 가지고 네트워크 통신
    }
    
    // 3. 네트워크 통신을 통해 받아온 이미지 데이터를 가지고 있기
}
