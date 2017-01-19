//
//  ViewController.swift
//  sushiOle
//
//  Created by Joakin on 30/12/2016.
//  Copyright © 2016 Joaquin Lopez Amador. All rights reserved.
//

import UIKit
import Former
final class ViewController: FormViewController {
static var isCash = false
    final var section5 :SectionFormer? = nil
    final var section4 :SectionFormer? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calle = TextFieldRowFormer<FormTextFieldCell>.init()
        calle.text = "Direccion de entrega"
        calle.placeholder = "Calle del hambre"
        

        
        let palillos = CheckRowFormer<FormCheckCell>().configure { (row) in
            row.cell.titleLabel.text = "Palillos"
        }

        let soja = CheckRowFormer<FormCheckCell>().configure { (row) in
            row.cell.titleLabel.text = "Soja"
            
        }
        let servilletas = CheckRowFormer<FormCheckCell>().configure { (row) in
            row.cell.titleLabel.text = "Servilletas"
        }

        
        let comentarios = TextViewRowFormer<FormTextViewCell>().configure { (row) in
            row.placeholder = "No me gusta el queso crema ..."
            row.cell.formTitleLabel()?.text = "Comentarios"
            row.cell.textView.textColor = UIColor.red
        }
        
        let pago = SegmentedRowFormer<FormSegmentedCell>.init().configure { (row) in
            row.segmentTitles.append("tarjeta")
            row.segmentTitles.append("efectivo")
        }.onSegmentSelected { (Int, String) in
            print(Int,String)
            
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
        
        let section2 = SectionFormer(rowFormer: soja, palillos,servilletas)
        let section3 = SectionFormer(rowFormer: comentarios)
        let sectio3 = SectionFormer(rowFormer: pago)
        section4 = SectionFormer(rowFormer: moreRow)
        section5 = SectionFormer(rowFormer: moreInfo)

        

        
        former.append(sectionFormer: section2,section3,sectio3,section4!)
        
    }
    
    
    func up(type : Bool  ) {
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
