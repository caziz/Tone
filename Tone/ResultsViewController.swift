//
//  ResultsViewController.swift
//  Tone
//
//  Created by Christopher Aziz on 7/8/17.
//  Copyright © 2017 Christopher Aziz. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var middleCircle: CircleGraphView!
    
    @IBOutlet weak var percentageLabel: UILabel!
    var selectedRow = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        while(!Entry.tonesReceived) {}
        Entry.tonesReceived = false
        let backgroundTrackColor = UIColor(white: 0.15, alpha: 1.0)
        
        middleCircle.arcWidth = 20.0
        middleCircle.arcColor = UIColor.blue
        middleCircle.arcBackgroundColor = backgroundTrackColor
        
        print("Entry Analytical: \(Entry.analytical)")
        print("Entry Agreeableness: \(Entry.agreeableness)")
        print("Entry Anger: \(Entry.anger)")
        print("Entry Confident: \(Entry.confident)")
        print("Entry Conscientiousness: \(Entry.conscientiousness)")
        print("Entry Disgust: \(Entry.disgust)")
        print("Entry Emotional Range: \(Entry.emotionalRange)")
        print("Entry Extraversion: \(Entry.extraversion)")
        print("Entry Fear: \(Entry.fear)")
        print("Entry Joy: \(Entry.joy)")
        print("Entry Openness: \(Entry.openness)")
        
        percentageLabel.text = pickerView.selectedRow(inComponent: 0).description

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ResultsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 12
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch selectedRow {
        case 0:
            percentageLabel.text = "\(Int(100*Entry.anger))%"
            middleCircle.endArc = CGFloat(Entry.anger)
            middleCircle.arcColor = UIColor.red

        case 1:
            percentageLabel.text = "\(Int(100*Entry.disgust))%"
            middleCircle.endArc = CGFloat(Entry.disgust)
            middleCircle.arcColor = UIColor.green

        case 2:
            percentageLabel.text = "\(Int(100*Entry.fear))%"
            middleCircle.endArc = CGFloat(Entry.fear)
            middleCircle.arcColor = UIColor.purple

        case 3:
            percentageLabel.text = "\(Int(100*Entry.joy))%"
            middleCircle.endArc = CGFloat(Entry.joy)
            middleCircle.arcColor = UIColor.yellow
        case 4:
            percentageLabel.text = "\(Int(100*Entry.sadness))%"
            middleCircle.endArc = CGFloat(Entry.sadness)
            middleCircle.arcColor = UIColor.blue
        case 5:
            percentageLabel.text = "\(Int(100*Entry.openness))%"
            middleCircle.endArc = CGFloat(Entry.openness)
            middleCircle.arcColor = UIColor.orange

        case 6:
            percentageLabel.text = "\(Int(100*Entry.conscientiousness))%"
            middleCircle.endArc = CGFloat(Entry.conscientiousness)
            middleCircle.arcColor = UIColor.cyan
        case 7:
            percentageLabel.text = "\(Int(100*Entry.extraversion))%"
            middleCircle.endArc = CGFloat(Entry.extraversion)
            middleCircle.arcColor = UIColor.orange
        case 8:
            percentageLabel.text = "\(Int(100*Entry.agreeableness))%"
            middleCircle.endArc = CGFloat(Entry.agreeableness)
            middleCircle.arcColor = UIColor.yellow
        case 9:
            percentageLabel.text = "\(Int(100*Entry.confident))%"
            middleCircle.endArc = CGFloat(Entry.confident)
            middleCircle.arcColor = UIColor.red
        case 10:
            percentageLabel.text = "\(Int(100*Entry.tentative))%"
            middleCircle.endArc = CGFloat(Entry.tentative)
            middleCircle.arcColor = UIColor.cyan
        case 11:
            percentageLabel.text = "\(Int(100*Entry.analytical))%"
            middleCircle.endArc = CGFloat(Entry.analytical)
            middleCircle.arcColor = UIColor.brown
        default:
            break
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.black
        switch row {
        case 0:
            pickerLabel.text = "Anger"
        case 1:
            pickerLabel.text = "Disgust"
        case 2:
            pickerLabel.text = "Fear"
        case 3:
            pickerLabel.text = "Joy"
        case 4:
            pickerLabel.text = "Sadness"
        case 5:
            pickerLabel.text = "Openness"
        case 6:
            pickerLabel.text = "Conscientiousness"
        case 7:
            pickerLabel.text = "Extraversion"
        case 8:
            pickerLabel.text = "Agreeableness"
        case 9:
            pickerLabel.text = "Confidence"
        case 10:
            pickerLabel.text = "Tentativeness"
        case 11:
            pickerLabel.text = "Analysis"
        default: break
        }
        self.selectedRow = row
        pickerLabel.font = UIFont(name: "Helvetica Neue", size: 30)
        pickerLabel.textAlignment = NSTextAlignment.center
        return pickerLabel
    }

        // adjusts picker row size to fit picker font
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
        
    
}
