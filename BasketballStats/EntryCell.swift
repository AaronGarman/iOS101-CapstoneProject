//
//  EntryCell.swift
//  BasketballStats
//
//  Created by Aaron Garman on 11/5/23.
//

import UIKit

class EntryCell: UITableViewCell {
    
    // connect UI elements
    
    @IBOutlet weak var shotsLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

