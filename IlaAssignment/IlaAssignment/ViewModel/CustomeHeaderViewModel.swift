//
//  CustomeHeaderViewModel.swift
//  IlaAssignment
//
//  Created by Neosoft on 25/06/24.
//

import Foundation

protocol CustomeHeaderProtocol {
    func getNumberOfRows() -> Int
    func getCarouselContent(iIndex: Int) -> CarouselData?
}

class CustomeHeaderViewModel: CustomeHeaderProtocol {
    private var carouselCollection: [CarouselData]?
    init(carouselCollection: [CarouselData]) {
        self.carouselCollection = carouselCollection
    }
    
    func getNumberOfRows() -> Int {
        return carouselCollection?.count ?? 0
    }
    func getCarouselContent(iIndex: Int) -> CarouselData? {
        return carouselCollection?[iIndex]
    }
}

