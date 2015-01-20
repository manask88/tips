//
//  ViewController.swift
//  tips
//
//  Created by Manuel Nakamurakare on 1/16/15.
//  Copyright (c) 2015 handsfreelearning. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    let delayBeforeErase=(-600)
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!

    @IBOutlet weak var totalOneLabel: UILabel!
    @IBOutlet weak var totalTwoLabel: UILabel!
    @IBOutlet weak var totalThreeLabel: UILabel!
    @IBOutlet weak var totalFourLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var oldDate = defaults.objectForKey("oldDate") as NSDate
        
        if (Int(oldDate.timeIntervalSinceNow)<delayBeforeErase)
        {
            billField.text="0"
        }
        else
        {
            var billAmount=defaults.integerForKey("billAmount")
            billField.text=String(billAmount)

        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var tipValues=getTipPredefinedValues()
        
        tipControl.setTitle(String(tipValues.0)+"%", forSegmentAtIndex: 0)
        tipControl.setTitle(String(tipValues.1)+"%", forSegmentAtIndex: 1)
        tipControl.setTitle(String(tipValues.2)+"%", forSegmentAtIndex: 2)
        
        calculateTip()
        
    }
    

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        var currentDate = NSDate()
        defaults.setObject(currentDate, forKey: "oldDate")
    }
    
    func calculateTip(){
        var tipValues=getTipPredefinedValues()
        
        var tipPercentages = [tipValues.0,tipValues.1,tipValues.2]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).floatValue
        var tip = billAmount  * Float(tipPercentage)*0.01
        
        var total = billAmount + tip
        
        tipLabel.text=String(format:"$%.2f",tip)
        totalOneLabel.text=String(format:"$%.2f",total)
        totalTwoLabel.text=String(format:"$%.2f",total/2)
        totalThreeLabel.text=String(format:"$%.2f",total/3)
        totalFourLabel.text=String(format:"$%.2f",total/4)
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        calculateTip()
    }
    
    
    @IBAction func onBillAmountChange(sender: AnyObject) {
        defaults.setInteger((billField.text as NSString).integerValue, forKey: "billAmount")
    }
    
}

