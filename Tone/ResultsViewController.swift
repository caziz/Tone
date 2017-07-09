//
//  ResultsViewController.swift
//  Tone
//
//  Created by Christopher Aziz on 7/8/17.
//  Copyright © 2017 Christopher Aziz. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var tones = [String : Double]()


    @IBOutlet weak var resultsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        resultsLabel.text = "results:\n"
        
//        for tone in tones {
//            resultsLabel.text = ("\(resultsLabel.text) \(tone.key): \(tone.value)\n")
//        }
        for _ in CoreDataHelper.retrieveAllEntries() {
            print("PULLED FROM CORE DATA")
        }
        // Do any additional setup after loading the view.
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
