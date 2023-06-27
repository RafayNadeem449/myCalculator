//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Admin on 06/06/2023.
//

import Foundation
struct CalculaterBrain{
    private var accumulator:Double?
    enum Operation{
        case constant (Double)
        case unaryOperation((Double)->Double)
        case binaryOperation((Double,Double)->Double)
        case equals
        case clear
    }

    private var operations:Dictionary <String, Operation> = [
                "π" : .constant (Double.pi),
                "√" : .unaryOperation(sqrt),
                "cos" : .unaryOperation(cos),
                "cosh" : .unaryOperation(cosh),
                "tan" : .unaryOperation(tan),
                "sin" : .unaryOperation(sin),
                "sinh" : .unaryOperation(sinh),
                "log" : .unaryOperation(log),
                "+" : .binaryOperation({$0 + $1}),
                "−" : .binaryOperation({$0 - $1}),
                "×" : .binaryOperation({$0 * $1}),
                "÷" : .binaryOperation({$0 / $1}),
                "=" : .equals,
                "⌨️" : .clear,
    ]
    mutating func performOperation(_ symbol:String){
        if let constant = operations[symbol]
        {
            switch constant{
                
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function ):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function ):
                if accumulator != nil {
                    pbo = PendingBinaryOperation(function: function, firstOprand: accumulator!)
                    accumulator=nil
                }
            case .equals:
                perormPendingBinaryOperation()
            case .clear:
                accumulator = nil
            }
        }
    }
    
    private mutating func perormPendingBinaryOperation()
    {
        if pbo != nil && accumulator != nil
        {
            accumulator =  pbo!.perform(with: accumulator!)
        }
    }
    
    private var pbo : PendingBinaryOperation?
    
    private struct PendingBinaryOperation{
        var function: (Double, Double) -> Double
        var firstOprand: Double
        
        func perform (with secondOprand :Double) ->Double
        {
            return function(firstOprand, secondOprand)
        }
    }
    
    mutating func setOperand(_ operand:Double)
    {
        accumulator = operand
    }
    var result:Double?
    {
        get{
            return accumulator
        }
    }
   
    
}
