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
    
    var keyproducto : Int = 0
    var precioCell : Int = 0
    
    override func awakeFromNib() {
        quantityLabel.text = ""
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        print("--sender value",sender.value)
        let senderVal = Int(sender.value)
        let strsenderVal = String(senderVal)
        let precioTotal = precioCell * senderVal
        let strPrecioTotal = String(precioTotal)
        DataHolder.sharedInstance.arrayDict[keyproducto]?.remove(at: 2)
        DataHolder.sharedInstance.arrayDict[keyproducto]?.append(String(senderVal))
        DataHolder.sharedInstance.arrayDict[keyproducto]?.remove(at: 0)
        DataHolder.sharedInstance.arrayDict[keyproducto]?.insert(strPrecioTotal, at: 0)
        
        print("---fin",DataHolder.sharedInstance.arrayDict[keyproducto])
        //self.cantidad.text = String(DataHolder.sharedInstance.arrayDict[keyproducto].)
        cantidad.text = strsenderVal
        precio.text = strPrecioTotal + "€"
        
        DataHolder.sharedInstance.getPrice()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
