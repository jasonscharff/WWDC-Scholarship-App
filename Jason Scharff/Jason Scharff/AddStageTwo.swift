//
//  AddStageTwo.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/26/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit
class AddStageTwo : UIViewController, UITextFieldDelegate, UITextViewDelegate
{
  var image : UIImage = UIImage()
  var controller = CustomViewObject()
  
  let xMargin = 20
  let yMarginTop = 15
  var lastElementBottom : CGFloat = 79;
  let SCREEN_HEIGHT = Int(UIScreen.mainScreen().bounds.height)
  let SCREEN_WIDTH = Int(UIScreen.mainScreen().bounds.width)
  
  var url = ""
  var headerTitle = ""
  var pageDescription = ""
  var bubbleName = ""
  
  var profile = Profile()
  
  override func viewDidLoad()
  {
    self.view.backgroundColor = UIColor.whiteColor()
    configureNavbar()
    addTitle("Where Would You Like That Image to Link To")
    addTextField(0, placeHolderText: "URL")
    addTitle("What Would you Like the Page's Header to Be")
    addTextField(1, placeHolderText: "Header")
    addTitle("And how about a nice description?")
    addTextView()
    addSaveButton()
    
  }
  override func viewDidAppear(animated: Bool) {
    configureNavbar()
  }
  
  func addTextView()
  {
    var field = UITextView()
    field.backgroundColor = hexStringToUIColor("E8E8E8")
    field.frame = CGRectMake(CGFloat(xMargin), lastElementBottom + CGFloat(yMarginTop), CGFloat(SCREEN_WIDTH -  2 * xMargin), CGFloat(SCREEN_HEIGHT) - lastElementBottom - CGFloat(yMarginTop) - 70)
    field.scrollEnabled = true
    field.returnKeyType = UIReturnKeyType.Done
    field.delegate = self
    field.layer.cornerRadius = 5
    self.view.addSubview(field)
    lastElementBottom += CGFloat(yMarginTop) + field.frame.height
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
  
  func addTitle(text : String)
  {
    let marginY : CGFloat = 10
    let height : CGFloat = 25
    var label = UILabel()
    label.font = UIFont(name: "AvenirNext-Medium", size : 18)
    label.frame = CGRectMake(CGFloat(xMargin), lastElementBottom + marginY, CGFloat(SCREEN_WIDTH - 2*xMargin), height)
    label.text = text
    label.textAlignment = NSTextAlignment.Left
    label.numberOfLines = 0
    label.sizeToFit()
    lastElementBottom += label.frame.height + marginY
    self.view.addSubview(label)
  }
  
  func addSaveButton()
  {
    var button = UIButton()
    button.setTitle("Save", forState: UIControlState.Normal)
    button.titleLabel!.font = UIFont(name: "AvenirNext-Medium", size : 18)
    button.setTitleColor(hexStringToUIColor("4a4a4a"), forState: UIControlState.Normal)
    button.frame = CGRectMake(0, lastElementBottom, CGFloat(SCREEN_WIDTH), CGFloat(SCREEN_HEIGHT) - lastElementBottom)
    button.addTarget(self, action: "save:", forControlEvents: UIControlEvents.TouchDown)
    
    self.view.addSubview(button)
    
  }
  
  func save (sender : UIButton)
  {
    controller.setTheImage(image)
    controller.setTheURL(url)
    controller.setTheHeaderTitle(headerTitle)
    controller.setTheDescription(pageDescription)
   
    profile.addProfileElement(bubbleName, object: controller)
    println(profile.getButtonCount())
    let vc = AddUser()
    vc.profile = profile
    navigationController?.pushViewController(vc, animated: true)
  }
  
  func addTextField(tag : Int, placeHolderText : String)
  {
    let rightMargin : CGFloat = 40
    let height : CGFloat = 25
    var field = UITextField()
    field.frame = CGRectMake(CGFloat(xMargin), lastElementBottom + CGFloat(yMarginTop), CGFloat(SCREEN_WIDTH - xMargin) - rightMargin, height)
    lastElementBottom += CGFloat(yMarginTop * 2) + height
    field.backgroundColor = hexStringToUIColor("#E8E8E8")
    field.layer.cornerRadius = 5.0
    field.tag = tag
    field.placeholder = placeHolderText
    field.delegate = self
    field.returnKeyType = UIReturnKeyType.Done
    field.borderStyle = UITextBorderStyle.RoundedRect
    self.view.addSubview(field)
    
  }
  
  
  func textFieldShouldReturn(textField: UITextField) -> Bool
  {
    if(textField.tag == 0)
    {
      url = textField.text
    }
    else
    {
      headerTitle = textField.text
    }
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    if(textField.tag == 0)
    {
      url = textField.text
    }
    else
    {
      headerTitle = textField.text
    }
  }
  
  
  func textViewDidChange(textView: UITextView) {
    if (textView.text.rangeOfString("\n") != nil)
    {
      pageDescription = textView.text
      textView.resignFirstResponder()
    }
    
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
  
  
  
}
