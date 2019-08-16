//
//  Audio.swift
//  GoBird
//
//  Created by Sano Tetsuya on 2017/08/27.
//  Copyright © 2017年 CATK. All rights reserved.
//

import AVFoundation

class Audio {
    var audioPlayer = AVAudioPlayer()
    
    func set(named: String, volume: Float){
        let path = Bundle.main.path(forResource: named, ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.volume = volume
            audioPlayer.prepareToPlay()
        } catch {
            Swift.print("error")
        }
    }
    
    func play(){
        audioPlayer.play()
    }
}
