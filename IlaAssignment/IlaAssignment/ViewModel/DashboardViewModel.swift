//
//  DashboardViewModel.swift
//  IlaAssignment
//
//  Created by Neosoft on 25/06/24.
//

import Foundation

// MARK: Protocol for dashboard view
protocol DashboardProtocol {
    func fetchDashBoardContent()
    func getDashboardSectionType(iSection: Int) -> DashboardSection
    func numberOfSection(isSearchActive: Bool) -> Int
    func numberOfRows(iSection: Int) -> Int
    func getAppListContent(iIndex: Int) -> AppsList?
    func getCarouselCollection() -> DashboardModel?
    func applySearch(searchText: String)
    func getAppContentBasedOnCarouselIndex(iIndex: Int)
}

class DashboardViewModel: DashboardProtocol {
    var dashboardMainCollection: DashboardModel?
    var dashboardAppCollection: [AppsList]?
    var collectionData: DashboardModel?
    var listCollection: DashboardModel?
    var jsonData: FileReaderProtocol = FileReader()
    var carouselIndex: Int = 0
    
    func fetchDashBoardContent() {
        if let collection: DashboardModel = jsonData.readFile(fileName: DashboardViewConstant.fileName, fileExt: DashboardViewConstant.fileExtention) {
            dashboardMainCollection = collection
            dashboardAppCollection = collection.data?.first?.appsList
        }
    }
    
    func getDashboardSectionType(iSection: Int) -> DashboardSection {
        return DashboardSection.allCases[iSection]
    }
    
    func numberOfSection(isSearchActive: Bool) -> Int {
        return DashboardSection.allCases.count
    }
    func numberOfRows(iSection: Int) -> Int {
        switch DashboardSection.allCases[iSection] {
        case .listView:
            return dashboardAppCollection?.count ?? 0
        }
    }
    func getAppListContent(iIndex: Int) -> AppsList? {
        return dashboardAppCollection?[iIndex] ?? nil
    }
    
    func getCarouselCollection() -> DashboardModel? {
        return dashboardMainCollection ?? nil
    }
    
    func applySearch(searchText: String) {
        if searchText.isEmpty {
            dashboardAppCollection = dashboardMainCollection?.data?[carouselIndex].appsList
            return
        }
        if dashboardAppCollection?.count ?? 0 < 1 {
            dashboardAppCollection = dashboardMainCollection?.data?[carouselIndex].appsList
        }
        let result =  dashboardAppCollection?.filter {
            ($0.name ?? "").lowercased().contains(searchText.lowercased())
        }
        dashboardAppCollection = result
    }
    
    func getAppContentBasedOnCarouselIndex(iIndex: Int) {
        carouselIndex = iIndex
        dashboardAppCollection = dashboardMainCollection?.data?[iIndex].appsList
    }
}

