//
//  TechCrunch.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/19/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit
class TechCrunch : UIViewController
{
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.whiteColor()
    addImage()
  }
  
  override func viewDidAppear(animated: Bool) {
     configureNavbar()
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func addImage()
  {
    var imageView = UIImageView(image: UIImage(named: "techcrunch.png"))
//    var constraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: topLayoutGuide, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 89)
//    self.view.addConstraint(constraint)
   
    self.view.addSubview(imageView)
    
  }
  
  func addDescription()
  {
    
  }
  
  func configureNavbar()
  {
    println("HERE")
    var nav = self.navigationController?.navigationBar
    let currentUser: Profile = UserInfo.currentUser!
    nav?.topItem?.title = "Hackathon"
    nav?.barTintColor = UIColor(red : 192/255 ,green : 57/255 , blue : 43/255, alpha: 1.0)
    nav?.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-UltraLight", size: 25)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
//    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style:
//      UIBarButtonItemStyle.Plain, target: nil, action: nil)
//    nav?.tintColor = UIColor.whiteColor()
  }
  
  
  
  
}