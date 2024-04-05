//
//  Model.swift
//  MyCalculator
//
//  Created by Polina Rybalko on 4/3/24.
//

import SwiftUI

enum Operation{
    case addition, substract, multiply, divide, none
}

enum Buttons: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case plus = "+"
    case minus = "-"
    case multiple = "x"
    case divide = "/"
    case equal = "="
    case decimal = "."
    case percent = "%"
    case negative = "+/-"
    case clear = "AC"
    
    var buttonColor:  Color{
        switch self{
        case.clear, .negative, .percent:
            return Color.greySecond
        case .divide, .multiple, .minus, .plus, .equal:
            return Color.OrangeCalc
        default:
            return Color.Dark
        }
    }
    
    var buttonFontColor:  Color{
        switch self{
        case.clear, .negative, .percent:
            return Color.black
        default:
            return Color.white
        }
    }
}

var history: [(String, Double)] = []
