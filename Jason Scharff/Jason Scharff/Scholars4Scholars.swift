//
//  Scholars4Scholars.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/25/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit
class Scholars4Scholars : WorkPlace
{
  var companyDescription = "Over the summer of 2014, I met a friend from the Rio Grande Valley in Texas. The more I learned from him, the more I found out about the situation in the Rio Grande Valley. I was shocked to find out that the Rio Grande Valley is incredibly poor with the average salary hovering just above $20,000 a year. The friend I had met had then described his non-profit to me. The goal of his non-profit was to focus on helping spread the idea of college to citizens of the Rio Grande Valley…and to help pay for it. Since then, it’s pivoted to essentially three pillars: a scholarship, a scholarship search, and outreach. We help students in this valley understand the value of college and then help pay for it by finding them a scholarship that suits them. After hearing about this work, I had to join. While the base is in the Rio Grande Valley, I help with fundraising by connecting this non-profit to the Bay Area. While a relatively new chapter in my life, I’m incredibly excited to help this startup non-profit with their mission."
  override func viewDidLoad() {
    super.viewDidLoad("s4s_logo.png", link: "https://scholars4scholars.org/", webTitle: "S4S", jobTitle: "Fundraising Associate", companyDescription: companyDescription, header: "Non-Profit Work")
  }
}
