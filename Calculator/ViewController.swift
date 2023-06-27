//
//  ViewController.swift
//  Calculator
//
//  Created by Admin on 24/05/2023.
//

import UIKit

class ViewController: UIViewController {
 
    
    @IBAction func PerformOperation(_ sender: UIButton) {
        if userInTheMiddleOfTyping{
                   brain.setOperand(displayValue)
                   userInTheMiddleOfTyping = false
               }
               if let mathematicalSymbol = sender.currentTitle{
                   brain.performOperation(mathematicalSymbol)
               }
                if let result = brain.result{
                    
                    displayValue = result
//                    print("display value \(displayValue), result \(result)")
                }
//               }else{
//                   displayValue = 0.0
//               }
    }
    private var brain = CalculaterBrain()
    
    var displayValue:Double{
        get{
            
//            if let text = display.text, let doubleValue = Double(text){
//
//            }
            return Double(display.text!)!
                   }
        set(myNweValue){
                       display.text = String(myNweValue)
                }
        
        }
    
    @IBOutlet weak var display: UILabel!
    
    var userInTheMiddleOfTyping: Bool = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        print("\(digit) Was Called")
        if userInTheMiddleOfTyping{
            let textCurrentlyDisplay = display.text!
            display.text = textCurrentlyDisplay + digit
        }else{
            display.text=digit
            userInTheMiddleOfTyping = true
        }
        
    }
}
