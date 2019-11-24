//
//  CategoryHomeTableViewCell.swift
//  GoAhead
//
//  Created by Mustafa on 11/21/19.
//  Copyright © 2019 Maged. All rights reserved.
//

import UIKit

class CategoryHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryHomeImage: UIImageView!
    @IBOutlet weak var categoryHomeNam: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func categoryHomeNameBtnPressed(_ sender: UIButton) {
    }
}
