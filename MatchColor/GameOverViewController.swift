//
//  GameOverViewController.swift
//  MatchColor
//
//  Created by user04 on 2018/10/2.
//  Copyright © 2018年 jerryHU. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Init()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func Init() {
        scoreLabel.text = "得分: \(score)"
    }
    
    
}
