//
//  MainView.swift
//  MyCalculator
//
//  Created by Polina Rybalko on 4/3/24.
//

import SwiftUI

struct MainView: View {
    
    //MARK: Property
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
            
            VStack{
                //MARK: Display
                HStack{
                    Spacer()
                    Text("0")
                        .foregroundColor(.white)
                        .font(.system(size: 90))
                        .fontWeight(.light)
                    
                }
                
                //MARK: Buttons
                ForEach(buttonsArray, id: \.self) { row in
                    HStack{
                        ForEach(row, id: \.self) { item in
                            Button{
                                // action
                            } label: {
                                Text(item.rawValue)
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.white)
                                    .background(Color(item.buttonColor))
                                    .font(.system(size: 35))
                                    .cornerRadius(40)
                            }
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    MainView()
}
