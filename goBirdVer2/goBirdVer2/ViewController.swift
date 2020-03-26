//
//  ViewController.swift
//  goBirdVer2
//
//  Created by 佐野哲也 on 2020/03/22.
//  Copyright © 2020 佐野哲也. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let flySound = Audio()
    let hitSound = Audio()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        screenW = UIScreen.main.bounds.width
        screenH = UIScreen.main.bounds.height
        
        flySound.set(named: "fly", volume: 1)
        hitSound.set(named: "hit", volume: 1)
        
        gameStart()

    }
    
    var screenW: CGFloat = 0
    var screenH: CGFloat = 0
    
    var animeTimer: Timer!
    var pipeTimer: Timer!
    var speed: CGFloat = 0
    var score: Int = 0
    
    var pipes = [UIImageView]()

    @IBAction func tapScreen(_ sender: Any) {
        speed = -5
        flySound.play()

    }
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var gameOverLabel: UILabel!
    
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var bird: UIImageView!
    
    @IBOutlet var retryBtn: UIButton!
    
    func gameStart(){
        // initilaze
        backgroundImage.frame.origin = CGPoint.zero
        bird.image = UIImage(named: "bird_normal.png")
        bird.center = CGPoint(x: 60, y: screenH / 2 )
        speed = 2
        score = 0
        scoreLabel.text = String(score)
        for pipe in pipes {
            pipe.removeFromSuperview()
        }
        pipes.removeAll()
        gameOverLabel.isHidden = true
        retryBtn.isHidden = true
        
        animeTimer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true, block: { (t) in
            if self.backgroundImage.center.x > 0 {
                self.backgroundImage.center.x -= 3
            }
            else {
                self.backgroundImage.center.x = self.screenW
            }
            
            self.bird.center.y += self.speed
            if self.bird.center.y < 10 {
                self.bird.center.y = 10
            }
            else if self.bird.center.y > self.screenH {
                self.gameOver()
            }
            self.speed += 0.2
            
            for pipe in self.pipes {
                if pipe.frame.contains(self.bird.center) {
                    self.gameOver()
                }
            }
            
            var del: Bool = false
            for pipe in self.pipes {
                if pipe.frame.origin.x + 70 > 0 {
                    pipe.frame.origin.x -= 3
                } else {
                    pipe.removeFromSuperview()
                    del = true
                }
            }
            if del {
                self.pipes.removeFirst()
                self.score += 1
                self.scoreLabel.text = String(self.score)
            }
        })
        pipeTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
            let pipeH: CGFloat = CGFloat(700 - (Int(arc4random()) % 4 ) * 200 )
            let pipe = UIImageView()
            pipe.image = UIImage(named: "pipe.png")
            pipe.frame.size = CGSize(width: 70, height: 800)
            pipe.frame.origin = CGPoint(x: self.screenW, y: pipeH)
            self.pipes.append(pipe)
            self.view.addSubview(pipe)
            
            self.view.bringSubviewToFront(self.bird)
            self.view.bringSubviewToFront(self.gameOverLabel)
            self.view.bringSubviewToFront(self.retryBtn)
            
        })

        
    }

    func gameOver() {
        animeTimer.invalidate()
        pipeTimer.invalidate()
        hitSound.play()
        bird.image = UIImage(named: "bird_confusion.png")
        gameOverLabel.isHidden = false
        retryBtn.isHidden = false
    }
    
    @IBAction func retryGame(_ sender: Any) {
        gameStart()
    }
    
}

