//
//  BaseViewController.swift
//  tips
//
//  Created by Manuel Nakamurakare on 1/19/15.
//  Copyright (c) 2015 handsfreelearning. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getTipPredefinedValues() -> (tipOne:Int, tipTwo:Int, tipThree:Int) {
        var tipOne = defaults.integerForKey("tipOne")
        var tipTwo = defaults.integerForKey("tipTwo")
        var tipThree = defaults.integerForKey("tipThree")
        
        return (tipOne, tipTwo,tipThree)
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
