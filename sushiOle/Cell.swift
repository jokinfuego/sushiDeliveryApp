//
//  Cell.swift
//  sushiOle
//
//  Created by Joaquin Lopez Amador on 04/10/2016.
//  Copyright © 2016 Joaquin Lopez Amador. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var lblNombre: UILabel!
    
    @IBOutlet weak var imagenPlato: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
        
    

}
