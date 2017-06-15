//
//  GameResultViewController.swift
//  Roshambo
//
//  Created by Yu-Jen Chang on 6/14/17.
//  Copyright © 2017 Yu-Jen Chang. All rights reserved.
//

import UIKit

class GameResultViewController: UIViewController {

    var resultImageName: String?
    var resultMessage: String?
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        playAgainButton.setTitle("Play Again!", for: .normal)
        playAgainButton.setTitleColor(UIColor.blue, for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let resultImageName = self.resultImageName {
            self.resultImage.image = UIImage(named: resultImageName)
        } else {
            self.resultImage.image = nil
        }
        
        if let resultMessage = self.resultMessage {
            self.resultLabel.text = resultMessage
            self.resultLabel.textColor = UIColor.blue
        } else {
            self.resultLabel.text = nil
        }
        
        //self.resultImage.alpha = 0
    }

    @IBAction func playAgain(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
