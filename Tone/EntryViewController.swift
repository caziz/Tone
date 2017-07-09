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

    var recordedText: String?
    var tones = [String : Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = recordedText
        print(textView.text)
    }
    @IBAction func saveEntry(_ sender: Any) {
        if textView.text != "" {
            saveTones(recordedText: textView.text)
            performSegue(withIdentifier: Constants.Segue.showResultsView, sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == Constants.Segue.showResultsView {
                
                print("segue")
                // copy tones to new view controller
                let resultsViewController = segue.destination as! ResultsViewController
                resultsViewController.tones = self.tones
                for tone in tones {
                    resultsViewController.resultsLabel.text = ("results: \(tone.key): \(tone.value)\n")
                }
            }
            
        }
    }
    
    func saveTones(recordedText: String) {
        // access IBM ToneAnalyzer API, call saveAndSeeResults
        let toneAnalyzer = ToneAnalyzer(username: Constants.ToneAnalyzer.username, password: Constants.ToneAnalyzer.password, version: Constants.ToneAnalyzer.version)
        let failure = { (error: Error) in print(error) }
        toneAnalyzer.getTone(ofText: recordedText, failure: failure) { result in
            for type in result.documentTone {
                for tone in type.tones {
                    self.tones[tone.name] = tone.score
                    print(tone.name)
                    print(tone.score)
                }
            }
            self.saveToCoreData(tones: self.tones)
        }
    }
    
    func saveToCoreData(tones: [String : Double]) {
        // save entry to core data
        let entry = CoreDataHelper.createEntry()
        entry.date = Date() as NSDate
        entry.text = recordedText
        entry.agreeableness = tones["Agreeableness"] ?? 0
        entry.analytical = tones["Analytical"] ?? 0
        entry.anger = tones["Anger"] ?? 0
        entry.confident = tones["Confident"] ?? 0
        entry.conscientiousness = tones["Conscientiousness"] ?? 0
        entry.disgust = tones["Disgust"] ?? 0
        entry.emotionalRange = tones["Emotional Range"] ?? 0
        entry.extraversion = tones["Extraversion"] ?? 0
        entry.fear = tones["Fear"] ?? 0
        entry.joy = tones["joy"] ?? 0
        entry.openness = tones["Openness"] ?? 0
        entry.sadness = tones["Sadness"] ?? 0
        entry.tentative = tones["Tentative"] ?? 0
        CoreDataHelper.saveEntry()
        
    }
}
