//
//  ActivityIndicator.swift
//  SPV
//
//  Created by HappySanz Tech on 07/10/20.
//  Copyright © 2020 HappySanz Tech. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

  func activityStartAnimating() {
    let backgroundView = UIView()
    backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    backgroundView.backgroundColor = UIColor.clear
    backgroundView.tag = 475647

    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
    activityIndicator.center = self.center
    activityIndicator.hidesWhenStopped = true
    if #available(iOS 13.0, *) {
        activityIndicator.style = UIActivityIndicatorView.Style.medium
    } else {
        // Fallback on earlier versions
    }
    activityIndicator.color = UIColor(red: 3.0/255.0, green: 53.0/255.0, blue: 107.0/255.0, alpha: 1.0)
    activityIndicator.startAnimating()
    self.isUserInteractionEnabled = false

    backgroundView.addSubview(activityIndicator)

    self.addSubview(backgroundView)
  }

  func activityStopAnimating() {
    if let background = viewWithTag(475647){
        background.removeFromSuperview()
    }
    self.isUserInteractionEnabled = true
  }
}
