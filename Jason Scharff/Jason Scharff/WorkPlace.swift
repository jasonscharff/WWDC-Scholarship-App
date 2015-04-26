//
//  WorkPlace.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/25/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

//
//  TechCrunch.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/19/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import MediaPlayer

class WorkPlace : UIViewController, UIScrollViewDelegate, LinkDelegate
{
  var lastElementBottom : CGFloat = 64;
  
  var videoPlayer : VideoPlayer = VideoPlayer()
  
  let xMargin = 20
  let yMarginTop = 10
  let NAV_HEIGHT = 64
  let yMarginBottom = 475
  let SCREEN_HEIGHT = Int(UIScreen.mainScreen().bounds.height)
  let SCREEN_WIDTH = Int(UIScreen.mainScreen().bounds.width)
  var scrollView = UIScrollView()
  var link = ""
  var webTitle = ""
  var header = ""
  
  func viewDidLoad(imageNamed : String, link : String, webTitle : String, jobTitle : String, companyDescription : String, header: String) {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.whiteColor()
    addImage(imageNamed)
    addTitle(jobTitle)
    scrollView.frame = CGRectMake(0, 0, CGFloat(SCREEN_WIDTH), CGFloat(SCREEN_HEIGHT))
    scrollView.delegate = self
    scrollView.scrollEnabled = true
    self.view.addSubview(scrollView)
    self.link = link
    self.webTitle = webTitle
    self.header = header
    addDescription(companyDescription)
    
    
    
  }
  
  
  
  override func viewDidAppear(animated: Bool) {
    configureNavbar()
    delay(0.7)
      {
        self.videoPlayer.play()
    }
  }
  
  func delay(delay:Double, closure:()->()) {
    dispatch_after(
      dispatch_time(
        DISPATCH_TIME_NOW,
        Int64(delay * Double(NSEC_PER_SEC))
      ),
      dispatch_get_main_queue(), closure)
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func goToWebsite (sender : UITapGestureRecognizer)
  {
    var vc = WebView()
    vc.webPage = link
    vc.title = webTitle
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
      imageView.frame = CGRectMake(CGFloat(x), CGFloat(yMarginTop + NAV_HEIGHT), CGFloat(maxWidth), heightWithMaxWidth)
      
    }
    else
    {
      let width = CGFloat(maxHeight) * (imageWidth! / imageHeight!)
      let x = (CGFloat(SCREEN_WIDTH) - width) / 2
      imageView.frame = CGRectMake(x, CGFloat(yMarginTop + NAV_HEIGHT), width, CGFloat(maxHeight))
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
  
  func addLink(text : String, destination : String, title : String)
  {
    var label = Link()
    let yMargin = 35
    label.title = title
    var font = UIFont(name: "AvenirNext-Regular", size: 15)
    label.setLink(text, link: destination, font: font!)
    let height : CGFloat = 20
    label.frame = CGRectMake(CGFloat(xMargin), lastElementBottom + CGFloat(yMargin), CGFloat(SCREEN_WIDTH) - 2 * CGFloat(xMargin), height)
    label.delegate = self;
    
    let x_scroll : CGFloat = self.scrollView.frame.minX
    let y_scroll : CGFloat = self.scrollView.frame.minY
    let width_scroll : CGFloat = self.scrollView.contentSize.width
    let height_scroll : CGFloat = self.scrollView.contentSize.height + CGFloat(yMargin) + height
    scrollView.contentSize = CGSizeMake(width_scroll, height_scroll)
    
    scrollView.addSubview(label)
    
    lastElementBottom += height + CGFloat(yMarginTop)
    
    
  }
  
  func linkPressed(url: String, title : String) {
    var vc = WebView()
    vc.webPage = url
    vc.title = title
    navigationController?.pushViewController(vc, animated: true)
  }
  
  func addVideo(name : String, type: String, height: CGFloat, width : CGFloat)
  {
    let marginX = 28
    var loc = NSBundle.mainBundle().pathForResource(name, ofType: type)
    videoPlayer =  VideoPlayer(contentURL: NSURL(fileURLWithPath: loc!))
    let width : CGFloat = CGFloat(SCREEN_WIDTH - marginX * 2)
    let height = width * (height/width) / 2
    videoPlayer.view.frame = CGRectMake(CGFloat(marginX), lastElementBottom + CGFloat(yMarginTop), width, height)
    
    let x_scroll : CGFloat = self.scrollView.frame.minX
    let y_scroll : CGFloat = self.scrollView.frame.minY
    let width_scroll : CGFloat = self.scrollView.contentSize.width
    let height_scroll : CGFloat = self.scrollView.contentSize.height + CGFloat(yMarginTop) + height
    scrollView.contentSize = CGSizeMake(width_scroll, height_scroll + 30)
    
    scrollView.addSubview(videoPlayer.view)
    
    lastElementBottom += CGFloat(yMarginTop) + height
  }
  
  
  func addTitle(text : String)
  {
    let marginY : CGFloat = 20
    let height : CGFloat = 27
    var label = UILabel()
    label.font = UIFont(name: "AvenirNext-Regular", size : 20)
    label.frame = CGRectMake(0, lastElementBottom + marginY, CGFloat(SCREEN_WIDTH), height)
    label.text = text
    label.textAlignment = NSTextAlignment.Center
    print(lastElementBottom)
    lastElementBottom += label.frame.height + marginY
    scrollView.addSubview(label)
  }
  
  func configureNavbar()
  {
    var nav = self.navigationController?.navigationBar
    let currentUser: Profile = UserInfo.currentUser!
    nav?.topItem?.title = header
    nav?.barTintColor = UIColor(red : 192/255 ,green : 57/255 , blue : 43/255, alpha: 1.0)
    nav?.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-UltraLight", size: 25)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style:
      UIBarButtonItemStyle.Plain, target: nil, action: nil)
    nav?.tintColor = UIColor.whiteColor()
  }
  
  
  
  
}