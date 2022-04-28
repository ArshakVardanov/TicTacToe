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
    var horSteck1: UIStackView!
    var horSteck2: UIStackView!
    var horSteck3: UIStackView!
    var squareView1: SquareView!
    var squareView2: SquareView!
    var squareView3: SquareView!
    var squareView4: SquareView!
    var squareView5: SquareView!
    var squareView6: SquareView!
    var squareView7: SquareView!
    var squareView8: SquareView!
    var squareView9: SquareView!
    var squareArr: [SquareView]!
    
    
    @objc private func restartButtonPrest(){
        restartButtonFunc()
    }
    
    //    var squareView2: SquareView!
    var player = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVertSteck()
        initRestartButton()
        horSteck1 = initHorSteck()
        horSteck2 = initHorSteck()
        horSteck3 = initHorSteck()
        
        //        initTicTac()
        //        initSquare2View()
        constructHierarchy()
        activateConstraints()
        
        squareView1 = initSquareView(horSteq: horSteck1)
        buttonFunc(squer: squareView1)
        squareView2 = initSquareView(horSteq: horSteck1)
        buttonFunc(squer: squareView2)
        squareView3 = initSquareView(horSteq: horSteck1)
        buttonFunc(squer: squareView3)
        squareView4 = initSquareView(horSteq: horSteck2)
        buttonFunc(squer: squareView4)
        squareView5 = initSquareView(horSteq: horSteck2)
        buttonFunc(squer: squareView5)
        squareView6 = initSquareView(horSteq: horSteck2)
        buttonFunc(squer: squareView6)
        squareView7 = initSquareView(horSteq: horSteck3)
        buttonFunc(squer: squareView7)
        squareView8 = initSquareView(horSteq: horSteck3)
        buttonFunc(squer: squareView8)
        squareView9 = initSquareView(horSteq: horSteck3)
        buttonFunc(squer: squareView9)
        
        
        func buttonFunc(squer:  SquareView){
            squer.onButtonSelection = {
                if self.player {
                    squer.set(value: "O")
                    print("hello")
                    self.player = false
                }else {
                    squer.set(value: "X")
                    print("hello")
                    self.player = true
                }
            }
        }
    }
}

extension ViewController {
    func restartButtonFunc(){
        squareArr = [
            squareView1,
            squareView2,
            squareView3,
            squareView4,
            squareView5,
            squareView6,
            squareView7,
            squareView8,
            squareView9
        ]
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
        
//        restartButton = UIButton()
        restartButtonView.backgroundColor = .blue
        restartButtonView.layer.cornerRadius = 12
//        let label = UILabel()
//        label.text = "Restart"
//        label.textColor = .white
//        label.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            label.centerYAnchor.constraint(equalTo: restartButton.centerYAnchor),
//            label.centerXAnchor.constraint(equalTo: restartButton.centerXAnchor)
//        ])
        restartButtonView.squareButton.addTarget(self, action: #selector(restartButtonPrest), for: .touchUpInside)

    }
//    private func initTicTac(squer: SquareView){
//
//    }
    
    private func initVertSteck(){
        vertSteck = UIStackView()
        vertSteck.axis = .vertical
        vertSteck.spacing = 15
//        vertSteck.distribution = .fillEqually
        vertSteck.translatesAutoresizingMaskIntoConstraints = false
    }
    private func initHorSteck() -> UIStackView{
        let horSteck = UIStackView()
        horSteck.axis = .horizontal
        horSteck.distribution = .fillEqually
        horSteck.spacing = 15
        horSteck.translatesAutoresizingMaskIntoConstraints = false
        
        vertSteck.addArrangedSubview(horSteck)
        vertSteck.addSubview(restartButtonView)
        
        NSLayoutConstraint.activate([
            horSteck.leadingAnchor.constraint(equalTo: vertSteck.leadingAnchor),
            
        ])
        
        return horSteck
    }
    private func initSquareView(horSteq: UIStackView) -> SquareView {
        let squer = SquareView()
        squer.backgroundColor = .systemCyan
        squer.layer.cornerRadius = 12
//        squer.bounds = squer.frame.insetBy(dx: 10.0, dy: 10.0)
        squer.translatesAutoresizingMaskIntoConstraints = false
        
        horSteq.addArrangedSubview(squer)
        
        NSLayoutConstraint.activate([
            squer.widthAnchor.constraint(equalToConstant: 100.0),
            squer.heightAnchor.constraint(equalToConstant: 100.0),
        ])
        return squer
    }
//    private func initSquare2View() {
//        squareView2 = SquareView()
//        squareView2.backgroundColor = .systemCyan
//        squareView2.layer.cornerRadius = 12
//        squareView2.translatesAutoresizingMaskIntoConstraints = false
//    }
    
    
    
    private func constructHierarchy() {
        view.addSubview(vertSteck)
        
//        view.addSubview(squareView2)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            vertSteck.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            vertSteck.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            vertSteck.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            restartButtonView.bottomAnchor.constraint(equalTo: vertSteck.bottomAnchor),
            restartButtonView.centerXAnchor.constraint(equalTo: vertSteck.centerXAnchor),
            restartButtonView.widthAnchor.constraint(equalToConstant: 100.0),
            restartButtonView.heightAnchor.constraint(equalToConstant: 50.0),
            
            
            
            
            
//            horSteck.topAnchor.constraint(equalTo: horSteck.topAnchor),
//            horSteck.centerYAnchor.constraint(equalTo: horSteck.centerYAnchor),
            
//            squareView2.widthAnchor.constraint(equalToConstant: 100.0),
//            squareView2.heightAnchor.constraint(equalToConstant: 100.0),
        ])
    }
}

