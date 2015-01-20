//
//  BaseViewController.swift
//  tips
//
//  Created by Manuel Nakamurakare on 1/19/15.
//  Copyright (c) 2015 handsfreelearning. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var defaults: NSUserDefaults!

    override func viewDidLoad() {
        super.viewDidLoad()
        defaults = NSUserDefaults.standardUserDefaults()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getTipPredefinedValues() -> (tipOne:Int, tipTwo:Int, tipThree:Int) {
        var tipOne = defaults.integerForKey("tipOne")
        var tipTwo = defaults.integerForKey("tipTwo")
        var tipThree = defaults.integerForKey("tipThree")
        
        return (tipOne, tipTwo,tipThree)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    

}
