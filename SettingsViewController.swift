//
//  SettingsViewController.swift
//  tips
//
//  Created by Chris Hayduk on 12/29/15.
//  Copyright © 2015 Chris Hayduk. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTip: UISegmentedControl!
  
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipPercentage = defaults.doubleForKey("default_tip_percentage")
        
        if (tipPercentage == 0.1) {
            defaultTip.selectedSegmentIndex = 0
        }
        else if (tipPercentage == 0.15){
            defaultTip.selectedSegmentIndex = 1
        }
        else if (tipPercentage == 0.2) {
            defaultTip.selectedSegmentIndex = 2
        }
        else {
            defaultTip.selectedSegmentIndex = 1
        }
    }
    
        @IBAction func valueChanged(sender: AnyObject) {
        let percentages = [0.1, 0.15, 0.2]
        let index = defaultTip.selectedSegmentIndex
        let percentageSelected = percentages[index]
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(percentageSelected, forKey: "default_tip_percentage")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
