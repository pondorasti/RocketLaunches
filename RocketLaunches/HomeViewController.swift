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
    
    static let numberOfLaunchesToShow = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        
        RoccetService.retrieveNext(HomeViewController.numberOfLaunchesToShow) { [unowned self] (data) in
            print(data)
            
            for index in 0..<HomeViewController.numberOfLaunchesToShow {
                if let newRocketLaunch = RocketLaunch(data: data, index: index) {
                    self.rocketLaunches.append(newRocketLaunch)
                }
            }
            
            self.rocketLaunchesTableView.reloadData()
        }
    }
    
    
    private func bruteForce() {
        
        rocketLaunches = [Constants.rocketLaunch, Constants.rocketLaunch, Constants.rocketLaunch, Constants.rocketLaunch]
        
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
