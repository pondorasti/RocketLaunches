//
//  RocketLaunchTableViewCell.swift
//  RocketLaunches
//
//  Created by Alexandru Turcanu on 20/10/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import UIKit

class RocketLaunchTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    
    @IBOutlet private weak var payloadImageView: UIImageView!
    
    @IBOutlet private weak var missionNameLabel: UILabel!
    @IBOutlet private weak var spaceShipNameLabel: UILabel!
    @IBOutlet private weak var launchDateLabel: UILabel!
    
    @IBOutlet private weak var wasSuccesfulView: UIView!
    @IBOutlet private weak var wasSuccesfulLabel: UILabel!
    
    @IBOutlet private weak var rocketOperatorView: UIView!
    @IBOutlet private weak var rocketOperatorLabel: UILabel!
    
    @IBOutlet private weak var destinationView: UIView!
    @IBOutlet private weak var destinationLabel: UILabel!
    
    static let identifier = "NotSoUniqueID"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        destinationView.backgroundColor = .kfPrimary
        rocketOperatorView.backgroundColor = .kfRocketOperator
        
        contentView.backgroundColor = .kfGray
        
        configureContainerView()
        configureLabels()
    }
    
    private func configureContainerView() {
        containerView.backgroundColor = UIColor.kfSuperWhite
        containerView.layer.setUpShadow()
        containerView.layer.cornerRadius = CALayer.kfCornerRadius
        containerView.clipsToBounds = false
    }
    
    private func configureLabels() {
        missionNameLabel.textColor = .kfHeadline
        spaceShipNameLabel.textColor = .kfBody
        launchDateLabel.textColor = .kfBody
        
        wasSuccesfulLabel.textColor = .kfSuperWhite
        rocketOperatorLabel.textColor = .kfSuperWhite
        destinationLabel.textColor = .kfSuperWhite
        
        wasSuccesfulView.layer.cornerRadius = CALayer.kfCornerRadius
        rocketOperatorView.layer.cornerRadius = CALayer.kfCornerRadius
        destinationView.layer.cornerRadius = CALayer.kfCornerRadius
    }

    public func reloadData(for data: RocketLaunch) {
        missionNameLabel.text = data.missionName
        spaceShipNameLabel.text = data.rocket.name
        launchDateLabel.text = "\(data.date)"
        
        payloadImageView.image = data.payload.getImage()
        
        rocketOperatorLabel.text = data.rocketOperator
        destinationLabel.text = data.destination
        
        wasSuccesfulLabel.text = data.status.rawValue.capitalized
        wasSuccesfulView.backgroundColor = data.status.getColor()
    }
}
