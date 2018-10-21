//
//  UpcomingViewController.swift
//  RocketLaunches
//
//  Created by Alexandru Turcanu on 21/10/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class UpcomingViewController: UIViewController {

    @IBOutlet private weak var simpleTableView: UITableView!
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    private var rocketLaunch: RocketLaunch?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        RoccetService.retrieveLaunchFor { [unowned self] (data) in
            print(data)
            let newRocketLaunch = RocketLaunch(data: data, index: 0, payload: .cargo, destination: "Helio-N/A")
            
            self.rocketLaunch = newRocketLaunch
            self.simpleTableView.reloadData()
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let loaderFrame = CGRect(x: self.view.bounds.midX - 50, y: self.view.bounds.midY - 50, width: 100, height: 100)
        let loader = NVActivityIndicatorView(frame: loaderFrame, type: NVActivityIndicatorType(rawValue: 30), color: .kfPrimary, padding: nil)
        
        self.blurView.contentView.addSubview(loader)
        loader.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(5000)) { [unowned self] in
            UIView.animate(withDuration: 0.25, animations: {
                self.blurView.alpha = 0
            }, completion: { (_) in
                loader.stopAnimating()
                self.blurView.isHidden = true
            })
        }
    }
    
    
    
    private func configureTableView() {
        simpleTableView.rowHeight = UITableViewAutomaticDimension
        simpleTableView.separatorStyle = .none
        
        simpleTableView.backgroundColor = .kfGray
        
        simpleTableView.dataSource = self
        simpleTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailedRocketLaunchViewController else {
            return
        }
        
        destination.rocketLaunch = rocketLaunch
    }

}

extension UpcomingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingTableViewCell.identifier, for: indexPath) as? UpcomingTableViewCell else {
            assertionFailure("somebody is dumb")
            return UITableViewCell()
        }
        
        cell.reloadData(for: rocketLaunch ?? Constants.rocketLaunch)
        return cell
    }
    
    
}


extension UpcomingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        performSegue(withIdentifier: "everythingIsFine", sender: nil)
        return false
    }
}
