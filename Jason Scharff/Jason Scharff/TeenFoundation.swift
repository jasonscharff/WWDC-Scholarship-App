//
//  TeenFoundation.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/25/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit
class TeenFoundation : WorkPlace
{
  var companyDescription = "I serve as a member of the South Peninsula Jewish Teen Foundation. As a foundation, we raise money and then determine where to allocate those funds. This year our focus is on preventing and supporting victims of violence in both the United States and world wide. While we haven’t decided on the non-profits for this year yet (we decide on May 3rd), our current contenders include non-profits dealing with victims of the current crisis in Ukraine, organizations that support US veterans, and support networks that help victims of domestic violence."
  override func viewDidLoad() {
    super.viewDidLoad("jtf_logo.jpg", link: "http://spjtf.org", webTitle: "JTF", jobTitle: "Board Member", companyDescription: companyDescription, header: "Non-Profit Work")
  }
}
