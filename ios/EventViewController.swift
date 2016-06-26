//
//  EventViewController.swift
//  ios
//
//  Created by Millin Gabani on 2016-06-26.
//  Copyright © 2016 Millin Gabani. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, CreateEventViewControllerDelegate {

    // MARK: Properties
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the navigation Title
        navigationItem.title = event?.name
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "EditEvent" {
            let navigationViewController = segue.destinationViewController as! UINavigationController
            let editEventViewController = navigationViewController.topViewController as! CreateEventViewController
            editEventViewController.delegate = self
            editEventViewController.event = self.event
        }
    }
    
    // MARK: CreateTableViewControllerDelegate
    
    func onDismiss(event: Event?) {
        if let e = event{
            ManagementServer.sharedInstance.updateEvent(e) { error in
                if let _ = error {
                    debugPrint("There was a problem in updating the event: \(error)");
                }
            }
        }
    }
}
