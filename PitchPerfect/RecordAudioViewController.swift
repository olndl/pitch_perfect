//
//  RecordAudioViewController.swift
//  PitchPerfect
//
//  Created by Ольга Ширявцева on 10.07.2023.
//

import UIKit
import AVFoundation

class RecodAudioViewController: UIViewController {
    
    var audioRecorder: AVAudioRecorder!

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButtonComponent: UIButton!
    @IBOutlet weak var stopButtonComponent: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopButtonComponent.isEnabled = false
    }

    @IBAction func recordButton(_ sender: Any) {
        recordingLabel.text = "Recording in Progress"
        stopButtonComponent.isEnabled = true
        recordButtonComponent.isEnabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
            let recordingName = "recordedVoice.wav"
            let pathArray = [dirPath, recordingName]
            let filePath = URL(string: pathArray.joined(separator: "/"))

            let session = AVAudioSession.sharedInstance()
            try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

            try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
            audioRecorder.isMeteringEnabled = true
            audioRecorder.prepareToRecord()
            audioRecorder.record()
    }
    
    @IBAction func stopButton(_ sender: Any) {
        recordButtonComponent.isEnabled = true
        stopButtonComponent.isEnabled = false
        recordingLabel.text = "Tap to Record"
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
    }
}

