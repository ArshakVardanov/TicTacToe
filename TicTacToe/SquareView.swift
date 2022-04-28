//
//  SquareView.swift
//  TicTacToe
//
//  Created by Arshak Vardanov on 26.04.22.
//

import UIKit

class SquareView: UIView {
    var squareLabel: UILabel!
    var squareButton: UIButton!
    var isValeuSet = false
    var onButtonSelection: (() -> Void)?
    
    @objc private func buttonPrest(){
        onButtonSelection?()
    }
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension SquareView {
    func set(value: String) {
        if !isValeuSet {
            squareLabel.text = value
            isValeuSet = true
        }
    }
    
    func commonInit() {
        initSquareLabel()
        initSquareButton()
        constructHierarchy()
        activateConstraints()
    }
    
    private func initSquareLabel() {
        squareLabel = UILabel()
        squareLabel.textColor = .white
        squareLabel.textAlignment = .center
        squareLabel.font = .systemFont(ofSize: 75)
        squareLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    private func initSquareButton() {
        squareButton = UIButton()
//        squareButton.layer.cornerRadius = 12
        squareButton.addTarget(self, action: #selector(buttonPrest), for: .touchUpInside)
        squareButton.translatesAutoresizingMaskIntoConstraints = false
    }
    private func constructHierarchy() {
        addSubview(squareLabel)
        addSubview(squareButton)
    }
    
    
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            squareButton.topAnchor.constraint(equalTo: topAnchor),
            squareButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            squareButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            squareButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            squareLabel.topAnchor.constraint(equalTo:      topAnchor),
            squareLabel.leadingAnchor.constraint(equalTo:  leadingAnchor),
            squareLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            squareLabel.bottomAnchor.constraint(equalTo:   bottomAnchor)
        ])
    }

}
