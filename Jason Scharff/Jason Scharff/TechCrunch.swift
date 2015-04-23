//
//  TechCrunch.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/19/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit

class TechCrunch : SpecificHackathon
{
  let projectDescription = "At Tech Crunch Disrupt SF 2015 I made a photobooth for the modern era. It consisted of both a Mac and an Phone app. After downloading our iPhone app and configuring it with their social network accounts (Facebook, Twitter, and Snapchat) a user would simply need to walk up to any Mac running our software and using iBeacon the Mac would automatically recognize a user and take their picture upon approach. Then the picture would be pushed from the Mac onto the iPhone and automatically uploaded to all of their social networks. Using this, a photobooth picture could be shared online with all of a person’s friends instead of being an analog picture that’ll probably end up getting thrown away. For our project we ending up winning tickets to the Tech Crunch Disrupt conference."
  
  let projectTitle = "OwlBooth"
  
  
  
  override func viewDidLoad() {

    super.viewDidLoad("techcrunch.png", projectTitle: projectTitle, projectDescription: projectDescription)
    
  }
}