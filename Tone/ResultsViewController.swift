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
        outerCircle.arcWidth = 35.0
        
        middleCircle.arcWidth = 25.0
        middleCircle.arcColor = UIColor.white
        middleCircle.arcBackgroundColor = backgroundTrackColor
        
        innerCircle.arcColor = UIColor.red
        innerCircle.arcWidth = 20.0
        innerCircle.arcBackgroundColor = backgroundTrackColor
        
        outerCircle.endArc = CGFloat(Entry.joy)
        middleCircle.endArc = CGFloat(Entry.disgust)
        innerCircle.endArc = CGFloat(Entry.agreeableness)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
