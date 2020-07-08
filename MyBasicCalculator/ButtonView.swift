//
//  ButtonView.swift
//  MyBasicCalculator
//
//  Created by Josh C on 7/5/20.
//  Copyright © 2020 Joshua Caplan. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    @Binding var label:String
    @Binding var fColor:Color
    @Binding var bColor:Color
    @Binding var display:String
    @Binding var firstNum:String
    @Binding var secondNum:String
    @Binding var lastOperator:String
    @Binding var operation:Bool
    //    @Binding var adding:Bool
    //    @Binding var multiplying:Bool
    //    @Binding var subtracting:Bool
    //    @Binding var dividing:Bool
    var body: some View {
        Button(action: {
            // Todo
            self.processData()
        }) {
            
            if label.contains("CE") || label.contains("AC"){
                Text(label)
                    .foregroundColor(fColor)
                    .padding()
                    .background(bColor)
                    .font(.system(size: 40))
                    .cornerRadius(25)
            } else if label.contains(".") {
                Text(label)
                    .foregroundColor(fColor)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(bColor)
                    .font(.system(size: 40))
                    .cornerRadius(25)
                
            } else if label.contains("0") {
                Text(label)
                    .foregroundColor(fColor)
                    .font(.system(size: 40))
                    //.padding()
                    .padding(.trailing, 70)
                    .padding()
                    .background(bColor)
                    
                    .cornerRadius(25)
            } else if label.contains("+/-") {
                Text(label)
                    .foregroundColor(fColor)
                    .padding()
                    .background(bColor)
                    .font(.system(size: 35))
                    .cornerRadius(25)
            } else {
                Text(label)
                    .foregroundColor(fColor)
                    .padding()
                    .background(bColor)
                    .font(.system(size: 50))
                    .cornerRadius(25)
            }
            
            
        }
    }
    func processData() {
        if Int(self.label) != nil {
            // Valid Int
            // Display only reads 0
            if self.display == "0" {
                self.display = self.label
            } else {
                // If we're in the middle of an operation
                if self.operation {
                    self.operation = false
                    self.display = self.label
                } else {
                    // If not we're just creating large numbers
                    if self.display.count != 9 {
                        self.display += self.label
                    }
                }
                
            }
            
            
        } else {
            switch self.label {
            case "+":
                simpleOperation("+")
                break
            case "-":
                simpleOperation("-")
                break
            case "*":
                simpleOperation("*")
                break
            case "/":
                simpleOperation("/")
                break
            case "=":
                switch self.lastOperator {
                case "+":
                    simpleMath("+")
                    self.firstNum = "nil"
                    self.secondNum = "nil"
                    self.lastOperator = "nil"
                    break
                case "-":
                    simpleMath("-")
                    self.firstNum = "nil"
                    self.secondNum = "nil"
                    self.lastOperator = "nil"
                    break
                case "*":
                    simpleMath("*")
                    self.firstNum = "nil"
                    self.secondNum = "nil"
                    self.lastOperator = "nil"
                    break
                case "/":
                    simpleMath("/")
                    self.firstNum = "nil"
                    self.secondNum = "nil"
                    self.lastOperator = "nil"
                default:
                    // nil
                    break
                    
                }
                break
            case "AC":
                self.display = "0"
                self.operation = false
                self.firstNum = "nil"
                self.secondNum = "nil"
                break
            case "CE":
                self.display = ""
            case ".":
                // Adds decimal place
                self.display += "."
            case "+/-":
                // Converts number from positive to negative
                let formatter = NumberFormatter()
                formatter.minimumFractionDigits = 0
                formatter.maximumFractionDigits = 5
                let newDouble = Double(self.display)! * Double(-1)
                self.display = formatter.string(from: newDouble as NSNumber)!
                
            default:
                break
            }
        }
        
    }
    func simpleOperation (_ theOperator:String) {
        self.lastOperator = theOperator
        if !self.operation {
            self.operation = true
            if self.firstNum == "nil" {
                self.firstNum = self.display
            } else if self.secondNum == "nil" && self.firstNum != "nil" {
                simpleMath(theOperator)
                self.firstNum = self.display
                self.secondNum = "nil"
            }
            
        }
    }
    func simpleMath(_ simpleOperation:String) {
        self.secondNum = self.display
        let num1 = Double(self.firstNum)
        let num2 = Double(self.secondNum)
        if num1 == nil || num2 == nil {
            self.display = "0"
        } else {
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 8
            switch simpleOperation {
            case "/":
                let result = num1!/num2!
                self.display = formatter.string(from: result as NSNumber)!
                break
            case "-":
                let result = num1! - num2!
                self.display = formatter.string(from: result as NSNumber)!
                break
            case "*":
                let result = num1!*num2!
                self.display = formatter.string(from: result as NSNumber)!
                break
            default:
                let result = num1! + num2!
                self.display = formatter.string(from: result as NSNumber)!
            }
        }
        
        
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(label: Binding.constant("0"), fColor: Binding.constant(Color.white), bColor: Binding.constant(Color.black), display: Binding.constant("0"), firstNum: Binding.constant("0"), secondNum: Binding.constant("0"), lastOperator: Binding.constant("nil"), operation: Binding.constant(false))
    }
}
