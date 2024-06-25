//
//  CarouselCollectionViewCell.swift
//  IlaAssignment
//
//  Created by Neosoft on 25/06/24.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
    // MARK: Iboutlet 
    
 //   @IBOutlet weak var viewParent: UIView!
    @IBOutlet weak var carouselImage: UIImageView?
    override func awakeFromNib() {
        super.awakeFromNib()
        carouselImage?.layer.cornerRadius = 20.0
        
    }
}
