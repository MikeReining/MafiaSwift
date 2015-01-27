//
//  ViewController.swift
//  MafiaSwift
//
//  Created by Michael Reining on 1/26/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var model: Model?
    
    @IBOutlet weak var playerSlider: UISlider!
    @IBOutlet weak var playersLabel: UILabel!
    @IBOutlet weak var mafiaOrSherifSegmentedControl: UISegmentedControl!
    
    @IBAction func sliderChanged(sender: AnyObject) {
        var sliderValue = Int(playerSlider.value)
        playersLabel.text = "Select Number of Players: \(sliderValue)"
    }
    
    @IBAction func launchGameButtonPressed(sender: AnyObject) {
        model = Model(players: Int(playerSlider.value))
        model!.launchGame()
    }
    
    @IBAction func segmentedControlChanged(sender: AnyObject) {
        if mafiaOrSherifSegmentedControl.selectedSegmentIndex == 1 {
            let alert = UIAlertController(title: "Mafia Mode Coming Soon", message: "The Mafia mode has not been implemented yet.  Playing as Sherif is also fun!", preferredStyle: .Alert)
            let action = UIAlertAction(title: "Ok, let's catch some Mafia!", style: .Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nvc = segue.destinationViewController as GameViewController
        nvc.model = self.model
    }
    

}

