//
//  RocketLaunch.swift
//  RocketLaunches
//
//  Created by Alexandru Turcanu on 20/10/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import Foundation
import UIKit

struct RocketLauch {
    
    enum TypeOfPayload {
        case astronaut, cargo, sattelite
        
        func getImage() -> UIImage {
            switch self {
            case .astronaut:
                return UIImage()
                
            case .cargo:
                return UIImage()
                
            case .sattelite:
                return UIImage()
            }
        }
    }
    
    enum Status: String {
        case TBD, go, succes, failure
        
        func getColor() -> UIColor {
            switch self {
            case .TBD:
                return UIColor()
                
            case .go:
                return UIColor()
                
            case .succes:
                return UIColor()
                
            case .failure:
                return UIColor()
            }
        }
    }
    
    let rocket: Rocket
    
    let missionName: String
    let missionDescription: String
    
    let payloadImage: UIImage
    
    let date: Date
    let wasSuccesful: Bool?
    let rocketOperator: String
    
    let spacePort: String
    let destination: String
    
    let dateWindow: String
}
