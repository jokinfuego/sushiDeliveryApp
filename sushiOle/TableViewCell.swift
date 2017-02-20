//
//  TableViewCell.swift
//  sushiOle
//
//  Created by Joakin on 15/02/2017.
//  Copyright © 2017 Joaquin Lopez Amador. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var precio: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
