//
//  PlaySoundsViewController.swift
//  Voice Changer
//
//  Created by Anuja Tupe on 12/27/14.
//  Copyright (c) 2014 Gravity. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
            println(filePath)
            var filePathUrl = NSURL.fileURLWithPath(filePath)
            audioPlayer = AVAudioPlayer(contentsOfURL: filePathUrl, error: nil)
            audioPlayer.enableRate = true
        } else {
            println("The file path is empty")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func stopAudioSetRateAndCurrentTimeStartAudio(rate: Float, currentTime: NSTimeInterval) {
        audioPlayer.stop()
        audioPlayer.rate = rate
        audioPlayer.currentTime = currentTime
        audioPlayer.play()
    }
    
    @IBAction func playSlowAudio(sender: UIButton) {
        stopAudioSetRateAndCurrentTimeStartAudio(0.5, currentTime: 0.0)
    }
    
    @IBAction func playFastAudio(sender: UIButton) {
        stopAudioSetRateAndCurrentTimeStartAudio(1.5, currentTime: 0.0)
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        audioPlayer.stop()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
