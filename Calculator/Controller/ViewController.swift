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
            displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            
            displayValue = calculator.calculate(symbol: calcMethod) ?? 0
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

