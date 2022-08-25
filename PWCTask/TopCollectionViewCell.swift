//
//  TopCollectionViewCell.swift
//  PWCTask
//
//  Created by Hanriver MacBook on 24/08/22.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var vwSub: UIView!
    @IBOutlet weak var lblBottom: UILabel!
    @IBOutlet weak var lblTop: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblCount.layer.cornerRadius = lblCount.frame.size.height / 2.0
        lblCount.layer.masksToBounds = true
        
        vwSub.layer.cornerRadius = 10
        // Initialization code
    }

}
