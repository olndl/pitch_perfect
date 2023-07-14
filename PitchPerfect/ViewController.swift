//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Ольга Ширявцева on 10.07.2023.
//

import UIKit

class ViewController: UIViewController {

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
    }
    
    @IBAction func stopButton(_ sender: Any) {
        recordButtonComponent.isEnabled = true
        stopButtonComponent.isEnabled = false
        recordingLabel.text = "Tap to Record"
    }
}

