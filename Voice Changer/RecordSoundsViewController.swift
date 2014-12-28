//
//  RecordSoundsViewController.swift
//  Voice Changer
//
//  Created by Anuja Tupe on 12/26/14.
//  Copyright (c) 2014 Gravity. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    
    
    @IBOutlet weak var recordingInProgress: UILabel!
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var recordButton: UIButton!
    
    var audioRecorder : AVAudioRecorder!
    var recordedAudio : RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        // Hide the stop button
        stopButton.hidden = true
        // Show the record button
        recordButton.enabled = true
    }


    @IBAction func stopRecordingAudio(sender: UIButton) {
        recordingInProgress.hidden = true
        //Enable the record button
        //recordButton.enabled = true
        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
    }
    
    @IBAction func recordAudio(sender: UIButton) {
        //Disable the record button
        recordButton.enabled = false
        //Show the stop button
        stopButton.hidden = false
        // Show text that the recording is in progress
        recordingInProgress.hidden = false
        // Record the voice
        println("Inside Record Audio..")
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) [0] as String
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        println(filePath)
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil )
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.record()
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        if (flag) {
            // Save the recorded audio
            recordedAudio = RecordedAudio()
            recordedAudio.filePathUrl = recorder.url
            recordedAudio.title = recorder.url.lastPathComponent
            // Move to the next scene aka perform segue
            self.performSegueWithIdentifier("stopRecordingSegway", sender: recordedAudio)
        } else {
            println("Recording was not successful")
            recordButton.enabled = true
            stopButton.hidden = true
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecordingSegway") {
            let playSoundsVC: PlaySoundsViewController = segue.destinationViewController as PlaySoundsViewController
            let data = sender as RecordedAudio
            playSoundsVC.recievedAudio = data
        }
    }
}

