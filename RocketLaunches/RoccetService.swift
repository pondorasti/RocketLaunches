//
//  RoccetService.swift
//  RocketLaunches
//
//  Created by Alexandru Turcanu on 21/10/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import Foundation
import Alamofire

struct RoccetService {
    static func retrieveNext(_ number: Int = 1, completion: @escaping (_ data: Any) -> ()) {
        let url = "https://launchlibrary.net/1.4/launch/next/\(number)"
        
        Alamofire.request(url).responseJSON { (response) in
            if let json = response.result.value {
                return completion(json)
            }
        }
    }
    
    static func retrieveLaunchFor(_ url: String = "https://launchlibrary.net/1.4/launch/Falcon_Heavy", completion: @escaping (_ data: Any) -> ()) {
        Alamofire.request(url).responseJSON { (response) in
            if let json = response.result.value {
                return completion(json)
            }
        }
    }
}
