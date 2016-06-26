//
//  CreateEventViewController.swift
//  ios
//
//  Created by Millin Gabani on 2016-05-26.
//  Copyright © 2016 Millin Gabani. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties

    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var eventNotes: UITextView!
    @IBOutlet weak var eventAllDay: UISwitch!
    @IBOutlet weak var eventStartTime: UIDatePicker!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Handle the text field’s user input through delegate callbacks.
        eventName.delegate = self
        
        // Enable the Save button only if the text field has a valid Event name.
        checkValidEventName()
        
        // Set up the view
        navigationItem.title = event?.name ?? "New Event"

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
        checkValidEventName()
        navigationItem.title = textField.text
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.enabled = false
    }
    
    func checkValidEventName() {
        // Disable the Save button if the text field is empty.
        let text = eventName.text ?? ""
        
        saveButton.enabled = !text.isEmpty
    }
    
    // MARK: Navigation
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            event = Event(name: eventName.text ?? "")
        }
    }
    
    // MARK: Actions
    
    @IBAction func createEvent(sender: UIButton) {
    }

}

