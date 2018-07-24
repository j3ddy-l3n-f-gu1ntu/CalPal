//
//  PaceCalculatorController.swift
//  SanicSpeed
//
//  Created by Jed Guintu on 7/23/18.
//  Copyright © 2018 Jed Guintu. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class PaceCalculatorClass: UIViewController, UITextFieldDelegate {
    
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
            let finalPaceRounded = (finalPace * 100).rounded() / 100
            
            print (finalPaceRounded)
            paceResultDisplay.text = "\(finalPaceRounded) minute(s) per mile"
        }
    }
    
    func textFieldShouldReturn(_ hourInput: UITextField, secInput: UITextField, minuteInput: UITextField, distanceInput: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        secInput.delegate = self
        hourInput.delegate = self
        minuteInput.delegate = self
        distanceInput.delegate = self
        self.hideKeyboardWhenTappedAround()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

