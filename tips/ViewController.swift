//
//  ViewController.swift
//  tips
//
//  Created by Chris Hayduk on 12/29/15.
//  Copyright © 2015 Chris Hayduk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var numOfPeopleField: UITextField!
 
    let defaults = NSUserDefaults.standardUserDefaults()
    
   override func viewDidLoad() {
        let timeNow = NSDate()
        let timeLast = defaults.objectForKey("lastUsed") as? NSDate
    
        if ( timeLast != nil && timeNow.timeIntervalSinceDate(timeLast!) < 600)
        {
            billField.text = defaults.stringForKey("lastBillAmount")
        }
    
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var tipPercentage = defaults.doubleForKey("default_tip_percentage")
        
        if (tipPercentage == 0.1) {
            tipControl.selectedSegmentIndex = 0
        }
        else if (tipPercentage == 0.15){
            tipControl.selectedSegmentIndex = 1
        }
        else if (tipPercentage == 0.2) {
            tipControl.selectedSegmentIndex = 2
        }
        else {
            tipControl.selectedSegmentIndex = 1
            tipPercentage = 0.15
        }
        
        let numPeople = NSString(string: numOfPeopleField.text!).doubleValue
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = (billAmount + tip)/numPeople
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewDidAppear(animated: Bool){
        billField.becomeFirstResponder()
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.10, 0.15, 0.20]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let numPeople = NSString(string: numOfPeopleField.text!).doubleValue
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = (billAmount + tip)/numPeople
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        defaults.setObject(NSDate(), forKey: "lastUsed")
        defaults.setObject(billField.text, forKey: "lastBillAmount")
        defaults.synchronize()
    }

}

