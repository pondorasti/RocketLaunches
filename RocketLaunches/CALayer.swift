//
//  CALayer.swift
//  RocketLaunches
//
//  Created by Alexandru Turcanu on 20/10/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import UIKit

extension CALayer {
    static let kfCornerRadius: CGFloat = 8
    
    static let kfShadowOpacity: Float = 0.2
    static let kfShadowOffset: CGSize = CGSize(width: 0, height: 2)
    static let kfShadowColor: CGColor = UIColor.black.cgColor
    static let kfShadowRadius: CGFloat = 3
    
    func setUpShadow() {
        self.shadowColor = CALayer.kfShadowColor
        self.shadowOffset = CALayer.kfShadowOffset
        self.shadowRadius = CALayer.kfShadowRadius
        self.shadowOpacity = CALayer.kfShadowOpacity
    }
}
