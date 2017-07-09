//
//  MainViewController.swift
//  Tone
//
//  Created by Christopher Aziz on 7/8/17.
//  Copyright © 2017 Christopher Aziz. All rights reserved.
//

import UIKit
import SpeechToTextV1

class MainViewController: UIViewController {

    var isRecording = false
    var speechToText: SpeechToText?
    
    @IBOutlet weak var recordButton: UIButton!
    @IBAction func unwindToMainView(_ segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func toggleRecording(_ sender: UIButton) {
        
        self.recordButton.setImage(UIImage(named: "mic2"), for: .selected)
        
        let bounds = self.recordButton.bounds
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseIn, animations: {
            self.recordButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height)
        }, completion: nil)
        
        if isRecording {
            isRecording = false
            stopListening()
            // show entry
            performSegue(withIdentifier: Constants.Segue.showEntryView, sender: sender)
        } else {
            isRecording = true
            startListening()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}


extension MainViewController {
    // constantly updates recordedText with speech
    func startListening() {
        speechToText = SpeechToText(username: Constants.SpeechToText.username, password: Constants.SpeechToText.password)
        var settings = RecognitionSettings(contentType: .opus)
        settings.continuous = true
        settings.interimResults = true
        let failure = { (error: Error) in print(error) }
        speechToText?.recognizeMicrophone(settings: settings, failure: failure) { results in
            Entry.text = results.bestTranscript
            Entry.textReceived = true
        }
    }
    
    // resets recorder
    func stopListening() {
        speechToText?.stopRecognizeMicrophone()
    }
    
    
}
