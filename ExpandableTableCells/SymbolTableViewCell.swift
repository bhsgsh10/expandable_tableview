//
//  SymbolTableViewCell.swift
//
//  Created by Bhaskar Ghosh on 1/12/20.
//  Copyright © 2020 Bhaskar Ghosh. All rights reserved.
//

import UIKit

protocol SymbolTableViewCellDelegate {
    func symbolCellOpenButtonTapped(sender: SymbolTableViewCell)
}

class SymbolTableViewCell: UITableViewCell {
    
    @IBOutlet weak var symbolImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var openCloseButton: UIButton!
    var isExpanded: Bool!
    var delegate: SymbolTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        isExpanded = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func openCloseButtonClicked() {
        if openCloseButton.titleLabel?.text == "Open" {
            openCloseButton.setTitle("Close", for: .normal)
        } else {
            openCloseButton.setTitle("Open", for: .normal)
        }
        delegate?.symbolCellOpenButtonTapped(sender: self)
    }

}
