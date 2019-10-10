//
//  RGB-Value.swift
//  colorGuesingGame
//
//  Created by Mr Wonderful on 7/30/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import Foundation
import UIKit

struct RGBValue {
    var red = Double.random(in: 0.0...1.0)
    var blue = Double.random(in: 0.0...1.0)
    var green = Double.random(in: 0.0...1.0)
    let alpha = 1.0
    
    
  func creatRGBColor() -> UIColor{
   return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha) )
    }
    
    func highestRGBvalue() -> CGFloat {
        var colors =  [red,blue,green].sorted(by: {$0 > $1})
        
        return CGFloat(colors[0])
    }
}

var currentHighestRBGValue = RGBValue()
 var high = currentHighestRBGValue.highestRGBvalue()


