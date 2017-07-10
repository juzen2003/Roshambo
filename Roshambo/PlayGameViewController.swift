//
//  PlayGameViewController.swift
//  Roshambo
//
//  Created by Yu-Jen Chang on 6/13/17.
//  Copyright © 2017 Yu-Jen Chang. All rights reserved.
//

import UIKit

class PlayGameViewController: UIViewController {
    
    var histroy = [RPSData]()

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
    func playGame(_ playerChoice: Int) -> RPSData {
        
        let playerMove = theMove.init(rawValue: playerChoice)!
        let computerMove = theMove.init(rawValue: randomInt())!
        var gameData = RPSData(gameResult: nil, resultMessage: nil, imageName: nil)
        
        switch (playerMove, computerMove) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            gameData.gameResult = "You Win!"
        case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
            gameData.gameResult = "You Lose!"
        default:
            gameData.gameResult = "Tie Game!"
        }
        
        switch (playerMove, computerMove) {
        case (.rock, .paper), (.paper, .rock):
            gameData.resultMessage = "Paper covers Rock!"
            gameData.imageName = "PaperCoversRock"
        case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
            gameData.resultMessage = "It's a Tie!"
            gameData.imageName = "itsATie"
        case (.rock, .scissors), (.scissors, .rock):
            gameData.resultMessage = "Rock crushes Scissors!"
            gameData.imageName = "RockCrushesScissors"
        case (.paper, .scissors), (.scissors, .paper):
            gameData.resultMessage = "Scissors cut Paper!"
            gameData.imageName = "ScissorsCutPaper"
        }
        
        self.histroy.append(gameData)
        
        return gameData
    }
    
    // this is for code & segue and segue only method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! GameResultViewController
        if segue.identifier == "performPaper" {
            let play = playGame(2)
            controller.resultImageName = play.imageName
            controller.resultMessage = play.resultMessage
            
        } else if segue.identifier == "performScissors" {
            let play = playGame(3)
            controller.resultImageName = play.imageName
            controller.resultMessage = play.resultMessage
        }
        
    }
    
    // Code only for Rock move
    @IBAction func performRock() {
        var controller: GameResultViewController
        
        controller = self.storyboard?.instantiateViewController(withIdentifier: "GameResultViewController") as! GameResultViewController
        let play = playGame(1)
        controller.resultImageName = play.imageName
        controller.resultMessage = play.resultMessage
        
        present(controller, animated: true, completion: nil)
    }
    
    // Code & Segue
    @IBAction func performPaper(_ sender: Any) {
        self.performSegue(withIdentifier: "performPaper", sender: self)
    }

    // History View
    @IBAction func HistoryView(_ sender: Any) {
        var controller: HistoryViewController
        
        controller = self.storyboard?.instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
        controller.histroy = self.histroy
        
        self.present(controller, animated: true, completion: nil)
    }
    
    
}

