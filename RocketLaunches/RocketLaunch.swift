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
        case astronaut, cargo, sattelite, voyager
        
        func getImage() -> UIImage {
            switch self {
            case .astronaut:
                return UIImage.astronautIcon
                
            case .cargo:
                return UIImage.cargoIcon
                
            case .sattelite:
                return UIImage.satteliteIcon
                
            case .voyager:
                return UIImage.voyagerIcon
            }
        }
    }
    
    enum Status: String {
        case go, TBD, succes, failure
        
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
        
        static func getFor(_ value: Int) -> Status {
            switch value {
            case 1:
                return .go
                
            case 2:
                return .TBD
                
            case 3:
                return .succes
                
            case 4:
                return .failure
                
            default:
                fatalError()
            }
        }
    }
    
    let rocket: Rocket
    
    let missionName: String
    let missionDescription: String
    
    let payload: PayloadType
    
    let date: String
    let status: Status
    let rocketOperator: String
    
    let spacePort: String
    let destination: String
    
    let dateWindow: String
    
    init(rocket: Rocket, missionName: String, missionDescription: String, payload: PayloadType, date: String, status: Status, rocketOperator: String, spacePort: String, destination: String, dateWindow: String) {
        self.rocket = rocket
        
        self.missionDescription = missionDescription
        self.missionName = missionName
        
        self.payload = payload
        
        self.date = date
        self.status = status
        self.rocketOperator = rocketOperator
        
        self.spacePort = spacePort
        self.destination = destination
        
        self.dateWindow = dateWindow
    }
    
    init?(data: Any, index: Int, payload: PayloadType, destination: String) {
        
        guard let dict = data as? [String: Any],
            let dictionaryArray = dict["launches"] as? [[String: Any]],
            let dictionary = dictionaryArray[index] as? [String: Any],
            
            let windowstart = dictionary["windowstart"] as? String,
            let windowend = dictionary["windowend"] as? String,
            
            let missionsDictArray = dictionary["missions"] as? [[String: Any]],
            let missionsDict = missionsDictArray.first,
            
            let missionName = missionsDict["name"] as? String,
            let missionDescription = missionsDict["description"] as? String,
            let date = dictionary["net"] as? String,
            let statusRawValue = dictionary["status"] as? Int,
            
            let agenciesDictArray = missionsDict["agencies"] as? [[String: Any]],
            let agenciesDict = agenciesDictArray.first,
            let rocketOperator = agenciesDict["abbrev"] as? String,
            
            let locationDict = dictionary["location"] as? [String: Any],
            let padsDictArray = locationDict["pads"] as? [[String: Any]],
            let padsDict = padsDictArray.first,
            let spacePort = padsDict["name"] as? String,
        
            let rocketDict = dictionary["rocket"] as? [String: Any],
            let rocketName = rocketDict["name"] as? String,
            let familyName = rocketDict["familyname"] as? String,
            let configuration = rocketDict["configuration"] as? String,
            
            let wikiLink = rocketDict["wikiURL"] as? String,
            let wikiURL = URL(string: wikiLink),
        
            let imageLink = rocketDict["imageURL"] as? String,
            let imageURL = URL(string: imageLink)
        else {
            return nil
        }
        
        self.missionName = missionName
        self.missionDescription = missionDescription
        
        self.date = date
        self.status = Status.getFor(statusRawValue)
        
        self.rocketOperator = rocketOperator
        
        self.spacePort = spacePort
        //MARK: hard coded values
        
        self.payload = payload
        self.destination = destination
        
        dateWindow = "poof"
        
        let rocket = Rocket(imageURL: imageURL, wikiURL: wikiURL, name: rocketName, family: familyName, configuration: configuration, generalDescription: "", height: 17.6, diameter: 1.27, numberOfStages: 3, massToLEO: 977, massToGTO: 247, massAtLaunch: 18500)
        
        self.rocket = rocket
        
    }
}
