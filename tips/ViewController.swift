//
//  ViewController.swift
//  tips
//
//  Created by Manuel Nakamurakare on 1/16/15.
//  Copyright (c) 2015 handsfreelearning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text="$0.00"
        println("viewDidload")
        
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var tipOne = defaults.integerForKey("tipOne")
        var tipTwo = defaults.integerForKey("tipTwo")
        var tipThree = defaults.integerForKey("tipThree")
        tipControl.setTitle(String(tipOne), forSegmentAtIndex: 0)
        tipControl.setTitle(String(tipTwo), forSegmentAtIndex: 1)
        tipControl.setTitle(String(tipThree), forSegmentAtIndex: 2)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//******shouls probably edit when click on save, not as sson at editing is done
    @IBAction func onEditingChanged(sender: AnyObject) {
      
        //*this should probably go on viewDidLoad, but for that I will nee dto have some global variables
        var defaults = NSUserDefaults.standardUserDefaults()
    
        var tipOne = defaults.integerForKey("tipOne")
        var tipTwo = defaults.integerForKey("tipTwo")
        var tipThree = defaults.integerForKey("tipThree")

        var tipPercentages = [tipOne,tipTwo,tipThree]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).floatValue
        var tip = billAmount * Float(tipPercentage/100)
        var total = billAmount + tip
  
        tipLabel.text=String(format:"$%.2f",tip)
        totalLabel.text=String(format:"$%.2f",total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        println("main screen")
    }
    
    
}

