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

    @IBAction func performRock() {
        var controller: GameResultViewController
        
        controller = self.storyboard?.instantiateViewController(withIdentifier: "GameResultViewController") as! GameResultViewController
        
        
        present(controller, animated: true, completion: nil)
    }


}

