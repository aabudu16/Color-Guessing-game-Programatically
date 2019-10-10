//
//  incrementer.swift
//  colorGuesingGame
//
//  Created by Mr Wonderful on 7/30/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import Foundation

struct incrementer {
    var score = 0
    var highestScore = 0
    
  mutating  func incrementScore(){
        score += 1
    }
    mutating func incrementHighScore(){
        if score >= highestScore{
            highestScore =  score
        }
    }
}

