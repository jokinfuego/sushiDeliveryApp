//
//  ViewController.swift
//  sushiOle
//
//  Created by Joakin on 30/12/2016.
//  Copyright © 2016 Joaquin Lopez Amador. All rights reserved.
//

import UIKit

import Former
import SCLAlertView

final class ViewController: FormViewController {
static var isCash = false
    @IBOutlet weak var Confirm: UIButton!
    final var section5 :SectionFormer? = nil
    final var section4 :SectionFormer? = nil
    @IBAction func Confirmar(_ sender: Any) {
        print("click")
        let referencia = DataHolder.sharedInstance.ref?.child("pedidos").child((DataHolder.sharedInstance.user?.uid)!).childByAutoId()
        let detalles = referencia?.child("Detalles")
        let referencia2 = referencia?.child("Platos")
        
        detalles?.child("calle").setValue(DataHolder.sharedInstance.calle)
        detalles?.child("numero").setValue(DataHolder.sharedInstance.numero)
        detalles?.child("piso").setValue(DataHolder.sharedInstance.piso)
        detalles?.child("codigoPostal").setValue(DataHolder.sharedInstance.codigoPostal)
        detalles?.child("Soja").setValue(DataHolder.sharedInstance.soja)
        detalles?.child("Palillos").setValue(DataHolder.sharedInstance.palillos)
        detalles?.child("Servilletas").setValue(DataHolder.sharedInstance.servilletas)
        detalles?.child("Pago").setValue(DataHolder.sharedInstance.pago)
        referencia?.child("PrecioTotal").setValue(String(DataHolder.sharedInstance.getPrice())+"€")
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        
        referencia?.child("Fecha").setValue(result)
        for (bookid, title) in DataHolder.sharedInstance.arrayDict {
            referencia2?.child("plato"+String(bookid)).child(title[1]).setValue(title[2])
          

            

            
            print("Book ID: \(bookid) Title: \(title)")
            for item in title {
                print(item)
            }
        }
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false
        )
        let alertView = SCLAlertView(appearance: appearance)
        alertView.addButton("Ok") {
            print("perform")
               self.performSegue(withIdentifier: "Back", sender: self)
            DataHolder.sharedInstance.arrayDict.removeAll()
        }
        alertView.showSuccess("En camino", subTitle: "Su pedido se realizo correctamente")
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Confirm.layer.borderWidth = 1.0
        Confirm.layer.borderColor = UIColor.red.cgColor
        
        self.title = "Confirmacion pedido"
        let textFieldRow = TextFieldRowFormer<FormTextFieldCell>() {
            $0.titleLabel.text = "Calle"
            }.configure {
                
                $0.placeholder = "Juan XXIII"
        }.onTextChanged { (String) in
            DataHolder.sharedInstance.calle = String
        }
        let textFieldRow2 = TextFieldRowFormer<FormTextFieldCell>() {
            $0.titleLabel.text = "Numero"
            }.configure {
                $0.placeholder = "12"
            }.onTextChanged { (String) in
                DataHolder.sharedInstance.numero = String
        }
        let textFieldRow3 = TextFieldRowFormer<FormTextFieldCell>() {
            $0.titleLabel.text = "Piso"
            }.configure {
                $0.placeholder = "1 Derecha"
            }.onTextChanged { (String) in
                DataHolder.sharedInstance.piso = String
        }
        let textFieldRow4 = TextFieldRowFormer<FormTextFieldCell>() {
            $0.titleLabel.text = "Codigo Postal"
            }.configure {
                $0.placeholder = "28015"
            }.onTextChanged { (String) in
                DataHolder.sharedInstance.codigoPostal = String
        }
        

        
        let palillos = CheckRowFormer<FormCheckCell>().configure { (row) in
            row.cell.titleLabel.text = "Palillos"
        }.onCheckChanged { (Bool) in
            DataHolder.sharedInstance.palillos = Bool
        }

        let soja = CheckRowFormer<FormCheckCell>().configure { (row) in
            row.cell.titleLabel.text = "Soja"
            
            }.onCheckChanged { (Bool) in
                DataHolder.sharedInstance.soja = Bool
        }
        let servilletas = CheckRowFormer<FormCheckCell>().configure { (row) in
            row.cell.titleLabel.text = "Servilletas"
            }.onCheckChanged { (Bool) in
                DataHolder.sharedInstance.servilletas = Bool
        }

        
        let comentarios = TextViewRowFormer<FormTextViewCell>().configure { (row) in
            row.placeholder = "No me gusta el queso crema ..."
            row.cell.formTitleLabel()?.text = "Comentarios"
            row.cell.textView.textColor = UIColor.red
        }.onTextChanged { (String) in
            DataHolder.sharedInstance.comentarios = String
        }
        
        let pago = SegmentedRowFormer<FormSegmentedCell>.init().configure { (row) in
            row.segmentTitles.append("tarjeta")
            row.segmentTitles.append("efectivo")
        }.onSegmentSelected { (Int, String) in
            print(Int,String)
            DataHolder.sharedInstance.pago = String
        }
        let moreRow = SwitchRowFormer<FormSwitchCell>() {
            $0.titleLabel.text = "Add more information ?"
            $0.titleLabel.textColor = UIColor.black
            $0.titleLabel.font = .boldSystemFont(ofSize: 15)
            $0.switchButton.onTintColor = UIColor.red
            }.onSwitchChanged { (Bool) in
                print(Bool)
                self.up(type: Bool)
        }
        
        let moreInfo = CheckRowFormer<FormCheckCell>().configure { (row) in
            row.cell.titleLabel.text = "more"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "HH:mm"
        let date = dateFormatter.date(from: "17:00")
        
        let startRow = InlineDatePickerRowFormer<FormInlineDatePickerCell>() {
            $0.titleLabel.text = "Hora de entrega"
            $0.displayLabel.font = .systemFont(ofSize: 15)
            }.inlineCellSetup {
                
                $0.datePicker.datePickerMode = .time
                $0.datePicker.date = date!

                }.onDateChanged { (Date) in
                 print(Date)
        }
        let section0 = SectionFormer(rowFormer: textFieldRow,textFieldRow2,textFieldRow3,textFieldRow4)
        let section2 = SectionFormer(rowFormer:soja, palillos,servilletas)
        let section3 = SectionFormer(rowFormer: comentarios)
        let sectio3 = SectionFormer(rowFormer: pago)
        //section4 = SectionFormer(rowFormer: moreRow)
        //section5 = SectionFormer(rowFormer: moreInfo,startRow)
        let section6 = SectionFormer(rowFormer: startRow)


        

        
        former.append(sectionFormer: section0,section2,section6,sectio3)
        
    }
    
    
    func up(type : Bool) {
        print("entra")
        if type==true{
            former.insertUpdate(sectionFormer: section5!, toSection: former.numberOfSections, rowAnimation: .top)

        }else{
            former.removeUpdate(sectionFormer: section5!, rowAnimation: .middle)        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
