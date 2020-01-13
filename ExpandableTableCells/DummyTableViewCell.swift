//
//  DummyTableViewCell.swift
//  ExpandableTableCells
//
//  Created by Bhaskar Ghosh on 1/13/20.
//  Copyright © 2020 Bhaskar Ghosh. All rights reserved.
//

import UIKit

class DummyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
