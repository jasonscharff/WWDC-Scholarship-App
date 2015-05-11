//
//  AddStageOne.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/26/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit

class AddStageOne : UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
  var lastElementBottom : CGFloat = 79;
  
  var picker = UIImagePickerController()
  
  let intro = "I hope you've gotten a chance to explore a little about me. Now it's time to make your own profile with a similar look."
  
  let xMargin = 20
  let yMarginTop = 15
  let SCREEN_HEIGHT = Int(UIScreen.mainScreen().bounds.height)
  let SCREEN_WIDTH = Int(UIScreen.mainScreen().bounds.width)
  var profile = Profile()
  
  var navTitle = ""
  
  var bubbleTitle = ""

  override func viewDidLoad()
  {
    self.view.backgroundColor = UIColor.whiteColor()
    configureNavbar()
    addIntro(intro)
    addTitle("Please Choose a Title for the Navigation Bar")
    addTextField(0, placeHolderText: "Navigation Bar Title")
    addTitle("Now, Please Choose an Image You'd Like As a Header")
    addImageChooseButton()
    
  }
  override func viewDidAppear(animated: Bool) {
    configureNavbar()
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
  
  func addImageChooseButton()
  {
    var buttonCamera = UIButton()
    buttonCamera.setTitle("From Camera", forState: UIControlState.Normal)
    buttonCamera.titleLabel!.font = UIFont(name: "AvenirNext-Medium", size : 15)
    buttonCamera.setTitleColor(hexStringToUIColor("4A4A4a"), forState: UIControlState.Normal)
    buttonCamera.setTitleColor(UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 0.5), forState: UIControlState.Highlighted)
    buttonCamera.addTarget(self, action: "launchImageView:", forControlEvents: UIControlEvents.TouchDown)
    buttonCamera.frame = CGRectMake(CGFloat(xMargin), lastElementBottom + CGFloat(yMarginTop), CGFloat(SCREEN_WIDTH/2 - xMargin), 30)
    buttonCamera.tag = 0
    self.view.addSubview(buttonCamera)
    
    
    var buttonLibrary = UIButton()
    buttonLibrary.setTitle("From Library", forState: UIControlState.Normal)
    buttonLibrary.titleLabel!.font = UIFont(name: "AvenirNext-Medium", size : 15)
    buttonLibrary.setTitleColor(hexStringToUIColor("4A4A4a"), forState: UIControlState.Normal)
    buttonLibrary.setTitleColor(UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 0.5), forState: UIControlState.Highlighted)
    buttonLibrary.addTarget(self, action: "launchImageView:", forControlEvents: UIControlEvents.TouchDown)
    buttonLibrary.frame = CGRectMake(CGFloat(SCREEN_WIDTH / 2), lastElementBottom + CGFloat(yMarginTop), CGFloat(SCREEN_WIDTH/2 - xMargin), 30)
    buttonLibrary.tag = 1
    self.view.addSubview(buttonLibrary)
    
  }
  
  func launchImageView (sender : UIButton)
  {
    if (sender.tag == 0)
    {
      picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    }
    else
    {
      if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera))
      {
        picker.sourceType = UIImagePickerControllerSourceType.Camera
      }
      else
      {
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
      }
      
    }
    picker.allowsEditing = false
    picker.delegate = self
   
    self.presentViewController(picker, animated: true, completion: nil)
    
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!)
  {
    var controller = CustomViewObject()
    controller.setTheHeader(navTitle)
    let vc = AddStageTwo()
    vc.profile = profile
    vc.image = image
    vc.controller = controller
    vc.bubbleName = bubbleTitle
    picker.dismissViewControllerAnimated(false, completion:
      {
         self.navigationController?.pushViewController(vc, animated: true)
    })
    
   
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
    navTitle = textField.text
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    navTitle = textField.text
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
