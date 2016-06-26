//
//  EventTableViewController.swift
//  ios
//
//  Created by Millin Gabani on 2016-06-25.
//  Copyright © 2016 Millin Gabani. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var events = [Event]()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Fetch and display the events
        
        fetchAndDisplayEvents()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // We only need one section right now
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return events.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "EventTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EventTableViewCell

        // Configure the cell...
        
        // Fetches the appropriate event for the data source layout.
        let event = events[indexPath.row]
        
        cell.nameLable.text = event.name

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindToEventList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as?
            CreateEventViewController, event = sourceViewController.event {
            
            self.postEventToServer(event)
            
        }
    }
    
    // MARK: Helpers
    
    func fetchAndDisplayEvents() {
        ManagementServer.sharedInstance.getEventsList(){ eventList, error in
            if let e = eventList {
                if e != self.events {
                    self.events = e
                }
            }
            for event in self.events{
                print(event.name)
            }
            self.tableView.reloadData()
            
            if let _ = error {
                debugPrint("There was a problem fetching eventlist: \(error)");
            }
        }
    }
    
    func postEventToServer(event: Event?) {
        if let e = event{
            ManagementServer.sharedInstance.createEvent(e) { error in
                self.fetchAndDisplayEvents()
                
                if let _ = error {
                    debugPrint("There was a problem creating the event: \(error)");
                }
            }
        }
    }

}
