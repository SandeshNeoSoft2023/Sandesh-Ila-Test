//
//  SearchHeaderView.swift
//  IlaAssignment
//
//  Created by Neosoft on 25/06/24.
//

import UIKit

class SearchHeaderView: UIView {
 @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    var searchText:((String) -> Void)?
    var isSearchTapped:((Bool)-> Void)?
    var selectedCarouselHandler:((Int) -> Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        searchBar.searchTextField.textColor = .black
        searchBar.placeholder = SearchHeaderViewConstant.searchPlaceholder
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func loadNib() {
        Bundle.main.loadNibNamed(SearchHeaderViewConstant.customeSearchNib, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
