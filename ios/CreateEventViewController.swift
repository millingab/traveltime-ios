//
//  CreateEventViewController.swift
//  ios
//
//  Created by Millin Gabani on 2016-05-26.
//  Copyright © 2016 Millin Gabani. All rights reserved.
//

import UIKit

protocol CreateEventViewControllerDelegate: class {
    func onDismiss(event: Event?)
}

class CreateEventViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Declarations

    typealias DismissCallback = (UIViewController)->()
    
    // MARK: Properties

    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var eventNotes: UITextView!
    @IBOutlet weak var eventAllDay: UISwitch!
    @IBOutlet weak var eventStartTime: UIDatePicker!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    weak var delegate: CreateEventViewControllerDelegate?
    
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Handle the text field’s user input through delegate callbacks.
        eventName.delegate = self
        
        // Set up the view
        navigationItem.title = event?.name ?? "New Event"
        eventName.text = event?.name
        
        // Enable the Save button only if the text field has a valid Event name.
        checkValidEventName()

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
        // Disa ble the Save button if the text field is empty.
        
        let text = eventName.text ?? ""
        
        saveButton.enabled = !text.isEmpty
    }
    
    // MARK: Navigation
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func save(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: {
            let event = self.event ?? Event(name: self.eventName.text!)
            event!.name = self.eventName.text!
            self.delegate?.onDismiss(event)
            })
    }
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let eventTableViewController = segue.destinationViewController as? EventTableViewController{
            if saveButton === sender {
                event = Event(name: eventName.text ?? "")
            }
            eventTableViewController.createEvent(event)
        }
        if segue.destinationViewController is EventViewController {
            if let e = event{
                ManagementServer.sharedInstance.updateEvent(e) { error in
                    if let _ = error {
                        debugPrint("There was a problem in updating the event: \(error)");
                    }
                }
            }
        }
    }*/
    
    // MARK: Actions
    
    @IBAction func createEvent(sender: UIButton) {
    }
    

}

