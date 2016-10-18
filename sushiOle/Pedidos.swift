//
//  Pedidos.swift
//  sushiOle
//
//  Created by Joaquin Lopez Amador on 06/10/2016.
//  Copyright © 2016 Joaquin Lopez Amador. All rights reserved.
//

import UIKit

class Pedidos: UIViewController,UITableViewDataSource,UITableViewDelegate{


    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var Realizarpedido: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        Realizarpedido.layer.borderWidth = 1.0
        Realizarpedido.layer.borderColor = UIColor.red.cgColor

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return DataHolder.sharedInstance.arrayDict.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
  //  let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell3") as! cell3
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! cell3
        let artemp = Array(DataHolder.sharedInstance.arrayDict.values)
        print("-- artemp",artemp)

       let ar:Array<String> = artemp[indexPath.row] as Array<String>
        cell.nombre.text = ar[1]
        cell.precio.text = ar[0] + " €"
        cell.cantidad.text = ar[2]
        //DataHolder.sharedInstance.arrayDict.updateValue(cell.cantidad.text, forKey: artemp[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if editingStyle == .delete{
            let arKeys = Array(DataHolder.sharedInstance.arrayDict.keys)
            print("-----arkeys",arKeys)
            DataHolder.sharedInstance.arrayDict.removeValue(forKey: arKeys[indexPath.row])
            self.tableView.deleteRows(at: [indexPath], with: .fade)


                    }
        
        print(DataHolder.sharedInstance.arrayDict.count,DataHolder.sharedInstance.arrayDict)
    }
    
    
    

        
          
        
    
    
    
   /* func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let actionQuantity = UITableViewRowAction(style: .default, title: "Cantidad") { (action, IndexPath) in
            let actionQuantityText = "xxxxxxxx"
            let activity = UIActivityViewController(activityItems: [actionQuantityText], applicationActivities: nil)
        }
    }
    */

}
