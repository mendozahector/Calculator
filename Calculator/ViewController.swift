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
//    private var displayValue: Double {
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display label text to a Double")
        }
        
        if let calcMethod = sender.currentTitle {
            switch calcMethod {
            case "+/-":
                displayLabel.text = String(number * -1)
            case "AC":
                displayLabel.text = "0"
            case "%":
                displayLabel.text = String(number / 100)
            default:
                displayLabel.text = String(number)
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if displayLabel.text!.contains(".") && numValue == "." {
                    //we already have a decimal
            } else {
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

