//
//  SiteBar.swift
//  PK-Shop
//
//  Created by Trioangle on 02/09/24.
//

import UIKit

class SiteBar: UITableViewCell {
    
    @IBOutlet weak var elevateView: UIView!
    @IBOutlet weak var imageViewfor: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.elevateView.layer.shadowRadius = 3
        self.elevateView.layer.shadowColor = UIColor.gray.cgColor
        self.imageViewfor.layer.cornerRadius = self.imageViewfor.frame.height/2
    }
    
}
