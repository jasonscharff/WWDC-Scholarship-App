//
//  ViewController.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/14/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import UIKit



extension Array
{
  mutating func shuffle()
  {
    for _ in 0..<10
    {
      sort { (_,_) in arc4random() < arc4random() }
    }
  }
}



class ViewController: UIViewController {
  var buttons = [CircleButton]()
  var Colors = [UIColor]()
  let RADIUS_MULTIPLIER : Double = 3/8
  let SCREEN_WIDTH : Int = Int(UIScreen.mainScreen().bounds.width)
  let SCREEN_HEIGHT : Int = Int(UIScreen.mainScreen().bounds.height)
  let TOP_BAR_HEIGHT = 64
  let MAX_OFFSET_RATIO : Double = 1/6
  let MIN_OFFSET : Int = 15
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.whiteColor()
    Colors = getColors()
    addButtons()
  }
  override func viewDidAppear(animated: Bool) {
    configureNavbar()
  }


  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func configureNavbar()
  {
    var nav = self.navigationController?.navigationBar
    let currentUser: Profile = UserInfo.currentUser!
    nav?.topItem?.title = currentUser.name
    nav?.barTintColor = UIColor(red : 192/255 ,green : 57/255 , blue : 43/255, alpha: 1.0)
    nav?.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-UltraLight", size: 25)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
    nav?.tintColor = UIColor.whiteColor()
  }
  
  func addButtons()
  {
    let currentUser: Profile = UserInfo.currentUser!
    let radius = Int(RADIUS_MULTIPLIER * Double(SCREEN_WIDTH))
    let margin : Double = 30.0
    let yDistance = (Double(SCREEN_HEIGHT) - Double(TOP_BAR_HEIGHT) - 2 * margin - Double(radius) / 3) / Double(currentUser.getButtonCount())
    let maxOffset : Int = Int(MAX_OFFSET_RATIO * Double(SCREEN_WIDTH))
    
    if currentUser.isValidUser()
    {
      var i = 0
      var currentY : Double = Double(TOP_BAR_HEIGHT) + margin
      for header in currentUser.details.keys
      {
        var offSet = Int(arc4random_uniform(UInt32(maxOffset - MIN_OFFSET)))
        offSet += MIN_OFFSET
        var c = Colors[i]
        if (i % 2 == 0)
        {
          var frame : CGRect = CGRectMake(CGFloat(offSet),CGFloat(currentY), CGFloat(radius), CGFloat(radius))
          var button = CircleButton(frame: frame, color: Colors[i], label : String(stringInterpolationSegment: header))
          if (currentUser.getType(header) == Profile.DescriptionTypes.ViewController)
          {
            button.addTarget(self, action: "goToViewController:", forControlEvents: .TouchUpInside)
          }
          
          self.view.addSubview(button)
        }
        else
        {
          var frame : CGRect = CGRectMake(CGFloat(SCREEN_WIDTH - offSet - radius),CGFloat(currentY), CGFloat(radius), CGFloat(radius))
          var button = CircleButton(frame: frame, color: Colors[i], label : String(stringInterpolationSegment: header))
          if (currentUser.getType(header) == Profile.DescriptionTypes.ViewController)
          {
            button.addTarget(self, action: "goToViewController:", forControlEvents: .TouchUpInside)
          }
          
          
          self.view.addSubview(button)
        }
        
        currentY += yDistance
        i++
      }
    }
  }
  
  func getColors() -> [UIColor]
  {
    var Colors = [UIColor]()
    Colors.append(hexStringToUIColor("#D2527F")) //Cabaret
    Colors.append(hexStringToUIColor("#BE90D4")) //Light Wisteria
    Colors.append(hexStringToUIColor("#52B3D9")) //Shakespeare
    Colors.append(hexStringToUIColor("#00B16A")) //Jade
    Colors.append(hexStringToUIColor("#F2784B")) //Crusta
    Colors.shuffle()
    return Colors
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
  
  
  func goToViewController(sender: UIButton!)
  {
    var vc = Hackathon()
    navigationController?.pushViewController(vc, animated: true)
  
  }
  



}

