//
//  RecordAudioViewController.swift
//  PitchPerfect
//
//  Created by Ольга Ширявцева on 10.07.2023.
//

import UIKit
import AVFoundation

class RecodAudioViewController: UIViewController, AVAudioRecorderDelegate {
    
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
            audioRecorder.delegate = self
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
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if (flag) {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("recording was not successful")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playSoundVC = segue.destination as! PlaySoundsViewController
            let recorderAudioURL = sender as! URL
            playSoundVC.recordAudioURL = recorderAudioURL
        }
        
    }
}

