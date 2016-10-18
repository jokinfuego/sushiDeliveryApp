//
//  LogInVC.swift
//  sushiOle
//
//  Created by Joaquin Lopez Amador on 13/10/2016.
//  Copyright © 2016 Joaquin Lopez Amador. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LogInVC: UIViewController {

    @IBAction func logIn(_ sender: UIButton) {
        signIn()
        if okUser == true {
            performSegue(withIdentifier: "Logged", sender: self)
        }
    }
    @IBOutlet weak var PasswText: UITextField!
    @IBOutlet weak var EmailText: UITextField!
    var password = ""
    var email = ""
    var okUser = false
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //FIRApp.configure()
        PasswText.layer.borderWidth = 1.0
        PasswText.layer.borderColor = UIColor.red.cgColor
        EmailText.layer.borderWidth = 1.0
        EmailText.layer.borderColor = UIColor.red.cgColor



        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func signIn() -> Void {
        password = PasswText.text!
        email = EmailText.text!
        FIRAuth.auth()?.signIn(withEmail: self.email, password: self.password) { (user, error) in
            if(user != nil){
                self.okUser = true
                            }else{
                print("no logeado")
            }
        }
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
