//
//  TechCrunch.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/19/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit
class SpecificHackathon : UIViewController
{
  var lastElementBottom : CGFloat = 64;
  
  let xMargin = 20
  let yMarginTop = 10
  let NAV_HEIGHT = 64
  let yMarginBottom = 475
  let SCREEN_HEIGHT = Int(UIScreen.mainScreen().bounds.height)
  let SCREEN_WIDTH = Int(UIScreen.mainScreen().bounds.width)
  
  
  

  
  func viewDidLoad(imageNamed : String, projectTitle : String, projectDescription : String) {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.whiteColor()
    addImage(imageNamed)
    addTitle(projectTitle)
    addDescription(projectDescription)
  }
  
  
  
  override func viewDidAppear(animated: Bool) {
    configureNavbar()
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  
  func addImage(name: String)
  {
    let image = UIImage(named: name)
    var imageView = UIImageView(image: image)
    
    let imageHeight = image?.size.height
    let imageWidth = image?.size.width
    let maxHeight = SCREEN_HEIGHT - yMarginTop - yMarginBottom - NAV_HEIGHT
    let maxWidth = SCREEN_WIDTH - xMargin * 2
    let heightWithMaxWidth = CGFloat(maxWidth) * (imageHeight! / imageWidth!)
    if (heightWithMaxWidth < CGFloat(maxHeight))
    {
      let x = (SCREEN_WIDTH - maxWidth) / 2
      imageView.frame = CGRectMake(CGFloat(x), CGFloat(yMarginTop + NAV_HEIGHT), CGFloat(maxWidth), heightWithMaxWidth)
      
    }
    else
    {
      let width = CGFloat(maxHeight) * (imageWidth! / imageHeight!)
      let x = (CGFloat(SCREEN_WIDTH) - width) / 2
      imageView.frame = CGRectMake(x, CGFloat(yMarginTop + NAV_HEIGHT), width, CGFloat(maxHeight))
    }
    lastElementBottom += imageView.frame.height;
    
    self.view.addSubview(imageView)
    
  }
  
  func addDescription(description: String)
  {
    let marginX : CGFloat = 15
    let marginY : CGFloat = 15
    var label = UILabel()
    label.font = UIFont(name: "AvenirNext-Regular", size: 15)
      
    label.numberOfLines = 0
    
    label.lineBreakMode = NSLineBreakMode.ByWordWrapping
    let y : CGFloat = lastElementBottom + marginY
    let width : CGFloat = CGFloat(SCREEN_WIDTH) - 2 * CGFloat(marginX)
    let height : CGFloat = CGFloat(SCREEN_HEIGHT) - (lastElementBottom + marginY)

    let yCoord = lastElementBottom + marginY
    label.frame = CGRectMake(marginX,yCoord,CGFloat(SCREEN_WIDTH) - 2 * marginX, CGFloat(SCREEN_HEIGHT) - lastElementBottom - marginY)


    label.text = description
    label.sizeToFit()

    
    self.view.addSubview(label)
    
  }
  
  func addLink(text : String, destination : String)
  {
    var label = UILabel()
   
  }
  
  
  func addTitle(text : String)
  {
    let marginY : CGFloat = 10
    let height : CGFloat = 20
    var label = UILabel()
    label.font = UIFont(name: "AvenirNext-Regular", size : 24)
    label.frame = CGRectMake(0, lastElementBottom + marginY, CGFloat(SCREEN_WIDTH), height)
    label.text = text
    label.textAlignment = NSTextAlignment.Center
    print(lastElementBottom)
    lastElementBottom += label.frame.height + marginY
    self.view.addSubview(label)
  }
  
  func configureNavbar()
  {
    var nav = self.navigationController?.navigationBar
    let currentUser: Profile = UserInfo.currentUser!
    nav?.topItem?.title = "Hackathon"
    nav?.barTintColor = UIColor(red : 192/255 ,green : 57/255 , blue : 43/255, alpha: 1.0)
    nav?.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-UltraLight", size: 25)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style:
      UIBarButtonItemStyle.Plain, target: nil, action: nil)
    nav?.tintColor = UIColor.whiteColor()
  }
  
  
  
  
}