//
//  ViewController.swift
//  Voice Changer
//
//  Created by Anuja Tupe on 12/26/14.
//  Copyright (c) 2014 Gravity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var recordButton: UIButton!
    
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
    }
}

