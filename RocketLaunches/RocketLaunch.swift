//
//  RocketLaunch.swift
//  RocketLaunches
//
//  Created by Alexandru Turcanu on 20/10/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import Foundation
import UIKit

struct RocketLaunch {
    
    enum PayloadType {
        case astronaut, cargo, sattelite
        
        func getImage() -> UIImage {
            switch self {
            case .astronaut:
                return UIImage.astronautIcon
                
            case .cargo:
                return UIImage.cargoIcon
                
            case .sattelite:
                return UIImage.satteliteIcon
            }
        }
    }
    
    enum Status: String {
        case TBD, go, succes, failure
        
        func getColor() -> UIColor {
            switch self {
            case .TBD:
                return UIColor.kfOrange
                
            case .go:
                return UIColor.kfSucces
                
            case .succes:
                return UIColor.kfSucces
                
            case .failure:
                return UIColor.kfDestructive
            }
        }
    }
    
    let rocket: Rocket
    
    let missionName: String
    let missionDescription: String
    
    let payload: PayloadType
    
    let date: Date
    let status: Status
    let rocketOperator: String
    
    let spacePort: String
    let destination: String
    
    let dateWindow: String
}
