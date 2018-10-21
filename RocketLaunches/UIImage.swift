//
//  UIImage.swift
//  RocketLaunches
//
//  Created by Alexandru Turcanu on 20/10/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import UIKit.UIImage

extension UIImage {
    static let astronautIcon: UIImage = {
        guard let icon = UIImage(named: "AstronautIcon") else {
            fatalError("icon problemo")
        }
        
        return icon
    }()
    
    static let satteliteIcon: UIImage = {
        guard let icon = UIImage(named: "SatteliteIcon") else {
            fatalError("icon problemo")
        }
        
        return icon
    }()
    
    static let cargoIcon: UIImage = {
        guard let icon = UIImage(named: "CargoIcon") else {
            fatalError("icon problemo")
        }
        
        return icon
    }()
    
    static let voyagerIcon: UIImage = {
        guard let icon = UIImage(named: "VoyagerIcon") else {
            fatalError("icon problemo")
        }
        
        return icon
    }()
}

