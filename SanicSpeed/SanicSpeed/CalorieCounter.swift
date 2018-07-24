//
//  CalorieCounter.swift
//  SanicSpeed
//
//  Created by Jed Guintu on 7/24/18.
//  Copyright © 2018 Jed Guintu. All rights reserved.
//

import Foundation
import UIKit

class CalorieCounterClass: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var maxCalorieIntake: UITextField!
    @IBOutlet weak var addCal: UITextField!
    @IBOutlet weak var subCal: UITextField!
    
    @IBOutlet weak var userCal: UILabel!
    @IBOutlet weak var calCap: UILabel!
    
    
    @IBAction func resetButtonPressed(_ sender: Any) {
    }
    

    @IBAction func goButtonPressed(_ sender: Any) {
        maxCalIntake()
    }
    
    func maxCalIntake() {
        let maxCalories :Int? = Int(maxCalorieIntake.text!)
        
        if maxCalories == nil {
            print("nothing to show here")
        }
        else if maxCalories != nil {
            calCap.text = "\(maxCalories ?? 0)"
        }
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.hideKeyboardWhenTappedAround()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
