//
//  Rocket.swift
//  RocketLaunches
//
//  Created by Alexandru Turcanu on 20/10/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import Foundation
import UIKit

struct Rocket {

    let imageURL: URL
    let wikiURL: URL
    
    let name: String
    let family: String
    let configuration: String
    let generalDescription: String
    
    let height: Double
    let diameter: Double
    
    let numberOfStages: Int
    
    let massToLEO: Int
    let massToGTO: Int
    let massAtLaunch: Int
}
