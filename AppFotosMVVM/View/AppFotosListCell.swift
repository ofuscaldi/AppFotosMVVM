//
//  AppFotosListCell.swift
//  AppFotosMVVM
//
//  Created by Std1 on 13/04/18.
//  Copyright © 2018 Fuscaldi. All rights reserved.
//

import UIKit

class AppFotosListCell: UITableViewCell {

    @IBOutlet weak var lblCell: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
