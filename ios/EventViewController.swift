//
//  EventViewController.swift
//  ios
//
//  Created by Millin Gabani on 2016-06-26.
//  Copyright © 2016 Millin Gabani. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, UINavigationControllerDelegate, CreateEventViewControllerDelegate {

    // MARK: Properties
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.delegate = self
        
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
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        if let eventTableViewController = viewController as? EventTableViewController{
            eventTableViewController.fetchAndDisplayEvents()
        }
        
    }

    
    // MARK: CreateTableViewControllerDelegate
    
    func onDismiss(event: Event?) {
        if let e = event{
            navigationItem.title = e.name
            ManagementServer.sharedInstance.updateEvent(e) { error in
                if let _ = error {
                    debugPrint("There was a problem in updating the event: \(error)");
                }
            }
        }
    }
}
