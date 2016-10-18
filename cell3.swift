//
//  cell3.swift
//  sushiOle
//
//  Created by Joaquin Lopez Amador on 11/10/2016.
//  Copyright © 2016 Joaquin Lopez Amador. All rights reserved.
//

import UIKit

class cell3: UITableViewCell {

    @IBOutlet weak var cantidad: UILabel!
    @IBOutlet weak var precio: UILabel!
    @IBOutlet weak var nombre: UILabel!
    
    @IBOutlet weak var quantiStep: UIStepper!
    @IBOutlet weak var quantityLabel: UILabel!
    override func awakeFromNib() {
        quantityLabel.text = "1"
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        var quantity2 = Int(sender.value)
        self.quantityLabel.text = String(quantity2)
        self.cantidad.text = String(Int(sender.value))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
