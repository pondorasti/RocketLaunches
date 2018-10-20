//
//  RocketLaunchTableViewCell.swift
//  RocketLaunches
//
//  Created by Alexandru Turcanu on 20/10/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import UIKit

class RocketLaunchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var payloadImageView: UIImageView!
    
    @IBOutlet weak var missionNameLabel: UILabel!
    @IBOutlet weak var spaceShipNameLabel: UILabel!
    @IBOutlet weak var launchDateLabel: UILabel!
    
    @IBOutlet weak var wasSuccesfulView: UIView!
    @IBOutlet weak var wasSuccesfulLabel: UILabel!
    
    @IBOutlet weak var rocketOperatorView: UIView!
    @IBOutlet weak var rocketOperatorLabel: UILabel!
    
    @IBOutlet weak var destinationView: UIView!
    @IBOutlet weak var destinationLabel: UILabel!
    
    static let identifier = "NotSoUniqueID"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        destinationView.backgroundColor = UIColor.kfDestination
        rocketOperatorView.backgroundColor = UIColor.kfRocketOperator
        
        contentView.backgroundColor = UIColor.kfGray
        
        containerView.backgroundColor = UIColor.kfSuperWhite
        containerView.layer.setUpShadow()
        containerView.layer.cornerRadius = CALayer.kfCornerRadius
        containerView.clipsToBounds = false
        
        missionNameLabel.textColor = UIColor.kfHeadline
        spaceShipNameLabel.textColor = UIColor.kfBody
        launchDateLabel.textColor = UIColor.kfBody
        
        wasSuccesfulLabel.textColor = UIColor.kfSuperWhite
        rocketOperatorLabel.textColor = UIColor.kfSuperWhite
        destinationLabel.textColor = UIColor.kfSuperWhite
        
        wasSuccesfulView.layer.cornerRadius = CALayer.kfCornerRadius
        rocketOperatorView.layer.cornerRadius = CALayer.kfCornerRadius
        destinationView.layer.cornerRadius = CALayer.kfCornerRadius
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        
        
    }
    
    public func reloadData(for data: RocketLauch) {
        missionNameLabel.text = data.missionName
        spaceShipNameLabel.text = data.rocket.name
        launchDateLabel.text = "Date: \(data.date.asString(style: .short))"
        
        payloadImageView.image = data.payload.getImage()
        
        rocketOperatorLabel.text = data.rocketOperator
        destinationLabel.text = data.destination
        
        wasSuccesfulLabel.text = data.status.rawValue.capitalized
        wasSuccesfulView.backgroundColor = data.status.getColor()
    }

}
