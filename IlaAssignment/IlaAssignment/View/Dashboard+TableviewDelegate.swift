//
//  Dashboard+TableviewExtention.swift
//  IlaAssignment
//
//  Created by Neosoft on 25/06/24.
//

import Foundation
import UIKit

// MARK: Tableview Data Source method
extension DashBoardViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dashboardViewModel.numberOfSection(isSearchActive: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dashboardViewModel.numberOfRows(iSection: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = dashboardViewModel.getDashboardSectionType(iSection: indexPath.section)
        
        switch sectionType {
        case .listView:
            if let cell: CollectionListTableViewCell = dashboardTableView?.dequeueReusableCell(withIdentifier: DashboardViewConstant.cellIdentifier, for: indexPath) as? CollectionListTableViewCell {
                cell.selectionStyle = .none
                if let appList = dashboardViewModel.getAppListContent(iIndex: indexPath.row) {
                    cell.setContentForList(appContent: appList)
                }
                return cell
            }
        }
        return UITableViewCell()
    }
}
// MARK: Tableview Delegate method
extension DashBoardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let searchHeaderView = SearchHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: SearchHeaderViewConstant.searchSectionHt))
        searchHeaderView.isSearchTapped = { [weak self] isActive in
            DispatchQueue.main.async { [weak self] in
                self?.resetHeaderView(isHide: isActive)
            }
        }
        searchHeaderView.searchText = { [weak self] text in
            self?.dashboardViewModel.applySearch(searchText: text)
            DispatchQueue.main.async { [weak self] in
                self?.dashboardTableView?.reloadData()
            }
        }
        return searchHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 82
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

