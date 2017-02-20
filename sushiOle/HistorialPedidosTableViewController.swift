//
//  HistorialPedidosTableViewController.swift
//  sushiOle
//
//  Created by Joakin on 14/02/2017.
//  Copyright © 2017 Joaquin Lopez Amador. All rights reserved.
//

import UIKit
import Firebase
class HistorialPedidosTableViewController: UITableViewController {
    var Pedidos : [String: String] = [:]
    var key : [String] = []
    var precio: [String] = []
    var fecha: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        dwnOrders()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    func dwnOrders() -> Void {
        print("dwnOrders")
        DataHolder.sharedInstance.ref?.child("pedidos").child((DataHolder.sharedInstance.user?.uid)!).observe(.value, with: { (snap) in
            for child in snap.children {
                var id = (child as! FIRDataSnapshot).key
                var precio = (child as! FIRDataSnapshot).childSnapshot(forPath: "PrecioTotal")
                var fechas = (child as! FIRDataSnapshot).childSnapshot(forPath: "Fecha")

                //print("chiiiild " ,(child as! FIRDataSnapshot).childSnapshot(forPath: "PrecioTotal"))
                print(id)
                print(precio)
                self.key.append(id)
                print(self.key.count)
                self.precio.append(precio.value as! String)
                self.fecha.append(fechas.value as! String)
                self.tableView.reloadData()

            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("pedidos" , Pedidos.count)
        return self.key.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Reuse3", for: indexPath) as! TableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none

        // Configure the cell...
        let start = key[indexPath.row].index( key[indexPath.row].startIndex, offsetBy: 1)
        let end = key[indexPath.row].index(key[indexPath.row].endIndex, offsetBy: -11)
        let subRange = start ..< end

        cell.Label.text = "#"+key[indexPath.row].substring(with: subRange)//substring(to: index)
        cell.precio.text = self.precio[indexPath.row]
        cell.fecha.text = self.fecha[indexPath.row]
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?
    {
        let shareAction  = UITableViewRowAction(style: .normal, title: "Share") { (rowAction, indexPath) in
            print("Share Button tapped. Row item value = \([indexPath.row])")
            
            print("share")        }
       
        shareAction.backgroundColor = UIColor.green
        return [shareAction]
    }
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
