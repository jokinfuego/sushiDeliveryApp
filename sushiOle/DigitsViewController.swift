//
//  DigitsViewController.swift
//  sushiOle
//
//  Created by Joakin on 13/02/2017.
//  Copyright © 2017 Joaquin Lopez Amador. All rights reserved.
//

import UIKit
import DigitsKit

class DigitsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let authButton = DGTAuthenticateButton(authenticationCompletion: { (session, error) in
            if (session != nil) {
                // TODO: associate the session userID with your user model
                let message = "Phone number: \(session!.phoneNumber)"
                let alertController = UIAlertController(title: "You are logged in!", message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: .none))
                self.present(alertController, animated: true, completion: .none)
            } else {
                NSLog("Authentication error: %@", error!.localizedDescription)
            }
        })
        authButton?.digitsAppearance = self.makeTheme()
        authButton?.center = self.view.center
        self.view.addSubview(authButton!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func makeTheme() -> DGTAppearance {
        let theme = DGTAppearance();
        theme.bodyFont = UIFont(name: "Noteworthy-Light", size: 16);
        theme.labelFont = UIFont(name: "Noteworthy-Bold", size: 17);
        theme.accentColor = UIColor.black
        theme.backgroundColor = UIColor.white
        theme.logoImage = UIImage(named: "sushi.png") // TODO: set a UIImage as a logo with theme.logoImage
        return theme;
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
