//
//  UserView.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/26/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit

class UserView : UIViewController, UITableViewDataSource, UITableViewDelegate
{
  var itemsAsData: [NSData] = NSUserDefaults.standardUserDefaults().objectForKey("profiles") as! Array
  var items = [Profile]()
  let SCREEN_HEIGHT = Int(UIScreen.mainScreen().bounds.height)
  let SCREEN_WIDTH = Int(UIScreen.mainScreen().bounds.width)
  var tableView = UITableView()
  let xMargin = 20
  
  override func viewDidLoad()
  {
    self.view.backgroundColor = UIColor.whiteColor()
    items = decodeArray(itemsAsData)
    configureNavbar()
    addTableView()
  }
  
  override func viewDidAppear(animated: Bool)
  {
    configureNavbar()
  }
  
  func decodeArray(array : Array<NSData>) -> Array<Profile>
  {
    var newArray = [Profile]()
    for index in 0...(array.count - 1)
    {
      var data = array[index]
      var profile: Profile = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! Profile
      newArray.append(profile)
    }
    return newArray
  }
  
  func configureNavbar()
  {
    var nav = self.navigationController?.navigationBar
    let currentUser: Profile = UserInfo.currentUser!
    nav?.topItem?.title = "Profiles"
    nav?.barTintColor = UIColor(red : 192/255 ,green : 57/255 , blue : 43/255, alpha: 1.0)
    nav?.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-UltraLight", size: 25)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style:
      UIBarButtonItemStyle.Plain, target: nil, action: nil)
    nav?.tintColor = UIColor.whiteColor()
    
    var plusButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addNewUser:")
    
    self.navigationItem.rightBarButtonItem = plusButton
    
  }
  
  func addTableView()
  {
    tableView.frame = CGRectMake(0, 0, CGFloat(SCREEN_WIDTH), CGFloat(SCREEN_HEIGHT))
    tableView.delegate = self
    tableView.dataSource = self
    self.view.addSubview(tableView)
  }
  
  
  
  func addNewUser(sender : UIBarButtonItem)
  {
    let vc = AddUser()
    self.navigationController?.pushViewController(vc, animated: true)
  }
 

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return items.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
  {
    let cell = UITableViewCell()
    let label = UILabel(frame: CGRectMake(CGFloat(xMargin), 0, CGFloat(SCREEN_WIDTH - xMargin), 50))
    var profile = items[indexPath.row]
    label.text = profile.name
    cell.addSubview(label)
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
  {
    UserInfo.currentUser = items[indexPath.row]
    let vc = ViewController()
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    navigationController?.pushViewController(vc, animated: true)
  }
  




  
}
