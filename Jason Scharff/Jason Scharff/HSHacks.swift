//
//  HSHacks.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/19/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit
class HSHacks : SpecificHackathon
{
  var projectDescription = "At HS Hacks II, the largest high school hackathon, I built a software layer for a mini drone that enabled it to follow you without the use of camera—just the sensors on the iPhone. The iPhone would measure sensor reading values then using the Parrot API communicate appropriate instructions to the drone. For example, as the person turned the iPhone would read changes in direction via the gyroscope and then turn the drone the appropriate amount. For the cool factor, we used the accelerometer to detect when the user jumps and has the drone jump as well. Additionally, we used CoreBluetooth to help estimate distance and GPS to help estimate speed. Finally, to control the takeoff and landing of the drone we used the Myo arm band so you could take off and land the drone using hand gestures. For this project, my team won the best hardware hack award and the best use of Myo award. This project can best be shown in the video below."
  
  override func viewDidLoad() {
    super.viewDidLoad("hshacks.png", projectTitle: "Drone Buddy", projectDescription: projectDescription)
    addVideo("droneBuddy", type: "mp4")
    addLink("Code Available Here", destination: "https://github.com/jasonscharff/drone-buddy", title: "Code")
    addLink("Challenge Post", destination: "http://challengepost.com/software/drone-buddy", title: "Challenge Post")
  }
  
}