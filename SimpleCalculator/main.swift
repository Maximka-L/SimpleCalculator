import Foundation

// MARK: enum
enum Operations {
    case none
    case addition
    case subtraction
    case multiplication
    case division
}

//MARK: var
var isRunning = true
var currentNumber = "0"
var firstNumber = 0.0
var secondNumber = 0.0
var result = ""
var currentOperation = Operations.none

// MARK: program points
func runLoop() {
    while isRunning {
        start()
    }
    
    finish()
}

func start() {
    print("Do you want to make a calculation?")
    print("Enter \"yes\" or \"no\":")
    if let answer = readLine() {
        if answer.lowercased() == "yes" {
            updateDisplay(text: "Enter first number:")
            if let firstEnter = readLine(), let num1 = Double(firstEnter) {
                firstNumber = num1
                updateDisplay(text: "Enter operation type (+, -, *, /):")
                if let operationEnter = readLine() {
                    switch operationEnter {
                    case "+":
                        currentOperation = .addition
                    case "-":
                        currentOperation = .subtraction
                    case "*":
                        currentOperation = .multiplication
                    case "/":
                        currentOperation = .division
                    default:
                        break
                    }
                    updateDisplay(text: "Enter second number:")
                    if let secondEnter = readLine(), let num2 = Double(secondEnter) {
                        secondNumber = num2
                        makeResult()
                        updateDisplay(text:
                            """
                            ______________________
                            Result of calculation: \(result)
                            ______________________
                            
                            """
                        )
                    }
                }
            }
        } else {
            finish()
        }
    }
}

func finish() {
    print("Program is ended")
    isRunning = false
}

//MARK: func program
func updateDisplay(text: String) {
    print(text)
}

func makeCalculation(operation: Operations) {
    switch operation {
    case .addition:
        result = String(firstNumber + secondNumber)
    case .subtraction:
        result = String(firstNumber - secondNumber)
    case .multiplication:
        result = String(firstNumber * secondNumber)
    case .division:
        if secondNumber != 0 {
            result = String(firstNumber / secondNumber)
        } else {
            result = "Error: Division by zero"
        }
    default:
        result = ""
    }
}

func makeResult() {
    makeCalculation(operation: currentOperation)
    firstNumber = Double(result) ?? 0.0
    currentOperation = Operations.none
}

// MARK: program flow
print("SimpleCalc program")
print("Welcome to SimpleCalc.\n ")
runLoop()
