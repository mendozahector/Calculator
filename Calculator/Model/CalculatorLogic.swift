//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Hector Mendoza on 10/17/18.
//  Copyright © 2018 Hector Mendoza. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100
            default:
                return nil
            }
        } else {
            return nil
        }
    }
}
