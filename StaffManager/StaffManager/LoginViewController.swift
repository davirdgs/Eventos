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
    

     var actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //let testObject = PFObject(className: "TestObject")
        //testObject["foo"] = "bar"
        //testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            //println("Object has been saved.")
        //}
        
        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        
        view.addSubview(self.actInd)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginButtonHandler(sender: AnyObject) {
       // performSegueWithIdentifier("staffMode", sender: self) 
        
        
        var username = self.loginTextField.text
        var password = self.passwordTextField.text
        
        if (count(username.utf16) < 4 || count(password.utf16) < 5) {
            
            var alert = UIAlertView(title: "Invalid", message: "Username must be greater than 4 and Password must be grater than 5", delegate: self, cancelButtonTitle: "OK")
            
            alert.show()
        }
            
        else {
            self.actInd.startAnimating()
            
            PFUser.logInWithUsernameInBackground(username, password: password, block: { (user, error) -> Void in
                
                self.actInd.stopAnimating()
                
                
                
                if((user) != nil){
                    //var alert  = UIAlertView(title: "Sucess", message: "Logged In", delegate: self, cancelButtonTitle: "OK")
                    //alert.show()
                    
                    self.performSegue("staffMode")
                
                }
                else{
                    var alert  = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                }
            })
            
        }

        
    }

    @IBAction func returnToLogin(segue: UIStoryboardSegue) {
        
    }
    
    // textField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    func performSegue(identifier:String){
        self.performSegueWithIdentifier(identifier, sender: self)
    }

}
