//
//  GameView.swift
//  Rainbow
//
//  Created by Nikita on 14.11.2023.
//

import UIKit

class GameView: UIView {
    
    //MARK: - Properties
    
    private lazy var viewLabel = UILabel()
    private lazy var checkButton = UIButton()
    var viewsColor = [UIColor.redGameColor, UIColor.blueGameColor, UIColor.purpleGameColor, UIColor.yellowGameColor, UIColor.greenGameColor] // сделать словарь ключ значение для цвета
    var viewsTitle = ["Красный", "Синий", "Фиолетовый", "Желтый", "Зеленый"]
    
    //MARK: - Life cycle
    
    init() {
        super.init(frame: .zero)
        setupView()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    func setupView() {
        //        перенести в контроллер
        //        var views = [UIView(), UIView(), UIView(), UIView(), UIView()]
        //        self.views.forEach { view in
        //            view.addSubviews(label, checkButton)
        //            label.text = viewsTitle.randomElement()
        //            view.backgroundColor = viewsColor.randomElement()
        //        }
        self.alpha = 0
        self.backgroundColor = viewsColor.randomElement()
        animatedView()
        self.addSubviews(viewLabel, checkButton)
        viewLabel.text = self.viewsTitle.randomElement()
        checkButton.setImage(UIImage(named: "noCheck"), for: .normal)
        checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        makeShadovForView()
       
    }
    
    //MARK: - Private methods
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
    
    //MARK: - objc methods
    
    @objc func checkButtonTapped() {
        let tapCount = 0
        if tapCount.isMultiple(of: 2) {
            checkButton.addSubview(UIImageView(image: UIImage(named: "check")!))
        }
    }
}


//MARK: - Extension

extension GameView {
    
    func constraints() {
        NSLayoutConstraint.activate([
            // View label constraints
            viewLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            viewLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            //Check button constaints
            checkButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            checkButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
        ])
    }
}
