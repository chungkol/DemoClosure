//
//  Cell.swift
//  Closure
//
//  Created by Chung on 9/15/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    

    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var lbNameCell: UILabel!
    
    @IBOutlet weak var lbSBDCell: UILabel!
    
    @IBOutlet weak var lbHeightCell: UILabel!
    
    @IBOutlet weak var lbWeightCell: UILabel!
    
    
    @IBOutlet weak var lbDiagramCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
