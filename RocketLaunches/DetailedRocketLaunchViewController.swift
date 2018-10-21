//
//  DetailedRocketLaunchViewController.swift
//  RocketLaunches
//
//  Created by Alexandru Turcanu on 20/10/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import UIKit

class DetailedRocketLaunchViewController: UIViewController {

    @IBOutlet private weak var rocketLaunchTableView: UITableView!
    
    var rocketLaunch: RocketLaunch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        configureRocketLaunchTableView()
    }
    
    private func configureRocketLaunchTableView() {
        rocketLaunchTableView.allowsSelection = false
        
        rocketLaunchTableView.rowHeight = UITableViewAutomaticDimension
        rocketLaunchTableView.separatorStyle = .none
        
        rocketLaunchTableView.backgroundColor = .kfGray
        
        rocketLaunchTableView.dataSource = self
    }

}

extension DetailedRocketLaunchViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RocketLaunchTableViewCell.identifier, for: indexPath) as? RocketLaunchTableViewCell else {
                assertionFailure("somebody is dumb")
                return UITableViewCell()
            }
            
            cell.reloadData(for: rocketLaunch)
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MissionTableViewCell.identifier, for: indexPath) as? MissionTableViewCell else {
                assertionFailure("somebody is dumb")
                return UITableViewCell()
            }
            
            cell.reloadData(for: rocketLaunch)
            
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SpaceshipTableViewCell.identifier, for: indexPath) as? SpaceshipTableViewCell else {
                assertionFailure("somebody is dumb")
                return UITableViewCell()
            }
            
            cell.reloadData(for: rocketLaunch.rocket)
            cell.delegate = self
            
            return cell
            
        default:
            fatalError()
        }
        
        
    }
    
    
}

extension DetailedRocketLaunchViewController: WikiDelegate {
    func shouldPressButton() {
        UIApplication.shared.open(rocketLaunch.rocket.wikiLink, options: [:])
    }
}
