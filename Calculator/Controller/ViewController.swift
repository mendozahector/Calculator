//
//  ViewController.swift
//  Calculator
//
//  Created by Hector Mendoza on 10/17/18.
//  Copyright © 2018 Hector Mendoza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            
            return number
        }
        
        set {
            if newValue.isInfinite {
                displayLabel.text = "Error"
            } else {
                if (newValue.rounded() == newValue) {
                    displayLabel.text = String(format: "%.0f", newValue)
                } else {
                    displayLabel.text = String(newValue)
                }
            }
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        if displayLabel.text != "Error" {
            isFinishedTypingNumber = true
            
            calculator.setNumber(displayValue)
            
            if let calcMethod = sender.currentTitle {
                if let result = calculator.calculate(symbol: calcMethod) {
                    displayValue = result
                }
            }
        } else if displayLabel.text == "Error" && sender.currentTitle == "AC" {
            displayValue = 0
        }
        
        
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if !displayLabel.text!.contains(".") || numValue != "." {
                if isFinishedTypingNumber {
                    displayLabel.text = numValue
                    
                    isFinishedTypingNumber = false
                } else {
                    displayLabel.text = displayLabel.text! + numValue
                }
            }
        }
    }
    
}

