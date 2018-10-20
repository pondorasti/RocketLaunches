//
//  HomeViewController.swift
//  RocketLaunches
//
//  Created by Alexandru Turcanu on 20/10/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var rocketLaunchesTableView: UITableView!
    
    var rocketLaunches = [RocketLaunch]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        bruteForce()
    }
    
    
    private func bruteForce() {
        
        let rocket = Rocket(image: UIImage(), wikiLink: URL(string: "https://launchlibrary.net/docs/1.4/api.html#eventtype")!, name: "Falcon", family: "Family", configuration: "Config", generalDescription: "Big Spaceship", height: 420, diameter: 420, numberOfStages: 4, massToLEO: 9, massToGTO: 9, massAtLaunch: 9)
        
        let rocketLaunch = RocketLaunch(rocket: rocket, missionName: "Mission Name", missionDescription: "Mission Description", payload: .astronaut, date: Date(), status: .go, rocketOperator: "SpaceX", spacePort: "i duuno no", destination: "Mars", dateWindow: "12-12")
        
        rocketLaunches = [rocketLaunch, rocketLaunch, rocketLaunch, rocketLaunch]
        
        rocketLaunchesTableView.reloadData()

    }

    private func configureTableView() {
        rocketLaunchesTableView.dataSource = self
        rocketLaunchesTableView.delegate = self
        
        rocketLaunchesTableView.separatorStyle = .none
        rocketLaunchesTableView.backgroundColor = UIColor.kfGray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let id = segue.identifier
        
        switch id {
        case UIStoryboardSegue.showDetailedView:
            guard let detailedVC = segue.destination as? DetailedRocketLaunchViewController, let index = sender as? Int else {
                fatalError()
            }
            
            detailedVC.rocketLaunch = rocketLaunches[index]
            
        default:
            fatalError()
        }
    }

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rocketLaunches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RocketLaunchTableViewCell.identifier, for: indexPath) as? RocketLaunchTableViewCell else {
            assertionFailure("somebody is dumb")
            return UITableViewCell()
        }
        
        
        cell.reloadData(for: rocketLaunches[indexPath.row])
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        performSegue(withIdentifier: UIStoryboardSegue.showDetailedView, sender: indexPath.row)
        return false
    }
}
