//
//  GeniusBar.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/25/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit

class GeniusBar : WorkPlace
{
  var companyDescription = "At my school, I serve on our student “Genius Bar”. Whenever a teacher or student has an issue with their technology, they are able to come to the Genius Bar desk so we can resolve the issue for them. While the problems do vary in nature, we cover questions ranging from basic questions of how to use an iPad to more advanced questions often related to computer science. Because this is a paid position, it is listed under work even though it is done through the school."
  override func viewDidLoad() {
    super.viewDidLoad("menlo_logo.jpg", link: "http://menloschool.org", webTitle: "Menlo School", jobTitle: "\"Genius\"", companyDescription: companyDescription, header: "Work")
  }
}
