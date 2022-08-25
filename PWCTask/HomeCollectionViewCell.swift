//
//  HomeCollectionViewCell.swift
//  PWCTask
//
//  Created by Hanriver MacBook on 24/08/22.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var vwSub: UIView!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        vwSub.layer.cornerRadius = 10
        vwSub.layer.borderColor = UIColor.lightGray.cgColor
        vwSub.layer.borderWidth = 1
        lblCount.layer.cornerRadius = lblCount.frame.size.height / 2.0
        lblCount.layer.masksToBounds = true
        super.awakeFromNib()
        // Initialization code
    }

}
