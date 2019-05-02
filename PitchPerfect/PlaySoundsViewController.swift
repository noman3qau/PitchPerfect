//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Noman on 5/1/19.
//  Copyright © 2019 EvampSaanga. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    var recordedAudioURL: URL!
    
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAudio()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }

    @IBAction func playSoundsForButton(_ sender: UIButton){

        switch (ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
        
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton){

        stopAudio()
        
    }

    
    
}
