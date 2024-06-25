//
//  CustomeHeader+CollectionDelegateExtention.swift
//  IlaAssignment
//
//  Created by Neosoft on 25/06/24.
//

import Foundation
import UIKit

extension CustomeHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headerViewModel?.getNumberOfRows() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { 
        let cell: CarouselCollectionViewCell = carouselCollection?.dequeueReusableCell(withReuseIdentifier: "CarouselCollectionViewCell", for: indexPath) as! CarouselCollectionViewCell
        if let carousel = headerViewModel?.getCarouselContent(iIndex: indexPath.row), let image = carousel.image {
            cell.carouselImage?.image = UIImage(named: image)
            cell.carouselImage?.layer.cornerRadius = 25.0
        }
        return cell
    }
}

extension CustomeHeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width  * CustomeHeaderViewConstant.carouselWidthRatio, height: 200.0)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let offsetWidthForOneItem = caculateContentOffsetForItem(scrollView)
        let offsetForCurrentItem = { CGPoint(x: offsetWidthForOneItem * CGFloat(self.currentCarouselIndex), y: targetContentOffset.pointee.y) }
        
        enum HorizontalDirection { case left, right }
        let horizontalDirection: HorizontalDirection = velocity.x > 0 ? .right : .left
        
        switch horizontalDirection {
        case .left:
            let isFirstItem = currentCarouselIndex <= 0
            guard isFirstItem == false else {
                targetContentOffset.pointee = offsetForCurrentItem()
                return
            }
            
            currentCarouselIndex -= 1
            targetContentOffset.pointee = offsetForCurrentItem()
            
        case .right:
            var count = headerViewModel?.getNumberOfRows() ?? 0 
            count = count > 0 ? count - 1 : 0
            let isLastItem = (scrollView.contentOffset.x + offsetWidthForOneItem >= scrollView.contentSize.width) || currentCarouselIndex == count
            guard isLastItem == false else {
                targetContentOffset.pointee = offsetForCurrentItem()
                return
            }
            
            currentCarouselIndex += 1
            targetContentOffset.pointee = offsetForCurrentItem()
        }
        
        updatePageControl()
    }
    
    private func caculateContentOffsetForItem(_ scrollView: UIScrollView) -> CGFloat {
        let cellItemWidth = (self.carouselCollection?.frame.width ?? 0.0) * CustomeHeaderViewConstant.carouselWidthRatio
        let sides = scrollView.frame.width - cellItemWidth
        let oneSide: CGFloat = sides/2
        let nextItemVisiblePart = scrollView.frame.width - (oneSide + cellItemWidth + 0)
        return oneSide + (cellItemWidth - nextItemVisiblePart)
    }
    
    private func updatePageControl() {
        let currentPage = pageControl.currentPage
        
        if currentCarouselIndex != currentPage {
            selectedCarouselHandler?(currentCarouselIndex)
            pageControl.currentPage = currentCarouselIndex
        }
    }
}
