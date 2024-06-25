//
//  Constant.swift
//  IlaAssignment
//
//  Created by Neosoft on 25/06/24.
//

import Foundation
struct DashboardViewConstant {
    static let cellIdentifier = "CollectionListTableViewCell"
    static let customeHeaderViewHt = 240.0
    static let fileName = "data"
    static let fileExtention = "json"
}

struct CustomeHeaderViewConstant {
   static let customeHeaderNib = "CustomeHeaderView"
    static let carouselWidthRatio = 0.85
}

struct SearchHeaderViewConstant {
    static let customeSearchNib = "SearchHeaderView"
    static let searchPlaceholder = "Search"
    static let searchSectionHt = 70.0
}

enum DashboardSection: CaseIterable {
    case listView
}
