//
//  ViewController.swift
//  Color-Guessing-game-Programatically
//
//  Created by Mr Wonderful on 10/9/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class ColorGuessingViewController: UIViewController {
    
    var colorGuessingView:ColorGuessingView!
    
    var colorGenerated = RGBValue()
    var increment = incrementer()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    
    private func setupView(){
        let mainView = ColorGuessingView(frame: self.view.frame)
        self.colorGuessingView = mainView
        self.view.addSubview(colorGuessingView)
        colorGuessingView.redButtonAction = redButtonPressd
        colorGuessingView.blueButtonAction = blueButtonPressed
        colorGuessingView.greenButtonAction = GreenButtonPressed
        colorGuessingView.newGameButtonAction = newGameButtonPressed
    }
    private func isEnabled(){
        colorGuessingView.redButton.isEnabled = true
        colorGuessingView.blueButton.isEnabled = true
        colorGuessingView.greenButton.isEnabled = true
        
        colorGuessingView.redButton.alpha = 1
        colorGuessingView.blueButton.alpha = 1
        colorGuessingView.greenButton.alpha = 1
        colorGuessingView.gameOver.alpha = 0
        colorGuessingView.newGameButton.alpha = 0
        
        colorGuessingView.redButton.setTitleColor(UIColor.red, for: UIControl.State.normal)
        colorGuessingView.blueButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        colorGuessingView.greenButton.setTitleColor(UIColor.green, for: UIControl.State.normal)
    }
    
   private func isDisabled(){
        colorGuessingView.redButton.isEnabled = false
        colorGuessingView.blueButton.isEnabled = false
        colorGuessingView.greenButton.isEnabled = false
        
        colorGuessingView.redButton.alpha = 0.5
        colorGuessingView.blueButton.alpha = 0.5
        colorGuessingView.greenButton.alpha = 0.5
        colorGuessingView.gameOver.alpha = 1.0
        colorGuessingView.newGameButton.alpha = 1.0
        
        colorGuessingView.redButton.setTitleColor(UIColor.lightGray, for: UIControl.State.normal)
        colorGuessingView.blueButton.setTitleColor(UIColor.lightGray, for: UIControl.State.normal)
        colorGuessingView.greenButton.setTitleColor(UIColor.lightGray, for: UIControl.State.normal)
    }
    
   private func colorGenerator(){
        colorGenerated = RGBValue()
        colorGuessingView.RGBColorView.backgroundColor = colorGenerated.creatRGBColor()
    }
    
   private func ifCaseIsTrue(){
        increment.incrementScore()
        increment.incrementHighScore()
        
        colorGuessingView.currentScore.text = "Curent Score: \(increment.score)"
        colorGuessingView.highScore.text = "High Score: \(increment.highestScore)"
        colorGenerator()
    }
    
    private func ifCaseIsFalse(){
        increment.score = 0
        colorGuessingView.currentScore.text = "Curent Score: \(increment.score)"
    }
   private func blueButtonPressed(){
        switch colorGenerated.highestRGBvalue() {
        case CGFloat(colorGenerated.blue):
            ifCaseIsTrue()
        default:
            ifCaseIsFalse()
            isDisabled()
        }
    }
    
   private func GreenButtonPressed(){
        switch colorGenerated.highestRGBvalue() {
        case CGFloat(colorGenerated.green):
            ifCaseIsTrue()
        default:
            ifCaseIsFalse()
            isDisabled()
        }
    }
    
    private func redButtonPressd(){
        switch colorGenerated.highestRGBvalue() {
        case CGFloat(colorGenerated.red):
            ifCaseIsTrue()
        default:
            ifCaseIsFalse()
            isDisabled()
        }
    }
    
   private func newGameButtonPressed(){
        isEnabled()
        colorGenerator()
    }
}

