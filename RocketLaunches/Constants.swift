//
//  Constants.swift
//  RocketLaunches
//
//  Created by Alexandru Turcanu on 21/10/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import UIKit

struct Constants {
    static let rocket = Rocket(imageURL: URL(string: "https://launchlibrary.net/docs/1.4/api.html#eventtype")!, wikiURL: URL(string: "https://launchlibrary.net/docs/1.4/api.html#eventtype")!, name: "Falcon", family: "Family", configuration: "Config", generalDescription: "Nulla fringilla tempor dui, vitae sodales ligula euismod non. Nullam eu accumsan erat, vitae convallis ante. Maecenas imperdiet, felis sed eleifend viverra, nunc tellus facilisis metus, ut venenatis tortor justo vel elit. Suspendisse luctus euismod cursus. Mauris elementum, quam vitae varius egestas, nunc erat euismod nulla, eu efficitur velit arcu non felis. Donec vehicula, sapien ut porta lobortis, purus libero semper enim, non sagittis massa magna a quam", height: 420, diameter: 420, numberOfStages: 4, massToLEO: 9, massToGTO: 9, massAtLaunch: 9)
    
    static let rocketLaunch = RocketLaunch(rocket: rocket, missionName: "Mission Name", missionDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas non justo lectus. Quisque non iaculis turpis, non eleifend arcu. Aliquam erat volutpat. Fusce placerat pulvinar cursus. Cras porttitor, lorem vitae bibendum pretium, tellus lorem rhoncus magna, non consequat diam tortor id lectus. Aliquam leo est, tristique id mollis id, posuere vel tellus. Phasellus luctus ac enim vel cursus. Fusce finibus mi ac tempor vestibulum. Nunc nibh leo, semper tincidunt consequat eu, volutpat non tortor. Nam quis dictum massa. Praesent facilisis, quam sit amet consequat ullamcorper, ipsum orci pharetra lorem, at porta augue ante ut orci. Sed quis mattis orci, non pharetra tellus. Pellentesque ultricies, risus ac tincidunt luctus, tortor orci placerat ex, eu aliquam urna ligula eget erat.", payload: .astronaut, date: "12.12.2012", status: .go, rocketOperator: "SpaceX", spacePort: "i duuno no", destination: "Mars", dateWindow: "12-12")
}
