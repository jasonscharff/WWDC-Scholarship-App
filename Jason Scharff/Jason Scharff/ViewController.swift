//
//  ViewController.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/14/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
  var buttons = [DetailButton]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureNavbar()
    
    // Do any additional setup after loading the view, typically from a nib.
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
  }
  
  func addButtons()
  {
    let currentUser: Profile = UserInfo.currentUser!
    if currentUser.isValidUser()
    {
      for header in currentUser.details
      {
        //Actually create the circles tomorrow. MAKE
      }
    }
  }
  



}

