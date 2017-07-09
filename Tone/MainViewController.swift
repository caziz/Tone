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
    
    @IBAction func unwindToMainView(_ segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func toggleRecording(_ sender: UIButton) {
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
