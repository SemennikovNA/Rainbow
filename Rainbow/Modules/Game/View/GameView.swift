//
//  GameView.swift
//  Rainbow
//
//  Created by Nikita on 14.11.2023.
//

import UIKit

class GameView: UIView {
    
    //MARK: - UI Elements
    
    private lazy var viewLabel = UILabel()
    private lazy var checkButton = UIButton()
    
    //MARK: - Properties
    
    private lazy var viewsColor = [
        UIColor.redGameColor,
        UIColor.blueGameColor,
        UIColor.purpleGameColor,
        UIColor.yellowGameColor,
        UIColor.greenGameColor
    ]
    private lazy var viewsTitle = [
        "Красный",
        "Синий",
        "Фиолетовый",
        "Желтый", 
        "Зеленый"
    ]
    
    //MARK: - Life cycle
    
    init() {
        super.init(frame: .zero)
        
        //Call functions
        setupView()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    func addTarget(target: Any, action: Selector) {
        checkButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    //MARK: - Private methods
    
    private func setupView() {
        //Setup view
         self.alpha = 0
         self.backgroundColor = viewsColor.randomElement()
         animatedView()
         self.addSubviews(viewLabel, checkButton)
        
        //Setup label
         viewLabel.text = self.viewsTitle.randomElement()
        
        //Setup button
         checkButton.backgroundColor = .grayBackgroundColor
         checkButton.layer.cornerRadius = 15
        
        //Call functions
         makeShadovForView()
     }
    
    ///Create shadows for each view
    private func makeShadovForView() {
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSizeMake(0, 4)
        self.layer.shadowRadius = 1
    }
    
    ///Create animation for each view
    private func animatedView() {
        UIView.animate(withDuration: 0.5) {
             self.alpha = 1
         }
     }
}

//MARK: - Extension

extension GameView {
    
    // Setup constraints
   private func constraints() {
        
        NSLayoutConstraint.activate([
            // View label constraints
            viewLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            viewLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            //Check button constaints
            checkButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            checkButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            checkButton.widthAnchor.constraint(equalToConstant: 30),
            checkButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
