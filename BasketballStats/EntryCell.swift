//
//  EntryCell.swift
//  BasketballStats
//
//  Created by Aaron Garman on 11/5/23.
//

import UIKit

class EntryCell: UITableViewCell {
    
    @IBOutlet weak var shotsLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

// clean up UI + use styling from part 6 of week 5 lab
// center stuff in label
// + button w circle under table view or on it like twitter? circular orange w plus sign?
// comments everywhere too n understand code
// style any/ fonts smaller?
