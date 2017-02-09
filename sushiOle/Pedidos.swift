//
//  Pedidos.swift
//  sushiOle
//
//  Created by Joaquin Lopez Amador on 06/10/2016.
//  Copyright © 2016 Joaquin Lopez Amador. All rights reserved.
//

import UIKit

class Pedidos: UIViewController,UITableViewDataSource,UITableViewDelegate{

    //var timer = Timer()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func Paytouch(_ sender: AnyObject) {
        if DataHolder.sharedInstance.orderSize>0 {
            //performSegue(withIdentifier: "Formulario", sender: self)

        }
        
           }
    @IBOutlet weak var Realizarpedido: UIButton!
    

    override func viewDidLoad() {
        self.title = "Pedido"
        super.viewDidLoad()
        Realizarpedido.layer.borderWidth = 1.0
        Realizarpedido.layer.borderColor = UIColor.red.cgColor
        Realizarpedido.setTitle(String(DataHolder.sharedInstance.getPrice()), for: .normal)
        //timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        DataHolder.sharedInstance.btnPedido=Realizarpedido
        
        
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
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! cell3
        let artemp = Array(DataHolder.sharedInstance.arrayDict.values)
        print("-- artemp",artemp)
        let arKeys = Array(DataHolder.sharedInstance.arrayDict.keys)
        cell.keyproducto = arKeys[indexPath.row]
        
       let ar:Array<String> = artemp[indexPath.row] as Array<String>
        print("---artempindexpath",artemp[indexPath.row])
        cell.nombre.text = ar[1]
        cell.precio.text = ar[0] + " €"
        cell.cantidad.text = ar[2]
        let pr = Int(ar[0])
        cell.precioCell = pr!

        //DataHolder.sharedInstance.arrayDict.updateValue(cell.cantidad.text, forKey: artemp[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        print("entro a edititg")
        if editingStyle == .delete{
            let arKeys = Array(DataHolder.sharedInstance.arrayDict.keys)
            print("-----arkeys",arKeys)
            DataHolder.sharedInstance.arrayDict.removeValue(forKey: arKeys[indexPath.row])
            self.tableView.deleteRows(at: [indexPath], with: .fade)


        }
        
        print(DataHolder.sharedInstance.arrayDict.count,DataHolder.sharedInstance.arrayDict)
    }
    
    func timerAction() {
        Realizarpedido.setTitle("Realizar pedido: "+String(DataHolder.sharedInstance.getPrice())+"€", for: .normal)
    }

    


}
