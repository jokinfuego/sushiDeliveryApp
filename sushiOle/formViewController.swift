//
//  formViewController.swift
//  sushiOle
//
//  Created by Joakin on 30/12/2016.
//  Copyright © 2016 Joaquin Lopez Amador. All rights reserved.
//

import UIKit

class formViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let form = Form(sections: [FormSection(rows: [TextEntryFormRow(name:"Name"),
                                                      TextEntryFormRow(name: "Email", textType: TextEntryType.Email),
                                                      TextEntryFormRow(name:"Age", textType: TextEntryType.Number)],
                                               name:"Profile")])
        let formViewController = FormViewController(form: form)
        presentViewController(formViewController, animated: true, completion: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
