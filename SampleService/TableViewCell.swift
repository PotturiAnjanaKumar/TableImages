//
//  TableViewCell.swift
//  SampleService
//
//  Created by Apple on 05/05/17.
//  Copyright © 2017 vsplash. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var profileImgView: UIImageView?
    @IBOutlet var nameLbl: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
