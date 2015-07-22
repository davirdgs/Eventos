//
//  InsertViewController.swift
//  StaffManager
//
//  Created by Davi Rodrigues on 21/07/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit

class InsertViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var durationPicker: UIPickerView!
    
    var startHour: Int = 0
    var endHour: Int = 0
    //var eventName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "returnEvent") {
            let duration: Int = self.endHour - self.startHour
            let controller = segue.destinationViewController as! CalendarViewController
            controller.addEvent(self.eventNameTextField.text, start: self.startHour, duration: duration)
        }
    }
    
    //Picker View
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 1) {
            return 1
        }
        return 24
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if(component == 1) {
            return "até"
        }
        let Srow: String = row.description + "h"
        return Srow
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch(component) {
        case 0:
            self.startHour = row
            break
        case 2:
            self.endHour = row
            break
        default:
            break
        }
    }
    
    //Text Field
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
