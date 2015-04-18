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
  
  init(frame: CGRect, color: UIColor)
  {
    super.init(frame:frame)
    self.layer.cornerRadius = 0.5 * self.bounds.size.width
    self.backgroundColor = color
  }

  required init(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
  }
 
 }
