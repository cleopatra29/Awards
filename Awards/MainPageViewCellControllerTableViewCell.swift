//
//  MainPageViewCellControllerTableViewCell.swift
//  Awards
//
//  Created by Terretino on 15/09/19.
//  Copyright © 2019 Terretino. All rights reserved.
//

import UIKit

class MainPageViewCellControllerTableViewCell: UITableViewCell {
    @IBOutlet weak var contentReward: UIView!
    @IBOutlet weak var rewardDesc: UILabel!
    @IBOutlet weak var rewardImage: UIImageView!
    @IBOutlet weak var rewardType: UILabel!
    
    @IBOutlet weak var rewardPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
