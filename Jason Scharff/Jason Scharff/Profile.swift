//
//  Profile.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/15/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit

class Profile
{
  var name : String
  var details : [String : String]
  var backgroundImage : UIImage
  
  init(name : String)
  {
    self.name = name;
    self.details = [String : String]()
    self.backgroundImage = UIImage(named:"background.png")!
  }
  
  init(name : String, image : UIImage)
  {
    self.name = name
    self.details = [String : String]()
    self.backgroundImage = image
  }
  
  func addProfileElement(heading : String, description : String)
  {
    self.details[heading] = description
  }
  
  func isValidUser() -> Bool
  {
    if details.count >= 3
    {
      return true
    }
    
    return false
  }
 
  
}
