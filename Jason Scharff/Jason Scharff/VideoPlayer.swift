//
//  VideoPlayer.swift
//  Jason Scharff
//
//  Created by Jason Scharff on 4/23/15.
//  Copyright (c) 2015 Jason Scharff. All rights reserved.
//

import Foundation
import MediaPlayer

class VideoPlayer : MPMoviePlayerController
{
  var isPlaying = false;
  var playView = UIImageView()
  var pauseView = UIImageView()
  let margin : CGFloat = 15
  
  override init!(contentURL url: NSURL!)
  {
    super.init(contentURL: url)
    self.movieSourceType = MPMovieSourceType.File
//    var tapGestureRecognizer : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "switchPlayBack:")
//    self.view.addGestureRecognizer(tapGestureRecognizer)
//    
//    var pinchRecognizer = UIPinchGestureRecognizer(target: self, action: "goFullScreen:")
//    self.view.addGestureRecognizer(pinchRecognizer)
 
    
  }
  
  
//  func addPlayButton()
//  {
//    var playImage = UIImage(named: "PlayButton.png")
//    let height = self.view.frame.height - margin * 2
//    let width = height * (playImage!.size.height / playImage!.size.width)
//    let x = self.view.frame.width / 2 - width / 2
//    let y = margin
//    playView.frame = CGRectMake(x, y, width, height)
//    playView.alpha = 0
//    self.view.addSubview(playView)
//  }
//  
//  func addPauseButton()
//  {
//    var pauseImage = UIImage(named: "PauseButton.png")
//    let height = self.view.frame.height - margin * 2
//    let width = height * (pauseImage!.size.height / pauseImage!.size.width)
//    let x = self.view.frame.width / 2 - width / 2
//    let y = margin
//    pauseView.frame = CGRectMake(x, y, width, height)
//    pauseView.alpha = 0;
//    self.view.addSubview(pauseView)
//  }
//  
//  func goFullScreen(recognizer : UIPinchGestureRecognizer)
//  {
//    if(recognizer.scale  > 1)
//    {
//      self.setFullscreen(true, animated: true)
//    }
//    else
//    {
//      self.setFullscreen(false, animated: true)
//    }
//    
//  }
//  
//
//  
//  @IBAction func switchPlayBack(recognizer:UITapGestureRecognizer)
//  {
//    println("AQUI")
//    if (isPlaying)
//    {
//      UIView.animateWithDuration(0.25, animations: {
//        self.pauseView.alpha = 0.5
//      })
//      delay(0.4)
//      {
//        UIView.animateWithDuration(0.25, animations: {
//          self.pauseView.alpha = 0.0
//        })
//      }
//    
//      self.pause()
//      isPlaying = false
//    }
//    else
//    {
//      UIView.animateWithDuration(0.25, animations: {
//        self.playView.alpha = 0.5
//      })
//      delay(0.4)
//        {
//          UIView.animateWithDuration(0.25, animations: {
//            self.playView.alpha = 0.0
//          })
//      }
//      self.play()
//      isPlaying = true
//    }
//  }
//}


func delay(delay:Double, closure:()->()) {
  dispatch_after(
    dispatch_time(
      DISPATCH_TIME_NOW,
      Int64(delay * Double(NSEC_PER_SEC))
    ),
    dispatch_get_main_queue(), closure)
}

}

