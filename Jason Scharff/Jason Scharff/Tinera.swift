//
//  Tinera.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/25/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit

class Tinera : WorkPlace
{
  var companyDescription = "In my relatively little spare time I’m also working on my own startup called Tinera. We noticed that booking a simple trip is unnecessarily complex. In order to book just a simple trip, one must sift through a series of various flights, hundreds of possible hotels, and thousands of possible activities. To solve this, Tinera is working on developing an app that automatically books weekend trips. In essence, our proprietary algorithm builds an overall profile of each user starting with their Facebook data. Then, every time the user wishes to travel, two completely different travel packages are presented (a flight, a hotel, and an activity). The user can then select which package they prefer (if any) and it automatically books that trip for them. From there, the algorithm learns from which trip they chose to better generate a package in the future. At Tinera, I’m in charge of the development of the iOS Client. While not available yet, a quick video overview is available below."
  
  override func viewDidLoad() {
    super.viewDidLoad("tineraLogo.png", link: "http://tinera.io", webTitle: "Tinera", jobTitle: "Director, iOS Development", companyDescription: companyDescription, header: "Work")
    addVideo("tineraDemo", type: "mov", height:1130, width:640)
    
  }
  
}
