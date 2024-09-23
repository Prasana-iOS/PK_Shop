//
//  CenderCell.swift
//  PK-Shop
//
//  Created by Trioangle on 02/09/24.
//

import UIKit

class CenderCell: UITableViewCell {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var addBtnView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addBtnView.layer.cornerRadius = self.addBtnView.frame.height/2
        self.mainImage.layer.cornerRadius = self.mainImage.frame.height/2
    }
}
