//
//  UpcomingTableViewCell.swift
//  RocketLaunches
//
//  Created by Alexandru Turcanu on 21/10/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import UIKit
import WebKit
import CountdownLabel

class UpcomingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var payloadImageView: UIImageView!
    
    @IBOutlet weak var missionTitleLabel: UILabel!
    @IBOutlet weak var spaceshipLabel: UILabel!
    
    @IBOutlet weak var liveStreamWebView: WKWebView!
    
    @IBOutlet weak var timerView: UIView!
    
    static let identifier = "upcoming"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = .kfGray
        
        configureContainerView()
        configureLabels()
        configureTimer()
    }
    
    private func configureTimer() {
        let countDownLabel = CountdownLabel(frame: timerView.bounds, minutes: 30 * 60)
        timerView.addSubview(countDownLabel )
        
        countDownLabel.start()
    }
    
    private func configureLabels() {
        missionTitleLabel.textColor = .kfHeadline
        spaceshipLabel.textColor = .kfBody
    }
    
    private func configureContainerView() {
        containerView.backgroundColor = .kfSuperWhite
        containerView.layer.setUpShadow()
        containerView.layer.cornerRadius = CALayer.kfCornerRadius
        containerView.clipsToBounds = false
    }
    
    public func reloadData(for data: RocketLaunch) {
        payloadImageView.image = data.payload.getImage()
        
        missionTitleLabel.text = data.missionName
        spaceshipLabel.text = data.rocket.name
        
        if let url = URL(string: "https://youtu.be/z6UtNpbGSHs") {
            liveStreamWebView.load(URLRequest(url: url))
        }
    
    }

}
