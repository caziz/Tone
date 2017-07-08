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
    var recordedText: String?
    
    var speechToText: SpeechToText?
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == Constants.Segue.showEntryView {
                // copy recorded text to new view controller
                let entryViewController = segue.destination as! EntryViewController
                entryViewController.recordedText = self.recordedText

            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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
            self.recordedText = results.bestTranscript
            print(results.bestTranscript)
        }

    }
    
    // resets recorder
    func stopListening() {
        speechToText?.stopRecognizeMicrophone()
    }
    
    
}
