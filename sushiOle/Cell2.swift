//
//  Cell2.swift
//  sushiOle
//
//  Created by Joaquin Lopez Amador on 05/10/2016.
//  Copyright © 2016 Joaquin Lopez Amador. All rights reserved.
//

import UIKit

class Cell2: UITableViewCell {

    @IBOutlet weak var platoImg: UIImageView!
    @IBOutlet weak var button: UIButton!
 
    @IBOutlet weak var plato: UILabel!
    @IBOutlet weak var ingredientes: UILabel!
    var precio = ""
    var nombre = ""
    var cantidad = "1"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        button?.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.red.cgColor
        button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)

    }
    func buttonTapped(_ sender : UIButton){
        button.layer.borderWidth = 0.0
        button.setTitle("", for:.normal)
        button.isSelected = true
        button.setImage(UIImage(named: "ch.png"), for: .selected)
        DataHolder.sharedInstance.createArrayOfDishes(self.precio as String, nombre: self.nombre, cantidad: "1")
        print("--arrayDIct despues de meter un dato",DataHolder.sharedInstance.arrayDict)
        print("--OrderSize despues de meter un producto",DataHolder.sharedInstance.orderSize)
    }

    
    
    
       override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
