//
//  ResultsViewController.swift
//  Tone
//
//  Created by Christopher Aziz on 7/8/17.
//  Copyright © 2017 Christopher Aziz. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var outerCircle: CircleGraphView!
    @IBOutlet weak var middleCircle: CircleGraphView!
    @IBOutlet weak var innerCircle: CircleGraphView!
    override func viewDidLoad() {
        super.viewDidLoad()
        while(!Entry.tonesReceived) {}
        Entry.tonesReceived = false
        let backgroundTrackColor = UIColor(white: 0.15, alpha: 1.0)
        outerCircle.arcBackgroundColor = backgroundTrackColor
        outerCircle.arcWidth = 20.0
        outerCircle.arcColor = UIColor.yellow
        
        middleCircle.arcWidth = 20.0
        middleCircle.arcColor = UIColor.blue
        middleCircle.arcBackgroundColor = backgroundTrackColor
        
        innerCircle.arcColor = UIColor.red
        innerCircle.arcWidth = 20.0
        innerCircle.arcBackgroundColor = backgroundTrackColor
        
        outerCircle.endArc = CGFloat(Entry.analytical)
        middleCircle.endArc = CGFloat(Entry.disgust)
        innerCircle.endArc = CGFloat(Entry.agreeableness)
        
        print("Entry analytical: \(Entry.analytical)")
        print("Entry agreeableness: \(Entry.agreeableness)")
        print("Entry Anger: \(Entry.anger)")
        print("Entry Confident: \(Entry.confident)")
        print("Entry Conscientiousness: \(Entry.conscientiousness)")
        print("Entry Disgust: \(Entry.disgust)")
        print("Entry Emotional Range: \(Entry.emotionalRange)")
        print("Entry Extraversion: \(Entry.extraversion)")
        print("Entry Fear: \(Entry.fear)")
        print("Entry joy: \(Entry.joy)")
        print("Entry Openness: \(Entry.openness)")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
