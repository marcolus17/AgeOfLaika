//
//  ViewController.swift
//  AgeOfLaika
//
//  Created by Nicholas Markworth on 2/19/15.
//  Copyright (c) 2015 Nick Markworth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var humanYearsLabel: UILabel!
    @IBOutlet weak var ageErrorLabel: UILabel!
    @IBOutlet weak var dogAgeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func convertHumanAgeToDogYears(sender: UIButton) {
        // Check to see if text field is empty or only contains whitespaces
        let whitespaceSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        if dogAgeTextField.text.stringByTrimmingCharactersInSet(whitespaceSet) != "" {
            // Check to see if string converted to Int properly
            let numberFromTextField: Int? = dogAgeTextField.text.toInt()
            if numberFromTextField != nil {
                // Get Int value for age and convert to dog years
                ageErrorLabel.hidden = true
                let dogAge = Double(numberFromTextField!)
                var humanAge:Double = 0
                if dogAge > 2 {
                    humanAge = (2 * 10.5) + (4 * (dogAge - 2))
                }
                else {
                    humanAge = dogAge * 10.5
                }
                humanYearsLabel.hidden = false
                humanYearsLabel.text = "\(humanAge)"
            }
            else {
                // Show error
                ageErrorLabel.hidden = false
                humanYearsLabel.hidden = true
            }
        }
        else {
            // Show error
            ageErrorLabel.hidden = false
            humanYearsLabel.hidden = true
        }
        
        dogAgeTextField.text = ""
        dogAgeTextField.resignFirstResponder()
    }
}

