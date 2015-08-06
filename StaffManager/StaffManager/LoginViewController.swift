//
//  LoginViewController.swift
//  StaffManager
//
//  Created by Davi Rodrigues on 07/07/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //let testObject = PFObject(className: "TestObject")
        //testObject["foo"] = "bar"
        //testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            //println("Object has been saved.")
        //}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginButtonHandler(sender: AnyObject) {
        performSegueWithIdentifier("staffMode", sender: self)
    }

    @IBAction func returnToLogin(segue: UIStoryboardSegue) {
        
    }
    
    // textField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    

}
