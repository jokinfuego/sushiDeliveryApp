//
//  TableViewController.swift
//  sushiOle
//
//  Created by Joaquin Lopez Amador on 27/09/2016.
//  Copyright © 2016 Joaquin Lopez Amador. All rights reserved.
//

import UIKit
import FirebaseStorage
import SCLAlertView

class TableViewController: UITableViewController {
    
    @IBAction func profile(_ sender: Any) {
        let appearance = SCLAlertView.SCLAppearance(
            showCircularIcon: true
        )
        let alertView = SCLAlertView(appearance: appearance)
        let alertViewIcon = UIImage(named: "sushi.png") //Replace the IconImage text with the image name
        alertView.addButton("Pedidos") {
          
            self.navigationController?.performSegue(withIdentifier: "Historial", sender: self)
            //self.navigationController?.setNavigationBarHidden(true, animated: true)

        }
        alertView.addButton("Sign out") {
            DataHolder.sharedInstance.signOut()
            DataHolder.sharedInstance.clean()
            self.navigationController?.performSegue(withIdentifier: "signout", sender: self)
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
        //alertView.showError((DataHolder.sharedInstance.user?.email)!, subTitle: "", circleIconImage: alertViewIcon)
       alertView.showError((DataHolder.sharedInstance.user?.email)!, subTitle: "", circleIconImage: alertViewIcon)
    }
    var diccionario:[String:AnyObject] = [:]
    var array : Array<AnyObject> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadDataGeneralMenu()
        print("current user " , DataHolder.sharedInstance.user?.email)
        print("count", DataHolder.sharedInstance.arrayDict.count)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let Boton = DataHolder.sharedInstance.arrayDict.count
        let sBoton = String(Boton)
        //self.pedidoButton.title = "Pedido: " + sBoton
        if( DataHolder.sharedInstance.arrayDict.count == 0){
            self.pedidoButton.image = UIImage(named:"sushi.png")
        }else{
            self.pedidoButton.image = UIImage(named:"sushi2.png")

        }
        print("USEEEEEEERRR" )
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
            selectedCell.contentView.backgroundColor = UIColor.white
        
    }
    
    func downloadDataGeneralMenu() {
        print("-----entra en dgm")
        DataHolder.sharedInstance.ref?.child("productosV2/categorias").observe(.value, with: { (snapshot) in
        self.array = snapshot.value as! Array<AnyObject>
        print("----",snapshot.exists())
        self.array.removeFirst()
        self.tableView.reloadData()
            }, withCancel: nil)
        
    }
    @IBOutlet weak var pedidoButton: UIBarButtonItem!
    
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

        return array.count
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCategoryDetails"{
            if let IndexPath = self.tableView.indexPathForSelectedRow{
                let selected = IndexPath.row
                let destination = segue.destination as! TableViewController2
                destination.Data = selected 
            }
        }
    }


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! Cell

        // Configure the cell...
        cell.selectionStyle = UITableViewCellSelectionStyle.none

        let PlatoP = array[indexPath.row] as! [String : AnyObject]
        cell.lblNombre.text = PlatoP["nombre"]! as? String
        let url = PlatoP["url"] as! String
        let reference = FIRStorage.storage().reference(forURL: url)
        reference.data(withMaxSize: 1*1024*1024) { (data, error) -> Void in
            let myImage: UIImage! = UIImage(data: data!)
            if((data) != nil){
                cell.imagenPlato.image = myImage
  
            }else{
                print("-----",error)
            }
            
        }


        return cell
    }
    
    
}
