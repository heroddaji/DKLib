//
//  AudioHelper.swift
//  truyencotich
//
//  Created by dai on 9/21/15.
//  Copyright © 2015 daitran. All rights reserved.
//  h

import UIKit
import AVFoundation

class DKAudioController {

    var audioPlayer = AVAudioPlayer()
    func play(audioFile:String){
        if let soundFilePath = NSBundle.mainBundle().pathForResource(audioFile, ofType: "m4a"){
            let soundFileUrl = NSURL.fileURLWithPath(soundFilePath)
            do {
                audioPlayer = try AVAudioPlayer(contentsOfURL: soundFileUrl)
                audioPlayer.play()
            }
            catch let error as NSError {
                assert(false, error.localizedDescription)
            }
        }
        
    }
    
    func jumpTo(jumpPercentage: Double){
        //audioPlayer.pause()
        //let isJumped = audioPlayer.playAtTime(audioPlayer.duration * jumpPercentage)
        //audioPlayer.play()
    
        audioPlayer.currentTime = audioPlayer.duration * jumpPercentage
        
    }
}
