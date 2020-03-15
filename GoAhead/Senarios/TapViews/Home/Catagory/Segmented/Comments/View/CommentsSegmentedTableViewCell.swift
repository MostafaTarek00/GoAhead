//
//  CommentsSegmentedTableViewCell.swift
//  GoAhead
//
//  Created by Mustafa on 3/15/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit

class CommentsSegmentedTableViewCell: UITableViewCell {

    @IBOutlet weak var commentText: UILabel!
    @IBOutlet weak var commentPersonName: UILabel!
    @IBOutlet weak var commentPersonImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
