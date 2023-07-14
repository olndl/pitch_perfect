//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Ольга Ширявцева on 10.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func recordButton(_ sender: Any) {
        recordingLabel.text = "Recording in Progress"
    }
    
    @IBAction func stopButton(_ sender: Any) {
        recordingLabel.text = "stop recording button was pressed"
    }
}

