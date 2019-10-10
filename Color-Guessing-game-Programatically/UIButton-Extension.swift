//
//  UIColor-Extension.swift
//  Pursuits App Store
//
//  Created by Mr Wonderful on 8/24/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

extension UIButton{
    
    public convenience init(setTitle:String, borderWidth:CGFloat, borderColor:CGColor ){
        self.init()
        self.setTitle(setTitle, for: .normal)
        self.layer.cornerRadius = 10
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        //size
      
        
    }
}
