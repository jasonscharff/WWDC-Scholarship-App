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
  var projectDescription = "I need to write something"
  
  override func viewDidLoad() {
    super.viewDidLoad("hshacks.png", projectTitle: "Drone Buddy", projectDescription: projectDescription)
    addVideo("droneBuddy", type: "mp4")
    addLink("Code Available Here", destination: "https://github.com/jasonscharff/drone-buddy", title: "Code")
    addLink("Challenge Post", destination: "http://challengepost.com/software/drone-buddy", title: "Challenge Post")
  }
  
}