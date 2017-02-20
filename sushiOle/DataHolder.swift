//
//  DataHolder.swift
//  sushiOle
//
//  Created by Joaquin Lopez Amador on 27/09/2016.
//  Copyright © 2016 Joaquin Lopez Amador. All rights reserved.
//


import Foundation
import Firebase
import FirebaseDatabase
import FirebaseAuth
class DataHolder : NSObject{
    static let sharedInstance = DataHolder()
    var ref:FIRDatabaseReference?
    var refStorage : FIRStorageReference?
    var Images = [String:UIImage]()
    var arrayDict = [Int: Array<String>]()
    var orderSize : Int = 0
    var calle : String = ""
    var numero : String = ""
    var piso : String = ""
    var codigoPostal : String = ""
    var palillos : Bool = false
    var soja : Bool = false
    var servilletas : Bool = false
    var comentarios : String = ""
    var pago : String = ""
    var date = Date()
    var btnPedido:UIButton? = nil
    var user : FIRUser? = nil
    let firebaseAuth = FIRAuth.auth()

    override init() {
        super.init()
        //print("--entra dataholder")
        //FIRApp.configure()
      
        
    }
    
    func initFB(){
        FIRApp.configure()
        ref = FIRDatabase.database().reference()
        refStorage = FIRStorage.storage().reference()
        if FIRAuth.auth()?.currentUser != nil {
            user = FIRAuth.auth()?.currentUser
        } else {
            print("not signed in")
        }
    }
    
    func getPrice() -> (Int) {
        var price : Int = 0
        
        print("---- >>>>>>> %@",arrayDict)
        for item in arrayDict {
        
            price += Int(item.value[0])!
        }
        btnPedido?.setTitle(String(price), for: .normal)
        
        return price
    }
    func signOut() -> Void {
        do {
            print("--- entra signOut")
            try firebaseAuth?.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
    
    func createArrayOfDishes(_ precio : String, nombre : String , cantidad : String) -> Void {
        
        var datos = [String]()
        datos.append(precio)
        datos.append(nombre)
        datos.append(cantidad)
        arrayDict[orderSize] = datos
        orderSize += 1
        
    }
    func clean() -> Void {
        arrayDict.removeAll()
        orderSize = 0
        calle = ""
        numero = ""
        piso = ""
        codigoPostal  = ""
        palillos = false
        soja = false
        servilletas = false
        comentarios = ""
        pago  = ""
        date = Date()
        user = nil
        
    }
    func getImages(_ url : String,imagenView : UIImageView) ->Bool {
        
        imagenView.image = nil
        if(self.Images[url] != nil){
            imagenView.image = self.Images[url]
        }
        else{
            let reference = FIRStorage.storage().reference(forURL: url)
            reference.data(withMaxSize: 1*1024*1024) { (data, error) -> Void in
                print("dataimagenFIreabse",data)
                let myImage: UIImage! = UIImage(data: data!)
                print("Hay imagen: " ,myImage)
                if((data) != nil){
                    
                    print("imagen existe")
                    self.Images[url] = myImage
                    print("entra")
                    
                    imagenView.image = myImage
                }
                
            }
        }
        
        
        
        
        return true;    }
}

