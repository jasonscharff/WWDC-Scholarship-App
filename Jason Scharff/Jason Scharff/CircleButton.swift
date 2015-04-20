//
//  CircleButton.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/17/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit

class CircleButton : UIButton
{
  override init(frame: CGRect)
  {
    super.init(frame: frame)
    self.layer.cornerRadius = 0.5 * self.bounds.size.width
  }
  
  init(frame: CGRect, color: UIColor, label : String)
  {
    super.init(frame:frame)
    self.layer.cornerRadius = 0.5 * self.bounds.size.width
    self.backgroundColor = color
    self.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
    self.titleLabel?.numberOfLines = 3
    self.titleLabel?.textAlignment = NSTextAlignment.Center
    self.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: CGFloat(20))
    self.setTitle(label, forState: UIControlState.Normal)
  }
  

  required init(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
  }
 
 }
