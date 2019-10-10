//
//  ColorGuessingView.swift
//  Color-Guessing-game-Programatically
//
//  Created by Mr Wonderful on 10/9/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class ColorGuessingView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }
    
    var newGameButtonAction: (() -> Void)?
    var greenButtonAction: (() -> Void)?
    var blueButtonAction: (() -> Void)?
    var redButtonAction: (() -> Void)?
    
    
    let highScore:UILabel = {
        let label = UILabel(color: .black, font: .italicSystemFont(ofSize: 15), text: "High Score")
        return label
    }()
    
    let promptLabel:UILabel = {
        let label = UILabel(color: .black, font: .italicSystemFont(ofSize: 15), text: "Which  sample is the color closest to ?")
        return label
    }()
    
    let currentScore:UILabel = {
        let label = UILabel(color: .black, font: .italicSystemFont(ofSize: 15), text: "Current Score")
        return label
    }()
    
    let gameOver:UILabel = {
        let label = UILabel(color: .black, font: .italicSystemFont(ofSize: 15), text: "Game Over")
        return label
    }()
    
    let newGameButton:UIButton = {
        let button = UIButton(setTitle: "New Game", borderWidth: 1, borderColor: UIColor.red.cgColor)
        button.titleLabel?.text = "New Game"
        button.addTarget(self, action: #selector(handleNewGameButton), for: .touchUpInside)
        return button
    }()
    
    let greenButton:UIButton = {
        let button = UIButton(setTitle: "Green", borderWidth: 1, borderColor: UIColor.red.cgColor)
        button.addTarget(self, action: #selector(handleGreenButton), for: .touchUpInside)
        return button
    }()
    
    let redButton:UIButton = {
        let button = UIButton(setTitle: "Red", borderWidth: 1, borderColor: UIColor.red.cgColor)
        button.addTarget(self, action: #selector(handleRedButton), for: .touchUpInside)
        return button
    }()
    
    let blueButton:UIButton = {
        let button = UIButton(setTitle: "Blue", borderWidth: 1, borderColor: UIColor.red.cgColor)
        button.addTarget(self, action: #selector(handleBlueButton), for: .touchUpInside)
        return button
    }()
    
    var RGBColorView:UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 414))
        return view
    }()
    
    
    @objc func handleRedButton(){
        redButtonAction?()
    }
    
    @objc func handleBlueButton(){
        blueButtonAction?()
    }
    
    @objc func handleGreenButton(){
        greenButtonAction?()
    }
    
    @objc func handleNewGameButton(){
        newGameButtonAction?()
    }
    private func setupView(){
        let stackView = combineAllStackView()
        addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
    }
    private func scoresStackView() -> UIStackView{
        let stackView = UIStackView(arrangedSubviews: [highScore, currentScore])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func promptAndViewStackView() -> UIStackView{
        let stackView = UIStackView(arrangedSubviews: [RGBColorView, promptLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func gameButtonStackView() -> UIStackView{
        let stackView = UIStackView(arrangedSubviews: [gameOver, newGameButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func buttonStackView() -> UIStackView{
        let stackView = UIStackView(arrangedSubviews: [redButton, blueButton, greenButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func combineAllStackView() -> UIStackView{
        let combinedStackView = UIStackView(arrangedSubviews: [scoresStackView(), promptAndViewStackView(),buttonStackView(),gameButtonStackView()])
        combinedStackView.axis = .vertical
        combinedStackView.distribution = .fillEqually
        combinedStackView.spacing = 10
        combinedStackView.translatesAutoresizingMaskIntoConstraints = false
        return combinedStackView
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
