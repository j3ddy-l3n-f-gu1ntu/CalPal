//
//  PaceCalculatorController.swift
//  SanicSpeed
//
//  Created by Jed Guintu on 7/23/18.
//  Copyright © 2018 Jed Guintu. All rights reserved.
//

import Foundation
import UIKit

class PaceCalculatorClass: UIViewController {
    
    
    @IBOutlet weak var paceResultDisplay: UILabel!
    @IBOutlet weak var hourInput: UITextField!
    @IBOutlet weak var secInput: UITextField!
    @IBOutlet weak var minuteInput: UITextField!
    @IBOutlet weak var distanceInput: UITextField!
    
    @IBAction func calcPaceButton(_ sender: Any) {
        var hourInputConvert :Double? = Double(hourInput.text!)
        var secInputConvert :Double? = Double(secInput.text!)
        var minuteInputConvert :Double? = Double(minuteInput.text!)
        var distanceInputConvert :Double? = Double(distanceInput.text!)
        if hourInputConvert == nil {
            hourInputConvert = 0.0
        }
        if minuteInputConvert == nil {
            minuteInputConvert = 0.0
        }
        if secInputConvert == nil {
            secInputConvert = 0.0
        }
        if distanceInputConvert == 0 || distanceInputConvert == nil {
            paceResultDisplay.text = "please input a distance."
        }
        else {
            let hoursToSeconds = (hourInputConvert!) * 60 * 60
            let minuteToSeconds = minuteInputConvert! * 60
            let allConvertedToSeconds = (minuteToSeconds + hoursToSeconds + secInputConvert!)
            var paceResult = (allConvertedToSeconds / 60) / distanceInputConvert!
            let remainderForPace = paceResult.truncatingRemainder(dividingBy: 1)
            let secondsForPaceResult = (remainderForPace * 60) * 0.01
            let finalPace = (paceResult - remainderForPace) + secondsForPaceResult
            
            print (finalPace)
            paceResultDisplay.text = "\(finalPace) minute(s) per mile"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

