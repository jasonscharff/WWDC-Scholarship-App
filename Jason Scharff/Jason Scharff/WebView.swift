//
//  WebView.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/25/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit
class WebView :UIViewController
{
  var navText = ""
  var webPage = ""
  let NAV_HEIGHT : CGFloat = 64
  let SCREEN_WIDTH = UIScreen.mainScreen().bounds.width
  let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height
  
  override func viewDidLoad() {
    var webView = UIWebView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
    var url =  NSURL(string: webPage)
    var request = NSURLRequest(URL: url!)
    webView.loadRequest(request)
    self.view.addSubview(webView)
    self.view.backgroundColor = UIColor.whiteColor()
      configureNavbar()
  }
  

  
  
  override func viewDidAppear(animated: Bool) {
    configureNavbar()
  }
  
  func configureNavbar()
  {
    var nav = UINavigationController().navigationBar
    let currentUser: Profile = UserInfo.currentUser!
    nav.topItem?.title = navText
    nav.barTintColor = UIColor(red : 192/255 ,green : 57/255 , blue : 43/255, alpha: 1.0)
    nav.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-UltraLight", size: 25)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
    
    nav.tintColor = UIColor.whiteColor()
  }
  
  
  
}
