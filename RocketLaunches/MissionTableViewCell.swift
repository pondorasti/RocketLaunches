//
//  MissionTableViewCell.swift
//  RocketLaunches
//
//  Created by Alexandru Turcanu on 20/10/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import UIKit

class MissionTableViewCell: UITableViewCell {

    @IBOutlet private weak var containerView: UIView!
    
    @IBOutlet private weak var missionTitleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    static let identifier = "mission"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = .kfGray
        
        missionTitleLabel.textColor = .kfHeadline
        descriptionLabel.textColor = .kfBody
        
        configureContainerView()
    }
    
    private func configureContainerView() {
        containerView.backgroundColor = .kfSuperWhite
        containerView.layer.setUpShadow()
        containerView.layer.cornerRadius = CALayer.kfCornerRadius
        containerView.clipsToBounds = false
    }
    
    public func reloadData(for data: RocketLaunch) {
        missionTitleLabel.text = data.missionName
        descriptionLabel.text = data.missionDescription
    }


}
