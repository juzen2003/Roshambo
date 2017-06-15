//
//  PlayGameViewController.swift
//  Roshambo
//
//  Created by Yu-Jen Chang on 6/13/17.
//  Copyright © 2017 Yu-Jen Chang. All rights reserved.
//

import UIKit

class PlayGameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    enum theMove: Int {
        case rock = 1, paper, scissors
    }
    
    func randomInt() -> Int {
        let randomValue = arc4random() % 3 + 1
        return Int(randomValue)
    }
    
    // generate the game result
    func playGame(_ playerChoice: Int) -> (String, String) {
        
        let playerMove = theMove.init(rawValue: playerChoice)!
        let computerMove = theMove.init(rawValue: randomInt())!
        let imageName: String
        let result: String
        
        switch (playerMove, computerMove) {
        case (.rock, .paper), (.paper, .rock):
            result = "Paper covers Rock!"
            imageName = "PaperCoversRock"
        case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
            result = "It's a Tie!"
            imageName = "itsATie"
        case (.rock, .scissors), (.scissors, .rock):
            result = "Rock crushes Scissors!"
            imageName = "RockCrushesScissors"
        case (.paper, .scissors), (.scissors, .paper):
            result = "Scissors cut Paper!"
            imageName = "ScissorsCutPaper"
        }
        
        return (result, imageName)
    }
    
    // Code only for Rock move
    @IBAction func performRock() {
        var controller: GameResultViewController
        
        controller = self.storyboard?.instantiateViewController(withIdentifier: "GameResultViewController") as! GameResultViewController
        let play = playGame(1)
        controller.resultImageName = play.1
        controller.resultMessage = play.0
        
        present(controller, animated: true, completion: nil)
    }


}

