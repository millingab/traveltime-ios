//
//  ManagementServer.swift
//  ios
//
//  Created by Millin Gabani on 2016-06-25.
//  Copyright © 2016 Millin Gabani. All rights reserved.
//

import Alamofire

class ManagementServer{
    
    typealias EventCallback = ([Event]?, NSError?)->()

    // By default, retry 3 times every 2 seconds.
    // Each retry times out after 5 seconds.
    private let HTTP_RETRY_COUNT = Int32(3)
    private let HTTP_RETRY_INTERVAL = Int32(2)
    private let HTTP_TIMEOUT = Int32(5)

    // The API version this client is using
    let API_VERSION = "1.0"
    
    let BASE_URL = "https://travel-time.herokuapp.com/api/"
    
    let EVENT_PATH = "events/"
    
    var events = [Event]()
    
    func getEventsList(callback: EventCallback?){
        Alamofire
            .request(.GET, BASE_URL+EVENT_PATH)
            .responseJSON{ response in switch response.result {
    
                case .Success:
                    self.events.removeAll()
                    if let JSON = response.result.value as? NSArray{
                        for eventJSON in JSON{
                            if let eventName = eventJSON["name"] as? String{
                                let event = Event(name: eventName)
                                self.events.append(event!)
                            }
                        }
                    }
                    if let cb = callback {
                        cb(self.events,nil)
                    }
                case .Failure(let error):
                    debugPrint(response)
                    if let cb = callback {
                        cb(nil,error)
                    }
                
            }
        }
    }
}