//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Hector Mendoza on 10/17/18.
//  Copyright © 2018 Hector Mendoza. All rights reserved.
//

import Foundation

class CalculatorLogic {
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        switch symbol {
        case "+/-":
            return number * -1
        case "AC":
            return 0
        case "%":
            return number / 100
        default:
            return nil
        }
    }
}
