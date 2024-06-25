//
//  CollectionViewExtension.swift
//  IlaAssignment
//
//  Created by Neosoft on 25/06/24.
//

import Foundation
import UIKit

extension UICollectionView {
    func registerCell<T:UICollectionViewCell>(cellType: T.Type) {
        self.register(UINib(nibName: "\(T.self)", bundle: .main), forCellWithReuseIdentifier: "\(T.self)")
    }
}
