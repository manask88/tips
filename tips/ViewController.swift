//
//  ViewController.swift
//  tips
//
//  Created by Manuel Nakamurakare on 1/16/15.
//  Copyright (c) 2015 handsfreelearning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let delayBeforeErase=(-600)
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!

    @IBOutlet weak var totalOneLabel: UILabel!
    @IBOutlet weak var totalTwoLabel: UILabel!
    @IBOutlet weak var totalThreeLabel: UILabel!
    @IBOutlet weak var totalFourLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    var defaults: NSUserDefaults!
   
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("viewWillAppear")
      
        var tipValues=getTipPredefinedValues()
        
        tipControl.setTitle(String(tipValues.0)+"%", forSegmentAtIndex: 0)
        tipControl.setTitle(String(tipValues.1)+"%", forSegmentAtIndex: 1)
        tipControl.setTitle(String(tipValues.2)+"%", forSegmentAtIndex: 2)
        
        calculateTip()
        
    }
    
    func getTipPredefinedValues() -> (tipOne:Int, tipTwo:Int, tipThree:Int) {
        var tipOne = defaults.integerForKey("tipOne")
        var tipTwo = defaults.integerForKey("tipTwo")
        var tipThree = defaults.integerForKey("tipThree")

        return (tipOne, tipTwo,tipThree)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("viewDidLoad")

        defaults = NSUserDefaults.standardUserDefaults()

        
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

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onBillAmountChange(sender: AnyObject) {
        defaults.setInteger((billField.text as NSString).integerValue, forKey: "billAmount")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        var currentDate = NSDate()
        defaults.setObject(currentDate, forKey: "oldDate")
        println("view did disappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

