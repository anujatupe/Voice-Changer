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
    
    var audioPlayer: AVAudioPlayer!
    var recievedAudio: RecordedAudio!

    override func viewDidLoad() {
        super.viewDidLoad()
        audioPlayer = AVAudioPlayer(contentsOfURL: recievedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
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
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        
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
