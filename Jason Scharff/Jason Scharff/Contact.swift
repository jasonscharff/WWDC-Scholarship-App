//
//  Contact.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/19/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class Contact : UIViewController, MFMailComposeViewControllerDelegate
{
  var lastElementBottom : CGFloat = 79;
  
  let intro = "Like any modern teenager, I have a pretty massive online presence. I've select a couple ways to learn more about me or contact me."
  
  let xMargin = 20
  let yMarginTop = 15
  let midSpace = 60
  let SCREEN_HEIGHT = Int(UIScreen.mainScreen().bounds.height)
  let SCREEN_WIDTH = Int(UIScreen.mainScreen().bounds.width)
  
  override func viewDidLoad() {
    self.view.backgroundColor = UIColor.whiteColor()
    addTitle("Contact Info")
    addDescription(intro)
    addLinkedin()
    addGithub()
    addEmail()
    addPhone()
  }
  
  override func viewDidAppear(animated: Bool) {
    configureNavbar()
  }
  
  func goToGithub (sender : UITapGestureRecognizer)
  {
    var vc = WebView()
    vc.webPage = "https://github.com/jasonscharff"
    vc.title = "Github"
    navigationController?.pushViewController(vc, animated: true)
  }
  
  func goToLinkedin (sender : UITapGestureRecognizer)
  {
    var vc = WebView()
    vc.webPage = "https://www.linkedin.com/in/jasonscharff"
    vc.title = "Linkedin"
    navigationController?.pushViewController(vc, animated: true)
  }
  
  func emailClicked (sender : UITapGestureRecognizer)
  {
    var picker = MFMailComposeViewController()
    picker.mailComposeDelegate = self
    picker.setToRecipients(["jasonscharff@gmail.com"])
    presentViewController(picker, animated: true, completion: nil)
  }
  
  func phoneClicked (sender : UITapGestureRecognizer)
  {
    var url = NSURL(string: "tel://6502136962")
    UIApplication.sharedApplication().openURL(url!)
  }
  
  
  func addPhone()
  {
    let marginY = 50
    var imageView = UIImageView()
    var image = UIImage(named:"phone.png")
    imageView.image = image
    let imageWidth = image?.size.width
    let imageHeight = image?.size.height
    let y = lastElementBottom + CGFloat(marginY)
    let width = (SCREEN_WIDTH - 2 * xMargin - midSpace) / 2
    let x = xMargin + midSpace + width
    let height = CGFloat(width) * (imageHeight! / imageWidth!)
    println(height)
    imageView.frame = CGRectMake(CGFloat(x), y, CGFloat(width), height)
    
    var tapGesture = UITapGestureRecognizer(target: self, action: "phoneClicked:")
    imageView.userInteractionEnabled = true
    imageView.addGestureRecognizer(tapGesture)
    
    self.view.addSubview(imageView)
    
    lastElementBottom += height + CGFloat(marginY)

  }
  
  func addLinkedin()
  {
    let marginY = 50
    var imageView = UIImageView()
    var image = UIImage(named:"Linkedin.png")
    imageView.image = image
    let imageWidth = image?.size.width
    let imageHeight = image?.size.height
    let y = lastElementBottom + CGFloat(marginY)
    let width = (SCREEN_WIDTH - xMargin - midSpace) / 2
    let height = CGFloat(width) * (imageHeight! / imageWidth!)
    
    imageView.frame = CGRectMake(CGFloat(xMargin), y, CGFloat(width), height)
    
    var tapGesture = UITapGestureRecognizer(target: self, action: "goToLinkedin:")
    imageView.userInteractionEnabled = true
    imageView.addGestureRecognizer(tapGesture)
    
    self.view.addSubview(imageView)
  }
  
  func addEmail()
  {
    let marginY = 50
    var imageView = UIImageView()
    var image = UIImage(named:"mail.png")
    imageView.image = image
    let imageWidth = image?.size.width
    let imageHeight = image?.size.height
    let y = lastElementBottom + CGFloat(marginY)
    let width = (SCREEN_WIDTH - 2 * xMargin - midSpace) / 2
    let height = CGFloat(width) * (imageHeight! / imageWidth!)
    imageView.frame = CGRectMake(CGFloat(xMargin), y, CGFloat(width), height)
    
    var tapGesture = UITapGestureRecognizer(target: self, action: "emailClicked:")
    imageView.userInteractionEnabled = true
    imageView.addGestureRecognizer(tapGesture)
    
    self.view.addSubview(imageView)
    

  }
  
  func addGithub()
  {
    let marginY = 50
    var imageView = UIImageView()
    var image = UIImage(named:"github.jpg")
    imageView.image = image
    let imageWidth = image?.size.width
    let imageHeight = image?.size.height
    let y = (lastElementBottom + CGFloat(marginY))
    let width = (CGFloat(SCREEN_WIDTH - 2 * xMargin - midSpace) / 2.0)
    let x = CGFloat(xMargin) + CGFloat(midSpace) + width
    let height = CGFloat(width) * (imageHeight! / imageWidth!)
    
    imageView.frame = CGRectMake(CGFloat(x), y, CGFloat(width), height)
    
    var tapGesture = UITapGestureRecognizer(target: self, action: "goToGithub:")
    imageView.userInteractionEnabled = true
    imageView.addGestureRecognizer(tapGesture)
    
    self.view.addSubview(imageView)

    lastElementBottom += height + CGFloat(marginY)
    
  }
  
  func addTitle(text : String)
  {
    let marginY : CGFloat = 20
    let height : CGFloat = 27
    var label = UILabel()
    label.font = UIFont(name: "AvenirNext-Regular", size : 24)
    label.frame = CGRectMake(0, lastElementBottom + marginY, CGFloat(SCREEN_WIDTH), height)
    label.text = text
    label.textAlignment = NSTextAlignment.Center
    print(lastElementBottom)
    lastElementBottom += label.frame.height + marginY
    self.view.addSubview(label)
  }
  
  func addDescription(description: String)
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
    
    
    label.text = description
    label.sizeToFit()
    self.view.addSubview(label)
    
    
    lastElementBottom += marginY + label.frame.size.height
    
    
  }
  
  func configureNavbar()
  {
    var nav = self.navigationController?.navigationBar
    nav?.topItem?.title = "Contact"
    nav?.barTintColor = UIColor(red : 192/255 ,green : 57/255 , blue : 43/255, alpha: 1.0)
    nav?.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-UltraLight", size: 25)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
    nav?.tintColor = UIColor.whiteColor()
  }
  
  
  func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
 
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    
    return true
  }
  
  
  
  
}