//
//  TechCrunch.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/19/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit


class Education : UIViewController, UIScrollViewDelegate
{
  var lastElementBottom : CGFloat = 15;
  
  let xMargin = 20
  let yMarginTop = 15
  let NAV_HEIGHT = 64
   let yMarginBottom = 475
  let SCREEN_HEIGHT = Int(UIScreen.mainScreen().bounds.height)
  let SCREEN_WIDTH = Int(UIScreen.mainScreen().bounds.width)
  var scrollView = UIScrollView()
  let intro = "I'm currently a sophomore at Menlo School in Atherton, CA."
  let coursework = "• AP Computer Science AB\n• Advanced Topics in Computer Science\n• Honors Math (Geometry and Algebra II)\n• Honors Chemistry"
  let activitiesString = "• Robotics, Team Captain\n• Student Genius Bar\n• Theatre Tech, Lighting"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.whiteColor()
    scrollView.frame = CGRectMake(0, 0, CGFloat(SCREEN_WIDTH), CGFloat(SCREEN_HEIGHT))
    scrollView.delegate = self
    scrollView.scrollEnabled = true
    self.view.addSubview(scrollView)
    addImage("menlo_logo.jpg")
    addDescription(intro)
    addTitle("Relavant Course Work")
    addDescription(coursework)
    addTitle("Activities")
    addDescription(activitiesString)
    
  }
  
  
  override func viewDidAppear(animated: Bool) {
    configureNavbar()
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func goToWebsite (sender : UITapGestureRecognizer)
  {
    var vc = WebView()
    vc.webPage = "http://menloschool.org"
    vc.title = "Menlo School"
    navigationController?.pushViewController(vc, animated: true)
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
      imageView.frame = CGRectMake(CGFloat(x), CGFloat(yMarginTop), CGFloat(maxWidth), heightWithMaxWidth)
      
    }
    else
    {
      let width = CGFloat(maxHeight) * (imageWidth! / imageHeight!)
      let x = (CGFloat(SCREEN_WIDTH) - width) / 2
      imageView.frame = CGRectMake(x, CGFloat(yMarginTop), width, CGFloat(maxHeight))
    }
    lastElementBottom += imageView.frame.height;
    
    let tapRecognizer = UITapGestureRecognizer(target: self, action: "goToWebsite:")
    imageView.addGestureRecognizer(tapRecognizer)
    imageView.userInteractionEnabled = true
    scrollView.addSubview(imageView)
  }
  
  func addDescription(description: String)
  {
    let marginX : CGFloat = 15
    let marginY : CGFloat = 12
    var label = UILabel()
    label.font = UIFont(name: "AvenirNext-Regular", size: 15)
    
    label.numberOfLines = 0
    
    label.lineBreakMode = NSLineBreakMode.ByWordWrapping
    let y : CGFloat = lastElementBottom + marginY
    let width : CGFloat = CGFloat(SCREEN_WIDTH) - 2 * CGFloat(marginX)
    let height : CGFloat = CGFloat(SCREEN_HEIGHT) - (lastElementBottom + marginY)
    
    let yCoord = lastElementBottom + marginY
    var frame = CGRectMake(marginX,yCoord,CGFloat(SCREEN_WIDTH) - 2 * marginX, CGFloat(SCREEN_HEIGHT) - lastElementBottom - marginY)
    label.frame = frame
    
    
    label.text = description
    label.sizeToFit()
    scrollView.addSubview(label)
    
    
    lastElementBottom += marginY + label.frame.size.height
    
    let x_scroll : CGFloat = self.scrollView.frame.minX
    let y_scroll : CGFloat = self.scrollView.frame.minY
    let width_scroll : CGFloat = self.scrollView.frame.width
    let height_scroll : CGFloat = lastElementBottom + 30
    scrollView.contentSize = CGSizeMake(width_scroll, height_scroll)
    
  }
  
  
  
  func addTitle(text : String)
  {
    let marginY : CGFloat = 10
    let height : CGFloat = 25
    let marginX = 15
    var label = UILabel()
    label.font = UIFont(name: "AvenirNext-Medium", size : 18)
    label.frame = CGRectMake(CGFloat(marginX), lastElementBottom + marginY, CGFloat(SCREEN_WIDTH - 2*marginX), height)
    label.text = text
    label.textAlignment = NSTextAlignment.Left
    print(lastElementBottom)
    lastElementBottom += label.frame.height + marginY
    scrollView.addSubview(label)
  }
  
  func configureNavbar()
  {
    var nav = self.navigationController?.navigationBar
    let currentUser: Profile = UserInfo.currentUser!
    nav?.topItem?.title = "Education"
    nav?.barTintColor = UIColor(red : 192/255 ,green : 57/255 , blue : 43/255, alpha: 1.0)
    nav?.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-UltraLight", size: 25)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style:
      UIBarButtonItemStyle.Plain, target: nil, action: nil)
    nav?.tintColor = UIColor.whiteColor()
  }
  
  
  
  
}