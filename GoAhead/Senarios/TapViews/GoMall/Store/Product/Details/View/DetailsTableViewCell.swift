//
//  DetailsTableViewCell.swift
//  GoAhead
//
//  Created by Mustafa on 1/1/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!{
        didSet{
            cellView.layer.cornerRadius = 10
            cellView.layer.borderWidth = 1.0
            cellView.layer.borderColor = UIColor.gray.cgColor
            cellView.clipsToBounds = true
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
