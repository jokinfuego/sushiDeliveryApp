//
//  TableViewController2.swift
//  sushiOle
//
//  Created by Joaquin Lopez Amador on 05/10/2016.
//  Copyright © 2016 Joaquin Lopez Amador. All rights reserved.
//

import UIKit
import FirebaseStorage
class TableViewController2: UITableViewController {

    var Data : Int = 0
    var array2 : Array<AnyObject> = []
    var child : String = ""
    var dishes: [String] = ["Hosomaki", "Sashimi","Noodles","Sashimi"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myString = String(Data)
        child = "c" + myString
        downloadDataFromFirebase()
        self.title = dishes[Data]
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array2.count
    }
    
    func downloadDataFromFirebase(){
        DataHolder.sharedInstance.ref?.child("productosV2/platos").child(child).observe(.value, with: { (snapshot) in
            self.array2 = snapshot.value as! Array<AnyObject>
            self.array2.removeFirst()
            self.tableView.reloadData()
            }, withCancel: nil)
    }
 

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier2", for: indexPath) as! Cell2
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        let PlatoP = array2[indexPath.row] as! [String : AnyObject]
        let url = PlatoP["Imagen"] as! String
        let reference = FIRStorage.storage().reference(forURL: url)
        let sBoton = PlatoP["Precio"] as! String + "€"
        cell.button.setTitle(sBoton, for: UIControlState.normal)
        cell.plato.text = PlatoP["NombrePlato"]! as? String
        cell.ingredientes.text = PlatoP["Ingredientes"] as? String
        DataHolder.sharedInstance.getImages(url, imagenView: cell.platoImg)
        cell.nombre = (PlatoP["NombrePlato"] as? String)!
        cell.precio = (PlatoP["Precio"] as? String)!
    
        return cell
    }

}
