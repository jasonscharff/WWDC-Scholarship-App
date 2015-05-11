//
//  Profile.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/15/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit

class Profile : NSObject, NSCoding
{
  var name : String
  var details : [String : AnyObject]
  
  enum DescriptionTypes
  {
    case ViewController
    case String
    case URL
    case NotFound
  }
  
  override init()
  {
    self.name = ""
    self.details = [String : AnyObject]()
  }
  init(name : String)
  {
    self.name = name;
    self.details = [String : AnyObject]()
  }
  
  required init(coder aDecoder: NSCoder)
  {
    self.name =  aDecoder.decodeObjectForKey("name") as! String!
    self.details = aDecoder.decodeObjectForKey("details") as! Dictionary
  }
  
  func encodeWithCoder(aCoder: NSCoder)
  {
    aCoder.encodeObject(name, forKey: "name")
    aCoder.encodeObject(details, forKey: "details")
  }
  
  func addName(name : String)
  {
    self.name = name
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
  
  func addProfileElement (heading : String, object : CustomViewObject)
  {
    self.details[heading] = object
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
    else if description is UIViewController || description is CustomViewObject
    {
      return DescriptionTypes.ViewController
    }
    else
    {
      return DescriptionTypes.NotFound
    }
  }
  
  func getController(heading : String) -> UIViewController
  {
    var description: AnyObject? = self.details[heading]
    if (description is CustomViewObject)
    {
      var custom = description as! CustomViewObject
      var controller = UserAddedView()
      controller.header = custom.header
      var image = custom.image
      println(image.size.width)
      controller.addImage(image, website: custom.url, websiteTitle: heading)
      controller.addTitle(custom.headerTitle)
      controller.addDescription(custom.pageDescription)
      return controller
    }
    else if description is UIViewController
    {
      let vc = description as! UIViewController
      return vc
    }
    
    return UIViewController()
  }
  
  func getButtonCount() -> Int
  {
    return details.count
  }
 
  
}
