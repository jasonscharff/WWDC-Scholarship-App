//
//  Entefy.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/25/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit

class Entefy : WorkPlace
{
  var companyDescription = "I work for a company called Entefy as an iOS Software Engineering Intern. Still under development, the exact details of the product are still confidential. However, generally, the company is working on building the world’s first Universal Interaction Engine (UIE). A UIE basically combines a variety of communication platforms to create one, people centric, app. At Entefy, I’m currently working on the iPad app."
  override func viewDidLoad() {
    super.viewDidLoad("entefy.png", link: "http://entefy.com", webTitle: "Entefy", jobTitle: "Software Engineering Intern", companyDescription: companyDescription, header: "Work")

    
  }
  
}
