//
//  TableviewExtension.swift
//  IlaAssignment
//
//  Created by Neosoft on 25/06/24.
//

import Foundation
import UIKit

extension UITableView {
    func registerCell<T:UITableViewCell>(cellType: T.Type) {
        self.register(UINib(nibName: "\(T.self)", bundle: nil), forCellReuseIdentifier: "\(T.self)")
    }
}
