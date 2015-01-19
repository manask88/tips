//
//  SettingsViewController.swift
//  tips
//
//  Created by Manuel Nakamurakare on 1/18/15.
//  Copyright (c) 2015 handsfreelearning. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipOne: UITextField!
    
    @IBOutlet weak var tipTwo: UITextField!
    
    @IBOutlet weak var tipThree: UITextField!
    @IBOutlet var viewSettings: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("test")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTipOneChange(sender: AnyObject) {
       
        
    }
 
    @IBAction func onTipTwoChange(sender: AnyObject) {
    }
 
    @IBAction func onTipThreeChange(sender: AnyObject) {
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)

    }
    
    
    
    @IBAction func onClickSaveButton(sender: AnyObject) {
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger((tipOne.text as NSString).integerValue, forKey: "tipOne")
        defaults.setInteger((tipTwo.text as NSString).integerValue, forKey: "tipTwo")
        defaults.setInteger((tipThree.text as NSString).integerValue, forKey: "tipThree")
        defaults.synchronize()
        
    }
    
    
    /*
    // MARK: - Navigation

    @IBAction func onClickSaveButton(sender: AnyObject) {
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
