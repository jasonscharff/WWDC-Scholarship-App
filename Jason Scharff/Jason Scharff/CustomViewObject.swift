//
//  CustomViewObject.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/26/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation

class CustomViewObject : NSObject, NSCoding
{
  var header = ""
  var image = UIImage()
  var url = ""
  var headerTitle = ""
  var pageDescription = ""
  
  override init()
  {
   super.init()
  }
  
  func setTheHeader(header : String)
  {
    self.header = header
  }
  
  func setTheImage(image : UIImage)
  {
   self.image = image
  }
  
  func setTheURL(url : String)
  {
    self.url = url
  }
  
  func setTheHeaderTitle(header : String)
  {
    self.headerTitle = header
  }
  
  func setTheDescription(theDescription : String)
  {
    self.pageDescription = theDescription
  }
  
  required init(coder aDecoder: NSCoder)
  {
    self.header =  aDecoder.decodeObjectForKey("header") as! String!
    var data = aDecoder.decodeObjectForKey("image") as! NSData
    self.image = UIImage(data: data)!
    self.url =  aDecoder.decodeObjectForKey("url") as! String!
    self.headerTitle =  aDecoder.decodeObjectForKey("headerTitle") as! String!
    self.pageDescription =  aDecoder.decodeObjectForKey("pageDescription") as! String!
  }
  
  func encodeWithCoder(aCoder: NSCoder)
  {
    aCoder.encodeObject(header, forKey: "header")
    aCoder.encodeObject(headerTitle, forKey: "headerTitle")
    aCoder.encodeObject(url, forKey: "url")
    aCoder.encodeObject(pageDescription, forKey: "pageDescription")
    var data = UIImageJPEGRepresentation(image, 1.0)
    aCoder.encodeObject(data, forKey: "image")
  }

  

}