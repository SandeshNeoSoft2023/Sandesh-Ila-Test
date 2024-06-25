//
//  CollectionListTableViewCell.swift
//  IlaAssignment
//
//  Created by Neosoft on 25/06/24.
//

import UIKit

class CollectionListTableViewCell: UITableViewCell {
    // MARK: Iboutlet
    @IBOutlet weak var labelTitle: UILabel?
    @IBOutlet weak var appImage: UIImageView?
    override func awakeFromNib() {
        super.awakeFromNib()
        appImage?.layer.cornerRadius =
        (appImage?.bounds.height ?? 68) / 2
        appImage?.clipsToBounds = true
        appImage?.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Set Content for element
    func setContentForList(appContent: AppsList) {
        labelTitle?.text = appContent.name
        appImage?.image = UIImage(named: appContent.image ?? "")
    }
}
