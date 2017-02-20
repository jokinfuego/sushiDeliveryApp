//
//  LoginViewController.swift
//  sushiOle
//
//  Created by Joakin on 07/02/2017.
//  Copyright © 2017 Joaquin Lopez Amador. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    @IBAction func log(_ sender: Any) {
        signin(user: mail.text!, password: pass.text!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(DataHolder.sharedInstance.user?.email)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewdidappear")
        if (DataHolder.sharedInstance.firebaseAuth?.currentUser != nil){
            print(DataHolder.sharedInstance.firebaseAuth?.currentUser!)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func signin(user : String,password : String) -> Void {
        
        FIRAuth.auth()?.signIn(withEmail: user, password: password) { (user, error) in
            if (error != nil) {
                print("error")
            }else{
                print(user?.email)
                DataHolder.sharedInstance.user = user
                self.performSegue(withIdentifier: "Logged", sender: self)

            }
            //DataHolder.sharedInstance.user = user
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
