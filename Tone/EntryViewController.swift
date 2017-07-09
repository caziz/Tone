//
//  EntryViewController.swift
//  Tone
//
//  Created by Christopher Aziz on 7/8/17.
//  Copyright © 2017 Christopher Aziz. All rights reserved.
//

import UIKit
import ToneAnalyzerV3


class EntryViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        while(!Entry.textReceived) {}
        Entry.textReceived = false
        textView.text = Entry.text
    }
    @IBAction func saveEntry(_ sender: Any) {
            getTones(recordedText: textView.text)
            performSegue(withIdentifier: Constants.Segue.showResultsView, sender: self)
    }
    
    func getTones(recordedText: String) {
        // access IBM ToneAnalyzer API, call saveAndSeeResults
        let toneAnalyzer = ToneAnalyzer(username: Constants.ToneAnalyzer.username, password: Constants.ToneAnalyzer.password, version: Constants.ToneAnalyzer.version)
        let failure = { (error: Error) in print(error) }
        toneAnalyzer.getTone(ofText: recordedText, failure: failure) { result in
            var tones : [String : Double] = [:]
            for type in result.documentTone {
                for tone in type.tones {
                    tones[tone.name] = tone.score
                }
            }
            self.saveTones(tones: tones)
        }
    }
    
    func saveTones(tones: [String : Double]) {
        Entry.agreeableness = tones["Agreeableness"] ?? 0
        Entry.analytical = tones["Analytical"] ?? 0
        Entry.anger = tones["Anger"] ?? 0
        Entry.confident = tones["Confident"] ?? 0
        Entry.conscientiousness = tones["Conscientiousness"] ?? 0
        Entry.disgust = tones["Disgust"] ?? 0
        Entry.emotionalRange = tones["Emotional Range"] ?? 0
        Entry.extraversion = tones["Extraversion"] ?? 0
        Entry.fear = tones["Fear"] ?? 0
        Entry.joy = tones["joy"] ?? 0
        Entry.openness = tones["Openness"] ?? 0
        Entry.sadness = tones["Sadness"] ?? 0
        Entry.tentative = tones["Tentative"] ?? 0
        Entry.tonesReceived = true
    }
}
