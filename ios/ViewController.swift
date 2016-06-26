//
//  ViewController.swift
//  ios
//
//  Created by Millin Gabani on 2016-05-26.
//  Copyright © 2016 Millin Gabani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties

    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var eventNotes: UITextView!
    @IBOutlet weak var eventAllDay: UISwitch!
    @IBOutlet weak var eventStartTime: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Handle the text field’s user input through delegate callbacks.
        eventName.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(textField: UITextField) {
        //event.name = textField.text
    }
    
    // MARK: Actions
    
    @IBAction func createEvent(sender: UIButton) {
    }

}

