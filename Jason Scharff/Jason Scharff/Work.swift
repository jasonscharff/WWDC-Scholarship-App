//
//  Work.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/19/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit

class Work: UIPageViewController, UIPageViewControllerDataSource {
  private var _controllerEnum: ControllerEnum = ControllerEnum()
  private var _dict: [UIViewController: ControllerEnum] = [:]
  
  init()
  {
    super.init(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
    self.title = "Work"
  }
  
  required init(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dataSource = self
    setViewControllers([getController(_controllerEnum)!], direction: .Forward, animated: false, completion: nil)
  }
  
  
  
  
  func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
    return ControllerEnum.allValues.count
  }
  
  func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
    return _controllerEnum.rawValue
  }
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    return getController(_dict[viewController]!.prevIndex())
  }
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    return getController(_dict[viewController]!.nextIndex())
  }
  
  private func getController(value: ControllerEnum) -> UIViewController? {
    var vc: UIViewController?
    switch value {
    case .EN:
      vc = Entefy()
      
    case .TN:
      vc = Tinera()
    case .GB:
      vc = GeniusBar()
      
    default: return nil
    }
    
    _dict[vc!] = value
    return vc!
  }
}

private enum ControllerEnum: Int {
  static let allValues = [EN, TN, GB]
  
  case Nil = -1, EN, TN, GB
  
  init() {
    self = .EN
  }
  
  func prevIndex() -> ControllerEnum {
    return ControllerEnum(rawValue: rawValue-1)!
  }
  
  func nextIndex() -> ControllerEnum {
    var value = rawValue+1
    if value > ControllerEnum.allValues.count-1 { value = Nil.rawValue }
    return ControllerEnum(rawValue: value)!
  }
}



