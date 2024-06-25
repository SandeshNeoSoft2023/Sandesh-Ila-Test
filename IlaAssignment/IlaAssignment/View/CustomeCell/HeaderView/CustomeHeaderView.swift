//
//  CustomeHeaderView.swift
//  IlaAssignment
//
//  Created by Neosoft on 25/06/24.
//

import UIKit

class CustomeHeaderView: UIView {
    
    @IBOutlet weak var carouselCollectionHt: NSLayoutConstraint!
    @IBOutlet weak var headerCarouselView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var carouselCollection: UICollectionView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var searchText:((String) -> Void)?
    var isSearchTapped:((Bool)-> Void)?
    var selectedCarouselHandler:((Int) -> Void)?
    var headerViewModel: CustomeHeaderProtocol?
    var currentCarouselIndex = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        carouselCollection?.registerCell(cellType: CarouselCollectionViewCell.self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func loadNib() {
        Bundle.main.loadNibNamed(CustomeHeaderViewConstant.customeHeaderNib,
                                 owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}


