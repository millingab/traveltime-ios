//
//  Event.swift
//  ios
//
//  Created by Millin Gabani on 2016-06-25.
//  Copyright © 2016 Millin Gabani. All rights reserved.
//

import UIKit

class Event {
    
    // MARK: Properties
    
    var name: String
    //var startDate: NSDate
    //var endDate: NSDate
    //var allDay: Bool
    //var note: String
    
    // MARK: Initialization
    
    // Failable initializer
    init?(name: String) {
        self.name = name
    
        if name.isEmpty {
            return nil
        }
    }
}
