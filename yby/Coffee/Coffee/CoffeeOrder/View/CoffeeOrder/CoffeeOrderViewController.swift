//
//  CoffeeOrderViewController.swift
//  Coffee
//
//  Created by yeoboya3 on 2023/09/20.
//

import Foundation
import UIKit

class CoffeeOrderViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
    }
    
    func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension CoffeeOrderViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
}
