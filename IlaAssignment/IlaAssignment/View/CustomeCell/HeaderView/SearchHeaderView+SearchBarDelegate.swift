//
//  CustomeHeader+SearchBarDelegate.swift
//  IlaAssignment
//
//  Created by Neosoft on 25/06/24.
//

import Foundation
import UIKit

extension SearchHeaderView : UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearchTapped?(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            searchBar.showsCancelButton = true
        })
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == " " && range.location == 0 {
            return false
        }
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchAppListText: String) {
        searchText?(searchAppListText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchText?("")
        searchBar.text = ""
        isSearchTapped?(false)
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
    }
}
