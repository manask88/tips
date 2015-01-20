//
//  SettingsViewController.swift
//  tips
//
//  Created by Manuel Nakamurakare on 1/18/15.
//  Copyright (c) 2015 handsfreelearning. All rights reserved.
//

import UIKit

class SettingsViewController: BaseViewController {

    @IBOutlet weak var tipOne: UITextField!
    @IBOutlet weak var tipTwo: UITextField!
    @IBOutlet weak var tipThree: UITextField!
    
    @IBOutlet var viewSettings: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tipValues=getTipPredefinedValues()
        
        tipOne.text = String(tipValues.0)
        tipTwo.text = String(tipValues.1)
        tipThree.text = String(tipValues.2)
        
    }
  
    @IBAction func onDone(sender: AnyObject) {
        
        defaults.setInteger((tipOne.text as NSString).integerValue, forKey: "tipOne")
        defaults.setInteger((tipTwo.text as NSString).integerValue, forKey: "tipTwo")
        defaults.setInteger((tipThree.text as NSString).integerValue, forKey: "tipThree")
        defaults.synchronize()
        
        performSegueWithIdentifier("mainScreen", sender: self)
    }
    
}
