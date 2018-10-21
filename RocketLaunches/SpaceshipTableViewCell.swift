//
//  SpaceshipTableViewCell.swift
//  RocketLaunches
//
//  Created by Alexandru Turcanu on 21/10/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import UIKit
import Kingfisher

class SpaceshipTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var familyLabel: UILabel!
    @IBOutlet private weak var configurationLabel: UILabel!
    
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var spaceshipImageView: UIImageView!
    
    @IBOutlet weak var specificationsTitleLabel: UILabel!
    @IBOutlet private weak var heightLabel: UILabel!
    @IBOutlet private weak var diameterLabel: UILabel!
    @IBOutlet private weak var numberOfStagesLabel: UILabel!
    @IBOutlet private weak var massToLEOLabel: UILabel!
    @IBOutlet private weak var massToGTOLabel: UILabel!
    @IBOutlet private weak var massAtLaunchLabel: UILabel!
    
    @IBOutlet weak var wikiButton: UIButton!
    
    @IBAction func wikiButtonPressed(_ sender: Any) {        
        delegate?.shouldPressButton()
    }
    
    static let identifier = "spaceship"
    
    weak var delegate: WikiDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        wikiButton.backgroundColor = .kfPrimary
        wikiButton.setTitleColor(.kfSuperWhite, for: .normal)
        wikiButton.layer.cornerRadius = CALayer.kfCornerRadius
    
        spaceshipImageView.layer.cornerRadius = CALayer.kfCornerRadius
        contentView.backgroundColor = .kfGray
        
        configureContainerView()
        configureLabels()
    }
    
    private func configureContainerView() {
        containerView.backgroundColor = .kfSuperWhite
        containerView.layer.setUpShadow()
        containerView.layer.cornerRadius = CALayer.kfCornerRadius
        containerView.clipsToBounds = false
    }
    
    private func configureLabels() {
        nameLabel.textColor = .kfHeadline
        familyLabel.textColor = .kfHeadline
        configurationLabel.textColor = .kfHeadline
        specificationsTitleLabel.textColor = .kfHeadline
        
        descriptionLabel.textColor = .kfBody
        heightLabel.textColor = .kfBody
        diameterLabel.textColor = .kfBody
        numberOfStagesLabel.textColor = .kfBody
        massToLEOLabel.textColor = .kfBody
        massToGTOLabel.textColor = .kfBody
        massAtLaunchLabel.textColor = .kfBody
        
    }
    
    public func reloadData(for data: Rocket) {
        nameLabel.text = data.name
        familyLabel.text = "Family: \(data.family)"
        configurationLabel.text = "Configuration: \(data.configuration)"
        
        descriptionLabel.text = data.generalDescription
        
        spaceshipImageView.kf.setImage(with: data.imageURL)
        
        heightLabel.text = "Height: \(data.height) meters"
        diameterLabel.text = "Diameter: \(data.diameter) meters"
        numberOfStagesLabel.text = "Number of Stages: \(data.numberOfStages)"
        massToLEOLabel.text = "Mass to LEO: \(data.massToLEO) kg"
        massToGTOLabel.text = "Mass to GTO: \(data.massToGTO) kg"
        massAtLaunchLabel.text = "Mass at Launch: \(data.massAtLaunch) kg"
        
    }
}

protocol WikiDelegate: class {
    func shouldPressButton()
}
