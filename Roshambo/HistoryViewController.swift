//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Yu-Jen Chang on 7/9/17.
//  Copyright © 2017 Yu-Jen Chang. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    var histroy: [RPSData]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.histroy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameResult")!
        let gameResult = self.histroy[indexPath.row]
        
        cell.textLabel?.text = gameResult.gameResult!
        cell.detailTextLabel?.text = gameResult.resultMessage!
        cell.imageView?.image = UIImage(named: gameResult.imageName!)
        cell.imageView?.contentMode = .scaleAspectFit
        
        return cell
    }
    
    @IBAction func OK(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
