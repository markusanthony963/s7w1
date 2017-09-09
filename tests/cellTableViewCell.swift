//
//  cellTableViewCell.swift
//  tests
//
//  Created by iosdev on 9/2/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import UIKit

class cellTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var actLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //actLabel.text=list[indexPath.row]
        timeLabel.text = timeD
        

    
    }
 
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
