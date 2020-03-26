//
//  Audio.swift
//  goBirdVer2
//
//  Created by 佐野哲也 on 2020/03/22.
//  Copyright © 2020 佐野哲也. All rights reserved.
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
