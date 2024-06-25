//
//  ViewController.swift
//  IlaAssignment
//
//  Created by Neosoft on 25/06/24.
//

import UIKit

class DashBoardViewController: UIViewController {
    // MARK: Iboutlet
    @IBOutlet weak var labelNoDat: UILabel?
    @IBOutlet weak var dashboardTableView: UITableView? {
        didSet {
            dashboardTableView?.dataSource = self
            dashboardTableView?.delegate = self
        }
    }
    // MARK: Global variable
    var isSearchEnable: Bool = false
    var dashboardViewModel: DashboardProtocol = DashboardViewModel()
    var headerView: CustomeHeaderView?
    
    // MARK: View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableview()
        fetchDashboardContent()
        setUpHeaderView()
    }
    
    // MARK: Set header view based on search tap
    func resetHeaderView(isHide: Bool) {
        dashboardTableView?.tableHeaderView = isHide ? nil : headerView
    }
}

extension DashBoardViewController {
    fileprivate func setupTableview() {
        self.dashboardTableView?.registerCell(cellType: CollectionListTableViewCell.self)
        if #available(iOS 15.0, *) {
            dashboardTableView?.sectionHeaderTopPadding = 0
        }
    }
    fileprivate func fetchDashboardContent() {
        dashboardViewModel.fetchDashBoardContent()
        
    }
     fileprivate func setUpHeaderView() {
         headerView = CustomeHeaderView(frame: CGRect(x: 0,
                                                      y: 30,
                                                      width: UIScreen.main.bounds.width,
                                                      height: DashboardViewConstant.customeHeaderViewHt))
         
        fetchCarouselData()
        headerView?.carouselCollection.reloadData()
        dashboardTableView?.reloadData()
    }
    
    private func fetchCarouselData() {
        headerView?.headerViewModel =  CustomeHeaderViewModel(carouselCollection: dashboardViewModel.getCarouselCollection()?.data ?? [])
        
        dashboardTableView?.tableHeaderView = headerView
        
        headerView?.selectedCarouselHandler = { [weak self] carouselIndex in
            self?.dashboardViewModel.getAppContentBasedOnCarouselIndex(iIndex: carouselIndex)
            DispatchQueue.main.async { [weak self] in
                self?.dashboardTableView?.reloadData()
            }
        }
    }
}









