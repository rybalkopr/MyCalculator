//
//  MainView.swift
//  MyCalculator
//
//  Created by Polina Rybalko on 4/3/24.
//

import SwiftUI

struct MainView: View {
    
    //MARK: Property
    @State private var value = "0"
    @State private var number: Double = 0.0
    @State private var currentOperation: Operation = .none
    
    let buttonsArray: [[Buttons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        
        ZStack{
            //MARK: Background
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 12) {
                Spacer()
                //MARK: Display
                HStack{
                    Spacer()
                    Text(value)
                        .foregroundColor(.white)
                        .font(.system(size: 90))
                        .fontWeight(.light)
                        .padding(.horizontal, 30)
                    
                }
                
                //MARK: Buttons
                ForEach(self.buttonsArray, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button{
                                self.didTap(item: item)
                            } label: {
                                Text(item.rawValue)
                                    .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight())
                                    .foregroundColor(item.buttonFontColor)
                                    .background(Color(item.buttonColor))
                                    .font(.system(size: 35))
                                    .cornerRadius(40)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
    
    //MARK: Tap Button Method
    func didTap(item: Buttons){
        switch item {
        case .plus, .minus, .multiple, .divide:
            currentOperation = item.buttonToOperation()
            number = Double(value) ?? 0
            value = "0"
        case .equal:
            if let currentValue = Double(value){
                value = formatResult(performOperation(currentValue: currentValue))
            }
        case .decimal:
            if !value.contains("."){
                value += "."
            }
        case .percent:
            if let currentValue = Double(value) {
                value = formatResult(currentValue / 100)
            }
        case .negative:
            if let currentValue = Double(value){
                value = formatResult(-currentValue)
            }
        case .clear:
            value = "0"
        default:
            if value == "0"{
                value = item.rawValue
            } else {
                value += item.rawValue
            }
        }
    }
    
    //MARK: Size of buttons methods
    func buttonWidth(item:Buttons) -> CGFloat {
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = 5 * spacing
        let zeroTotalSpacing: CGFloat = 4 * spacing
        let totalColums: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        if item == .zero{
            return(screenWidth - zeroTotalSpacing) / totalColums * 2
        }
        
        return (screenWidth - totalSpacing) / totalColums
    }
    
    func buttonHeight() -> CGFloat {
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = 5 * spacing
        let totalColums: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        return (screenWidth - totalSpacing) / totalColums
    }
    
    //MARK: Remove last zero Method
    func formatResult(_ result: Double) -> String{
        return String(format: "%g", result)
    }
    
    //MARK: Helper Calculate Method
    func performOperation(currentValue: Double) -> Double {
         
        switch currentOperation {
        case .addition:
            return number + currentValue
        case .substract:
            return number - currentValue
        case .multiply:
            return number * currentValue
        case .divide:
            return number / currentValue
        default:
            return currentValue
        }
    }
    
    
    struct MainView_Prewiews: PreviewProvider{
        static var previews: some View{
            MainView()
        }
    }
}
