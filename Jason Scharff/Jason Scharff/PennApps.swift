//
//  PennApps.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/19/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit
class PennApps : SpecificHackathon
{
  var projectDescription = "At PennApps Winter 2015 I made a virtual running enviornment. One of the more tedious aspects of running on a treadmill is that the view remains constant. To solve this, our software consisted of two components: An Oculus Rift app and an iPhone app. Using the iPhone’s pedometer,  the runners cadence was recorded. Using the cadence the iPhone auto-selected music at a similar cadence. Then, using this cadence the Oculus Rift moved the user through a virtual enivornment at the same rate at which they are running.\n\nAs an added bonus, the music could be controlled through a Myo armband (connected to the iPhone) and at the end of a run the iPhone estimated the person’s distance and posted it on Facebook."
  override func viewDidLoad() {
    
    super.viewDidLoad("pennapps.png", projectTitle: "Jockulus", projectDescription: projectDescription)
      addVideo("jockulus", type: "mp4")
      addLink("Code Available Here", destination: "https://github.com/jasonscharff/Jockulus", title: "Code")
      addLink("Challenge Post", destination: "http://challengepost.com/software/jockulus", title: "Challenge Post")
    
  }
  
  override func viewDidDisappear(animated: Bool) {
    self.videoPlayer.pause()
  }
  
    
  
  
}