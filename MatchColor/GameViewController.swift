//
//  GameViewController.swift
//  MatchColor
//
//  Created by user04 on 2018/10/2.
//  Copyright © 2018年 jerryHU. All rights reserved.
//

import UIKit
import LDProgressView

class GameViewController: UIViewController {
    
    @IBOutlet weak var ans_box: UIView!
    @IBOutlet weak var box_1: UIView!
    @IBOutlet weak var box_2: UIView!
    @IBOutlet weak var box_3: UIView!
    @IBOutlet weak var box_4: UIView!
    @IBOutlet weak var box_5: UIView!
    @IBOutlet weak var box_6: UIView!
    @IBOutlet weak var box_7: UIView!
    @IBOutlet weak var box_8: UIView!
    @IBOutlet weak var box_9: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var wrongImageView: UIImageView!
    @IBOutlet weak var timeView: UIView!
    
    var shuffleArray = [Int]()
    var outletArray = [UIView]()
    let gameConfig = GameConfig.shared
    var progressView = LDProgressView()
    let sound = SoundManager()
    
    var timer: Timer?
    var time = 60 {
        didSet {
            timeLabel.text = "\(time)"
            progressView.progress = CGFloat(Float(time) / 60.0)
        }
    }
    var score = 0 {
        didSet {
            scoreLabel.text = "\(score)"
        }
    }
    
    @IBAction func box_1_tap(_ sender: UITapGestureRecognizer) {
        checking(boxTriger: box_1)
    }
    @IBAction func box_2_tap(_ sender: UITapGestureRecognizer) {
        checking(boxTriger: box_2)
    }
    @IBAction func box_3_tap(_ sender: UITapGestureRecognizer) {
        checking(boxTriger: box_3)
    }
    @IBAction func box_4_tap(_ sender: UITapGestureRecognizer) {
        checking(boxTriger: box_4)
    }
    @IBAction func box_5_tap(_ sender: UITapGestureRecognizer) {
        checking(boxTriger: box_5)
    }
    @IBAction func box_6_tap(_ sender: UITapGestureRecognizer) {
        checking(boxTriger: box_6)
    }
    @IBAction func box_7_tap(_ sender: UITapGestureRecognizer) {
        checking(boxTriger: box_7)
    }
    @IBAction func box_8_tap(_ sender: UITapGestureRecognizer) {
        checking(boxTriger: box_8)
    }
    @IBAction func box_9_tap(_ sender: UITapGestureRecognizer) {
        checking(boxTriger: box_9)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonInit()
        gameStart()
        shuffle()
        if GameConfig.shared.isGameMusic {
            sound.playBackGroundSound()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gameStart() {
        switch gameConfig.gameLevel {
        case .easy:
            shuffleArray = [0, 1, 2, 3, 4, 5, 6, 7, 8]
            break
            
        case .mid:
            shuffleArray = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
            break
            
        case .diff:
            shuffleArray = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14]
            break
        }
        
        outletArray.append(box_1)
        outletArray.append(box_2)
        outletArray.append(box_3)
        outletArray.append(box_4)
        outletArray.append(box_5)
        outletArray.append(box_6)
        outletArray.append(box_7)
        outletArray.append(box_8)
        outletArray.append(box_9)
    }
    
    func commonInit() {
        progressView = LDProgressView()
        progressView.color = UIColor.yellow
        progressView.progress = 1.00
        progressView.animate = true
        progressView.showText = false
        progressView.type = LDProgressGradient
        progressView.background = UIColor.gray
        timeView.addSubview(progressView)
        progressView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(timeView)
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] (timer) in
            self?.time -= 1
            if self?.time == 0 {
                self?.timer?.invalidate()
                self?.gameOver()
            }
        }
    }
    
    func shuffle(){
        
        for i in 0..<shuffleArray.count {
            let remainingCount = shuffleArray.count - i
            let exchangeIndex = Int(arc4random_uniform(UInt32(remainingCount))) + i
            let tempt = shuffleArray[i]
            shuffleArray[i] = shuffleArray[exchangeIndex]
            shuffleArray[exchangeIndex] = tempt
        }
        
        //assign
        for (index, value) in outletArray.enumerated() {
            switch gameConfig.gameLevel {
            case .easy:
                value.backgroundColor = ColorEnum.easyColor(rawValue: shuffleArray[index])!.uicolor()
                break
                
            case .mid:
                value.backgroundColor = ColorEnum.midColor(rawValue: shuffleArray[index])!.uicolor()
                break
                
            case .diff:
                value.backgroundColor = ColorEnum.diffColor(rawValue: shuffleArray[index])!.uicolor()
                break
            }
            
        }
        let randAns = Int(arc4random_uniform(9))
        ans_box.backgroundColor = outletArray[randAns].backgroundColor
    }
    
    func checking(boxTriger: UIView){
        
        if ans_box.backgroundColor == boxTriger.backgroundColor{
            //addScore
            score += 1
            scoreLabel.text = "\(score)"
            shuffle()
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                self.wrongImageView.alpha = 1.0
            }) { (complete) in
                if complete {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.wrongImageView.alpha = 0.0
                        self.shuffle()
                    })
                }
            }
        }
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func gameOver() {
        if score > GameConfig.shared.highScore {
            GameConfig.shared.highScore = score
        }
        if GameConfig.shared.isGameMusic {
            sound.stopBackGroundSound()
        }
        if GameConfig.shared.isGameSound {
            sound.playOverSound()
        }
        performSegue(withIdentifier: "toGameOver", sender: score)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameOver" {
            let vc = segue.destination as! GameOverViewController
            vc.score = score
        }
    }
    
}
