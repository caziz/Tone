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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textView.text = recordedText
        print(textView.text)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension EntryViewController {
    
    func getTones(recordedText: String) ->  [[String : Double]] {
        var tones = [[String : Double]]()
        let toneAnalyzer = ToneAnalyzer(username: Constants.ToneAnalyzer.username, password: Constants.ToneAnalyzer.password, version: Constants.ToneAnalyzer.version)
        let failure = { (error: Error) in print(error) }
        toneAnalyzer.getTone(ofText: recordedText, failure: failure) { result in
            for type in 0..<result.documentTone.count {
                for tone in result.documentTone[type].tones {
                    tones[type][tone.name] = tone.score
                }
            }
        }
        return tones
    }
}
