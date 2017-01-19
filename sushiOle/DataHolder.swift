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

class DataHolder : NSObject{
    static let sharedInstance = DataHolder()
    var ref:FIRDatabaseReference?
    var refStorage : FIRStorageReference?
    var Images = [String:UIImage]()
    var arrayDict = [Int: Array<String>]()
    var orderSize : Int = 0
    
    override init() {
        super.init()
        print("--entra dataholder")
        FIRApp.configure()
        ref = FIRDatabase.database().reference()
        refStorage = FIRStorage.storage().reference()
        
        
    }
    func getPrice() -> (Int) {
        var price : Int = 0
        var i = 0
        for item in arrayDict {
            if(arrayDict[i]?.isEmpty)!{
                print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@vacio")
            }else{
                 price += Int((arrayDict[i]?[0])!)!
            }
           
            i+=1
        }
        return price
    }
    
    
    
    func createArrayOfDishes(_ precio : String, nombre : String , cantidad : String) -> Void {
        
        var datos = [String]()
        datos.append(precio)
        datos.append(nombre)
        datos.append(cantidad)
        arrayDict[orderSize] = datos
        orderSize += 1
        
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

