//
//  MainDataModel.swift
//  IlaAssignment
//
//  Created by Neosoft on 25/06/24.
//

import Foundation
struct DashboardModel : Codable {
    var data: [CarouselData]?
}

struct CarouselData : Codable {
    let name : String?
    let image : String?
    var appsList : [AppsList]?
}

struct AppsList : Codable {
    let name : String?
    let image : String?
}
