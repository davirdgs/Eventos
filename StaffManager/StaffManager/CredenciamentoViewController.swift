//
//  CredenciamentoViewController.swift
//  StaffManager
//
//  Created by Jose Luis Hinostroza on 7/7/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit
import MessageUI

class CredenciamentoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var cameraImgView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //emailTextField.delegate = self;
       // nameTextField.delegate = self;
        imagePicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func returnToAccreditation (segue: UIStoryboardSegue)
    {
        
    }
    
    @IBAction func CameraClicked(sender: AnyObject) {
        // Initialize camera and take a picture

        //if (UIImagePickerController.isSourceTypeAvailable(.Camera)){
                    imagePicker.sourceType = .Camera

        //}
        imagePicker.allowsEditing = true
        imagePicker.cameraCaptureMode = .Photo

        let cameraAvailableFlag = UIImagePickerController.isSourceTypeAvailable(.Camera)
        if (cameraAvailableFlag){
            var timer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: Selector("presentCamera"), userInfo: nil, repeats: false)
        }
        

    }
    func presentCamera(){
        self.presentViewController(imagePicker, animated: true, completion: nil)

    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        cameraImgView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    @IBAction func SendClicked(sender: AnyObject) {
        // insert data to the DB
        let photoImage = cameraImgView.image
        var imageData = UIImagePNGRepresentation(photoImage)
        
        ParticipanteServices.createParticipante("Assistente", name: nameTextField.text, email: emailTextField.text, photo: imageData)
        
        // Display a success alert after registering the participant
        // Create the alert controller
        var alertController = UIAlertController(title: "Staff Manager", message: "Participante cadastrado!", preferredStyle: .Alert)
        
        // Create the action to reset formulary
        var okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
            
            UIAlertAction in
            
            let mailComposeViewController = self.configuredMailComposeViewController()
            if MFMailComposeViewController.canSendMail() {
                self.presentViewController(mailComposeViewController, animated: true, completion: nil)
            } else {
                self.showSendMailErrorAlert()
            }
            
            self.nameTextField.text = ""
            self.emailTextField.text = ""
            self.cameraImgView.image = UIImage()
            //NSLog("OK Pressed")
        }
        
        // Add the actions
        alertController.addAction(okAction)
        
        // Present the controller
        self.presentViewController(alertController, animated: true, completion: nil)
        
        
    }
    
    
    // textField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // MailComposer functions
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients([emailTextField.text])
        mailComposerVC.setSubject("Cadastro realizado no Evento")
        mailComposerVC.setMessageBody("Parabens \(nameTextField.text)!, agora você está cadastrado no evento", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
}
