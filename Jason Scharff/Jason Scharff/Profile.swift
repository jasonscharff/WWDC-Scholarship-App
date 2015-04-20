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
  var details : [String : AnyObject]
  var backgroundImage : UIImage
  
  enum DescriptionTypes
  {
    case ViewController
    case String
    case URL
    case NotFound
  }
  
  init(name : String)
  {
    self.name = name;
    self.details = [String : AnyObject]()
    self.backgroundImage = UIImage(named:"background.png")!
  }
  
  init(name : String, backgroundImage : UIImage)
  {
    self.name = name
    self.details = [String : AnyObject]()
    self.backgroundImage = backgroundImage
  }
  
  func addProfileElement(heading : String, description : String)
  {
    self.details[heading] = description
  }
  
  func addProfileElement(heading: String, url : URL)
  {
    self.details[heading] = url
  }
  
  func addProfileElement(heading : String, controller : UIViewController)
  {
    self.details[heading] = controller
  }
  
  func isValidUser() -> Bool
  {
    if details.count >= 3
    {
      return true
    }
    
    return false
  }
  
  func getType(heading : String) -> DescriptionTypes
  {
    var description: AnyObject? = self.details[heading]
    if description is String
    {
      return DescriptionTypes.String
    }
    else if description is URL
    {
      return DescriptionTypes.URL
    }
    else if description is UIViewController
    {
      return DescriptionTypes.ViewController
    }
    else
    {
      return DescriptionTypes.NotFound
    }
  }
  
  func getButtonCount() -> Int
  {
    return details.count
  }
 
  
}
