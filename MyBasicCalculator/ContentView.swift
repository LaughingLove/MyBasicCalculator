//
//  ContentView.swift
//  MyBasicCalculator
//
//  Created by Josh C on 7/5/20.
//  Copyright © 2020 Joshua Caplan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var display = "0"
    @State var firstNum = "nil"
    @State var secondNum = "nil"
    @State var lastOperator = "nil"
    @State var operation:Bool = false
    @State var maxDigits:Bool = false
    @State var fColors = [Color.white, Color.gray, Color.black]
    @State var buttonLabels = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "CE", "=", "*", "-", "+", "/", "AC", ".", "+/-"]
    @State var bColors = [Color.gray, Color.orange, Color(red: 64/255, green: 64/255, blue: 64/255)]
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.black).edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    if display.count < 6 {
                        Text(display)
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.trailing)
                            .padding(.trailing, 50)
                    } else if display.count < 8 {
                        Text(display)
                            .font(.system(size: 60))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.trailing)
                            .padding(.trailing, 50)
                        
                    } else {
                        Text(display)
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.trailing)
                            .padding(.trailing, 50)
                    }
                    
                }.padding(.bottom, 30)
                
                // AC AND CE AND /
                HStack {
                    ButtonView(label: $buttonLabels[16], fColor: $fColors[2], bColor: $bColors[0], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    
                    ButtonView(label: $buttonLabels[10], fColor: $fColors[2], bColor:
                    $bColors[0], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    ButtonView(label: $buttonLabels[18], fColor: $fColors[2], bColor:
                    $bColors[0], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    Spacer()
                    if operation && lastOperator == "/" {
                       ButtonView(label: $buttonLabels[15], fColor: $fColors[2], bColor:
                        $bColors[0], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    } else {
                        ButtonView(label: $buttonLabels[15], fColor: $fColors[0], bColor:
                        $bColors[1], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    }
                    
                    Spacer()
                }.padding(.horizontal, 27)
                HStack {
                    Spacer()
                    // 7
                    ButtonView(label: $buttonLabels[7], fColor: $fColors[0], bColor:
                        $bColors[2], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    Spacer()
                    // 8
                    ButtonView(label: $buttonLabels[8], fColor: $fColors[0], bColor: $bColors[2], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    Spacer()
                    // 9
                    ButtonView(label: $buttonLabels[9], fColor: $fColors[0], bColor: $bColors[2], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    Spacer()
                    // Multiplication
                    if operation && lastOperator == "*" {
                        ButtonView(label: $buttonLabels[12], fColor: $fColors[2], bColor: $bColors[0], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    } else {
                        ButtonView(label: $buttonLabels[12], fColor: $fColors[0], bColor: $bColors[1], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    }
                    
                    Spacer()
                }.padding()
                HStack {
                    Spacer()
                    // 4
                    ButtonView(label: $buttonLabels[4], fColor: $fColors[0], bColor: $bColors[2], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    Spacer()
                    // 5
                    ButtonView(label: $buttonLabels[5], fColor: $fColors[0], bColor: $bColors[2], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    Spacer()
                    // 6
                    ButtonView(label: $buttonLabels[6], fColor: $fColors[0], bColor: $bColors[2], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    Spacer()
                    // Subtraction
                    if operation && lastOperator == "-" {
                        ButtonView(label: $buttonLabels[13], fColor: $fColors[2], bColor: $bColors[0], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    } else {
                        ButtonView(label: $buttonLabels[13], fColor: $fColors[0], bColor: $bColors[1], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    }
                    
                    Spacer()
                }.padding()
                HStack {
                    Spacer()
                    ButtonView(label: $buttonLabels[1], fColor: $fColors[0], bColor: $bColors[2], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    Spacer()
                    ButtonView(label: $buttonLabels[2], fColor: $fColors[0], bColor: $bColors[2], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    Spacer()
                    ButtonView(label: $buttonLabels[3], fColor: $fColors[0], bColor: $bColors[2], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    Spacer()
                    // Addition
                    if operation && lastOperator == "+"{
                        ButtonView(label: $buttonLabels[14], fColor: $fColors[2], bColor: $bColors[0], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    } else {
                        ButtonView(label: $buttonLabels[14], fColor: $fColors[0], bColor: $bColors[1],  display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    }
                    
                    Spacer()
                }.padding()
                HStack {
                    Spacer()
                    ButtonView(label: $buttonLabels[0], fColor: $fColors[0], bColor: $bColors[2], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    
                    //Spacer()
                    
                    ButtonView(label: $buttonLabels[17], fColor: $fColors[0], bColor: $bColors[2], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    Spacer()
                    ButtonView(label: $buttonLabels[11], fColor: $fColors[0], bColor:
                    $bColors[1], display: $display, firstNum: $firstNum, secondNum: $secondNum,lastOperator: $lastOperator, operation: $operation)
                    Spacer()
                }
                
                
            }
            
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
