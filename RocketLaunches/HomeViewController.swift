//
//  HomeViewController.swift
//  RocketLaunches
//
//  Created by Alexandru Turcanu on 20/10/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var rocketLaunchesTableView: UITableView!
    
    var rocketLaunches = [RocketLauch]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    private func configureTableView() {
        rocketLaunchesTableView.dataSource = self
        rocketLaunchesTableView.delegate = self
    }

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rocketLaunches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RocketLaunchTableViewCell.identifier, for: indexPath) as? RocketLaunchTableViewCell else {
            return assertionFailure("somebody is dumb")
        }
        
        
        
        return cell
    }
    
    
    
}

extension HomeViewController: UITableViewDelegate {
    
}
