//
//  Link.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/25/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit

class Link : UILabel
{
  var url = ""
  var title = ""
  var delegate: LinkDelegate! = nil
  override init(frame: CGRect) {
    super.init(frame: frame)
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "goToWebView:")
    self.addGestureRecognizer(tapGestureRecognizer)
    self.userInteractionEnabled = true
  }

  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  

  
  func setLink(text : String, link : String, font : UIFont)
  {
    let attributedString = NSMutableAttributedString(string: text, attributes: [NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue])
    attributedString.addAttribute(NSFontAttributeName, value: font, range: NSMakeRange(0, attributedString.length))
    self.attributedText = attributedString
    url = link
  }
  
    func goToWebView (sender : UITapGestureRecognizer)
    {
      delegate?.linkPressed(url, title: title)
    }
  
}

protocol LinkDelegate
{
  func linkPressed(url : String, title : String)
}




