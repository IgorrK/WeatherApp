//
//  HolderView.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-17.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

protocol HolderViewDelegate:class {
  func animateLabel()
}

class HolderView: UIView {

  var parentFrame :CGRect = CGRectZero
    let ovalLayer = OvalLayer()

  weak var delegate:HolderViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor.clearColor()
    self.layer.addSublayer(ovalLayer)
    ovalLayer.expand()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}
