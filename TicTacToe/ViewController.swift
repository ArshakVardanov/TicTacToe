//
//  ViewController.swift
//  TicTacToe
//
//  Created by Arshak Vardanov on 26.04.22.
//

import UIKit

class ViewController: UIViewController {
    var vertSteck: UIStackView!
    var restartButtonView: SquareView!
    var squareArr: [SquareView] = []
    var size = 9
    var player = false
    
    @objc private func restartButtonPrest(){
        restartButtonFunc()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initVertSteck()
        initRestartButton()
        createSquareGrid(size: size)
        constructHierarchy()
        activateConstraints()
        
        func createSquareGrid(size: Int) {
            let range = 1...size
            for _ in range {
                let horSteck = initHorSteck()
                vertSteck.addArrangedSubview(horSteck)
                
                for _ in range {
                    let squareView = initSquareView(horSteq: horSteck)
                    squareView.squareLabel.font = .systemFont(ofSize: view.frame.width/CGFloat(size * 2))
                    buttonFunc(square: squareView)
                    squareArr += [squareView]
                }
            }
        }
        func buttonFunc(square:  SquareView){
            square.onButtonSelection = {
                if !square.isValeuSet {
                    if self.player {
                        square.set(value: "O")
                    }else {
                        square.set(value: "X")
                    }
                    self.player.toggle()
                }
            }
        }
    }
}
extension ViewController {
    func restartButtonFunc(){
        for item in squareArr {
            item.squareLabel.text = ""
            item.isValeuSet = false
        }
        player = false
    }
    private func initRestartButton(){
        restartButtonView = SquareView()
        restartButtonView.squareLabel.text = "Restart"
        restartButtonView.squareLabel.font = .systemFont(ofSize: 20)
        restartButtonView.translatesAutoresizingMaskIntoConstraints = false
        restartButtonView.backgroundColor = .blue
        restartButtonView.layer.cornerRadius = 10
        restartButtonView.squareButton.addTarget(self, action: #selector(restartButtonPrest), for: .touchUpInside)
        
    }
    private func initVertSteck(){
        vertSteck = UIStackView()
        vertSteck.axis = .vertical
        vertSteck.spacing = view.frame.width/CGFloat(size * 10)
        vertSteck.distribution = .fillEqually
        vertSteck.translatesAutoresizingMaskIntoConstraints = false
    }
    private func initHorSteck() -> UIStackView{
        let horSteck = UIStackView()
        horSteck.axis = .horizontal
        horSteck.distribution = .fillEqually
        horSteck.spacing = view.frame.width/CGFloat(size * 10)
        horSteck.translatesAutoresizingMaskIntoConstraints = false
        
        vertSteck.addArrangedSubview(horSteck)
        view.addSubview(restartButtonView)
        
        return horSteck
    }
    private func initSquareView(horSteq: UIStackView) -> SquareView {
        let squer = SquareView()
        squer.backgroundColor = .systemCyan
        squer.layer.cornerRadius = view.frame.width/CGFloat(size * 5)
        squer.translatesAutoresizingMaskIntoConstraints = false
        
        horSteq.addArrangedSubview(squer)
        
        NSLayoutConstraint.activate([
            squer.widthAnchor.constraint(equalToConstant: (view.frame.width - 100)/CGFloat(self.size)),
            squer.heightAnchor.constraint(equalToConstant: (view.frame.width - 100)/CGFloat(self.size))
        ])
        return squer
    }
    private func constructHierarchy() {
        view.addSubview(vertSteck)
    }
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            vertSteck.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            vertSteck.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            vertSteck.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            restartButtonView.topAnchor.constraint(equalTo: vertSteck.bottomAnchor, constant: 25),
            restartButtonView.centerXAnchor.constraint(equalTo: vertSteck.centerXAnchor),
            restartButtonView.widthAnchor.constraint(equalToConstant: 100.0),
            restartButtonView.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
}

