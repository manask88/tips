//
//  ViewController.swift
//  tips
//
//  Created by Manuel Nakamurakare on 1/16/15.
//  Copyright (c) 2015 handsfreelearning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let delayBeforeErase=(-6)
    
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!

    @IBOutlet weak var totalOneLabel: UILabel!
    @IBOutlet weak var totalTwoLabel: UILabel!
    @IBOutlet weak var totalThreeLabel: UILabel!
    @IBOutlet weak var totalFourLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var tipOne = defaults.integerForKey("tipOne")
        var tipTwo = defaults.integerForKey("tipTwo")
        var tipThree = defaults.integerForKey("tipThree")
        var billAmount=defaults.integerForKey("billAmount")
        
        billField.text=String(billAmount)
        tipControl.setTitle(String(tipOne)+"%", forSegmentAtIndex: 0)
        tipControl.setTitle(String(tipTwo)+"%", forSegmentAtIndex: 1)
        tipControl.setTitle(String(tipThree)+"%", forSegmentAtIndex: 2)
        
        
        
        var oldDate = defaults.objectForKey("oldDate") as NSDate
        println(oldDate.timeIntervalSinceNow)
        
        if (Int(oldDate.timeIntervalSinceNow)<delayBeforeErase)
        {
            billField.text="0"
        }
        calculateTip()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var currentDate = NSDate()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func sayHello(personName: String) -> String {
        let greeting = "Hello, " + personName + "!"
        return greeting
    }

    
    
    func calculateTip(){
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var tipOne = defaults.integerForKey("tipOne")
        var tipTwo = defaults.integerForKey("tipTwo")
        var tipThree = defaults.integerForKey("tipThree")
        
        var tipPercentages = [tipOne,tipTwo,tipThree]
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
        var currentDate = NSDate()

        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(currentDate, forKey: "oldDate")
        calculateTip()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onBillAmountChange(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger((billField.text as NSString).integerValue, forKey: "billAmount")
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }
    
}

