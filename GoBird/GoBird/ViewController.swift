//
//  ViewController.swift
//  GoBird
//
//  Created by Sano Tetsuya on 2017/08/27.
//  Copyright © 2017年 CATK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let flySound = Audio()
    let hitSound = Audio()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tap(_ sender: Any) {
        speed = -5
        flySound.play()
    }
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var gameoverLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var bird: UIImageView!
    @IBOutlet weak var retryBtn: UIButton!
    
    func gameStart(){
        // initilaze
        background.frame.origin = CGPoint.zero
        bird.image = UIImage(named: "bird_normal.png")
        bird.center = CGPoint(x: 60, y: screenH / 2 )
        speed = 2
        score = 0
        scoreLabel.text = String(score)
        for pipe in pipes {
            pipe.removeFromSuperview()
        }
        pipes.removeAll()
        gameoverLabel.isHidden = true
        retryBtn.isHidden = true
        
        animeTimer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true, block: { (t) in
            if self.background.center.x > 0 {
                self.background.center.x -= 3
            }
            else {
                self.background.center.x = self.screenW
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
                    //self.gemeOver()
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
            let pipeH: CGFloat = CGFloat((Int(arc4random()) % 5 + 1 ) * 100 )
            let pipe = UIImageView()
            pipe.image = UIImage(named: "pipe.png")
            pipe.frame.size = CGSize(width: 70, height: 800)
            pipe.frame.origin = CGPoint(x: self.screenW, y: pipeH)
            self.pipes.append(pipe)
            self.view.addSubview(pipe)
            
            self.view.bringSubview(toFront: self.bird)
            self.view.bringSubview(toFront: self.gameoverLabel)
            self.view.bringSubview(toFront: self.retryBtn)
        })
        
    }
    func gameOver() {
        animeTimer.invalidate()
        pipeTimer.invalidate()
        hitSound.play()
        bird.image = UIImage(named: "bird_confusion.png")
        gameoverLabel.isHidden = false
        retryBtn.isHidden = false
    }
    
    @IBAction func retry(_ sender: Any){
        gameStart()
    }
}

