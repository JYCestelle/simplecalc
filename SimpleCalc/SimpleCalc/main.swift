//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let length = args.count
        var result : Int = 1
        if length == 1 {
            return 0
        }
        else if args[args.endIndex - 1].count > 1 {
            // deal with different expressions
            switch args[args.endIndex - 1] {
            case "count":
                result = length - 1
            case "avg":
                if length > 2 {
                    var sum = 0;
                    for index in 0...(length - 2){
                        sum += Int(args[index])!
                    }
                    result = sum / (length - 1)
                }else {
                    result = Int(args[0])!
                }
            case "fact":
                // ["1", "fact"] & ["0", "fact"] should return 1
                if Int(args[0]) == 1 || Int(args[0]) == 0{
                    return 1
                }
                else {
                    for index in 1...(Int(args[0])!){
                        result *= index
                    }
                }
            default:
                result = 0
            }
        }
        else {
            //search for operator
            switch args[1] {
            case "+":
                result = Int(args[0])! + Int(args[2])!
            case "-":
                result = Int(args[0])! - Int(args[2])!
            case "/":
                result = Int(args[0])! / Int(args[2])!
            case "%":
                result = Int(args[0])! % Int(args[2])!
            case "*":
                result = Int(args[0])! * Int(args[2])!
            default:
                result = 0
            }
        }
        return result
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

