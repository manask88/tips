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
        
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        tipOne.text = String(defaults.integerForKey("tipOne"))
        tipTwo.text = String(defaults.integerForKey("tipTwo"))
        tipThree.text = String(defaults.integerForKey("tipThree"))

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)

    }
    
    @IBAction func onSave(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger((tipOne.text as NSString).integerValue, forKey: "tipOne")
        defaults.setInteger((tipTwo.text as NSString).integerValue, forKey: "tipTwo")
        defaults.setInteger((tipThree.text as NSString).integerValue, forKey: "tipThree")
        defaults.synchronize()
        
        
        println("saving")
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
