//
//  CreateBubble.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/26/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit
class AddUser : UIViewController, UITextFieldDelegate
{
  var lastElementBottom : CGFloat = 64;
  
  let xMargin = 20
  let yMarginTop = 10
  let NAV_HEIGHT = 64
  let yMarginBottom = 475
  let SCREEN_HEIGHT = Int(UIScreen.mainScreen().bounds.height)
  let SCREEN_WIDTH = Int(UIScreen.mainScreen().bounds.width)
  let intro = "As you hopefully saw in the example, a profile consists of distinct views. In order to create your own, you must add somewhere between 3 and 5 views or \"bubbles\". A bubble can either be a website or a series of elements composed in a certain fashion such as in the example."
  
  var profile = Profile()
  var name = ""
  var bubbleTitle = ""
  

  
  
  override func viewDidLoad() {
    self.view.backgroundColor = UIColor.whiteColor()
    configureNavbar()
    addTitle("Enter This User's Name")
    addTextField(0, placeHolderText: "John Smith")
    addIntro(intro)
    addTitle("Add Bubble")
    addTextField(1, placeHolderText: "Bubble Name")
    addButtons()
    addSaveButton()
  }
  
  override func viewDidAppear(animated: Bool) {
    configureNavbar()
  }
  
  
  func addButtons()
  {
    var fromURL = UIButton()
    fromURL.setTitle("From a URL", forState: UIControlState.Normal)
    fromURL.titleLabel!.font = UIFont(name: "AvenirNext-Medium", size : 15)
    fromURL.setTitleColor(hexStringToUIColor("4A4A4a"), forState: UIControlState.Normal)
    fromURL.setTitleColor(UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 0.5), forState: UIControlState.Highlighted)
    fromURL.addTarget(self, action: "goToURLView:", forControlEvents: UIControlEvents.TouchDown)
    fromURL.frame = CGRectMake(CGFloat(xMargin), lastElementBottom + CGFloat(yMarginTop), CGFloat(SCREEN_WIDTH/2 - xMargin), 30)
    fromURL.tag = 0
    self.view.addSubview(fromURL)
    
    
    var fromView = UIButton()
    fromView.setTitle("From a View", forState: UIControlState.Normal)
    fromView.titleLabel!.font = UIFont(name: "AvenirNext-Medium", size : 15)
    fromView.setTitleColor(hexStringToUIColor("4A4A4a"), forState: UIControlState.Normal)
    fromView.setTitleColor(UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 0.5), forState: UIControlState.Highlighted)
    fromView.addTarget(self, action: "goToViewBuilder:", forControlEvents: UIControlEvents.TouchDown)
    fromView.frame = CGRectMake(CGFloat(SCREEN_WIDTH / 2), lastElementBottom + CGFloat(yMarginTop), CGFloat(SCREEN_WIDTH/2 - xMargin), 30)
    fromView.tag = 1
    self.view.addSubview(fromView)

  }
  
  func goToViewBuilder (sender : UIButton)
  {
    if(bubbleTitle != "")
    {
      let vc = AddStageOne()
      vc.profile = profile
      vc.bubbleTitle = bubbleTitle
      navigationController?.pushViewController(vc, animated: true)
    }
    else
    {
      var alert = UIAlertController(title: "Please Enter a Bubble Title", message:nil, preferredStyle: UIAlertControllerStyle.Alert)
      alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
      self.presentViewController(alert, animated: true, completion: nil)
    }
    
  }
  
  func goToUrlView (sender : UIButton)
  {
    
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
    self.view.addSubview(label)
  }

  func addIntro(intro: String)
  {
    let marginX : CGFloat = 15
    let marginY : CGFloat = 12
    var label = UILabel()
    label.font = UIFont(name: "AvenirNext-Italic", size: 15)
    
    label.numberOfLines = 0
    
    label.lineBreakMode = NSLineBreakMode.ByWordWrapping
    let y : CGFloat = lastElementBottom + marginY
    let width : CGFloat = CGFloat(SCREEN_WIDTH) - 2 * CGFloat(marginX)
    let height : CGFloat = CGFloat(SCREEN_HEIGHT) - (lastElementBottom + marginY)
    
    let yCoord = lastElementBottom + marginY
    var frame = CGRectMake(marginX,yCoord,CGFloat(SCREEN_WIDTH) - 2 * marginX, CGFloat(SCREEN_HEIGHT) - lastElementBottom - marginY)
    label.frame = frame
    
    
    label.text = intro
    label.sizeToFit()
    self.view.addSubview(label)
    
    
    lastElementBottom += marginY + label.frame.size.height
    
  }
  
  func addTextField(tag : Int, placeHolderText : String)
  {

    let height : CGFloat = 25
    var field = UITextField()
    field.frame = CGRectMake(CGFloat(xMargin), lastElementBottom + CGFloat(yMarginTop), CGFloat(SCREEN_WIDTH - xMargin * 2), height)
    lastElementBottom += CGFloat(yMarginTop * 2) + height
    field.backgroundColor = hexStringToUIColor("#E8E8E8")
    field.layer.cornerRadius = 5.0
    field.tag = tag
    field.placeholder = placeHolderText
    field.delegate = self
    field.returnKeyType = UIReturnKeyType.Done
    field.borderStyle = UITextBorderStyle.RoundedRect
    if (tag == 0 && profile.name != "")
    {
      field.text = profile.name
      field.enabled = false
    }
    self.view.addSubview(field)
    
  }
  
  func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
    
    if (cString.hasPrefix("#")) {
      cString = cString.substringFromIndex(advance(cString.startIndex, 1))
    }
    
    if (count(cString) != 6) {
      return UIColor.grayColor()
    }
    
    var rgbValue:UInt32 = 0
    NSScanner(string: cString).scanHexInt(&rgbValue)
    
    return UIColor(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
    )
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool
  {
    if(textField.tag == 0)
    {
      name = textField.text
      profile.addName(name)
    }
    else
    {
      bubbleTitle = textField.text
    }
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    if(textField.tag == 0)
    {
      name = textField.text
      profile.addName(name)
    }
    else
    {
      bubbleTitle = textField.text
    }
  }
  
  func configureNavbar()
  {
    var nav = self.navigationController?.navigationBar
    let currentUser: Profile = UserInfo.currentUser!
    nav?.topItem?.title = "Add"
    nav?.barTintColor = UIColor(red : 192/255 ,green : 57/255 , blue : 43/255, alpha: 1.0)
    nav?.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-UltraLight", size: 25)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
    nav?.tintColor = UIColor.whiteColor()
  }
  
  func addSaveButton()
  {
    var button = UIButton()
    button.frame = CGRectMake(0, lastElementBottom + CGFloat(6 * yMarginTop), CGFloat(SCREEN_WIDTH), 50)
    button.addTarget(self, action: "save:", forControlEvents: UIControlEvents.TouchDown)
    button.setTitle("Save", forState: UIControlState.Normal)
    button.titleLabel!.font = UIFont(name: "AvenirNext-Medium", size : 18)
    button.setTitleColor(hexStringToUIColor("4a4a4a"), forState: UIControlState.Normal)
    self.view.addSubview(button)
  }
  
  func save (sender : UIButton)
  {
    if (profile.getButtonCount() >= 3 && profile.getButtonCount() <= 5)
    {
      let defaults = NSUserDefaults.standardUserDefaults()
      var nsarray  = defaults.objectForKey("profiles") as? NSArray
      var array = nsarray! as Array
      var data = NSKeyedArchiver.archivedDataWithRootObject(profile)
      array.append(data)
      defaults.setObject(array, forKey: "profiles")
      defaults.synchronize()
      let vc = UserView()
      navigationController?.pushViewController(vc, animated: true)
      
    }
    else
    {
      print(profile.getButtonCount())
      var alert = UIAlertController(title: "Please Add at Least Three Bubbles", message:nil, preferredStyle: UIAlertControllerStyle.Alert)
      alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
      self.presentViewController(alert, animated: true, completion: nil)
    }
  }
  
  
  
}
