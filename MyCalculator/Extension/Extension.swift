//
//  Extension.swift
//  MyCalculator
//
//  Created by Polina Rybalko on 4/3/24.
//

import SwiftUI

extension Color{
    static let Dark = Color("Dark")
    static let GreyCalc = Color("GraySecond")
    static let OrangeCalc = Color("OrangeCalc")
  
}

extension Buttons {
    func buttonToOperation() -> Operation{
        switch self {
        case .plus:
            return.addition
        case .minus:
            return.substract
        case .multiple:
            return.multiply
        case .divide:
            return.divide
        default:
            return .none
        }
    }
}
