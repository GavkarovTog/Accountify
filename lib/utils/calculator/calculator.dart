import 'dart:ffi';

import 'package:flutter/material.dart';

import 'operand.dart';

// TODO: Use bloc

abstract class CalculatorOperations extends OperandOperations {
  void equals() {}
  String toDisplay();
}

class FirstOperandInputState implements CalculatorOperations {
  Calculator calc;
  FirstOperandInputState(this.calc);

  @override
  void back() {
    calc.firstOperand.back();
  }

  @override
  void numb(int digit) {
    calc.firstOperand.numb(digit);
  }

  @override
  void dot() {
    calc.firstOperand.dot();
  }

  @override
  void equals() {
    // TODO: implement equals
  }

  @override
  void divide() {
    calc.firstOperand.divide();
    calc.operator = "/";
    calc.currentState = calc.secondOperandInputState;
  }

  @override
  void minus() {
    calc.firstOperand.minus();
    calc.operator = "-";
    calc.currentState = calc.secondOperandInputState;
  }

  @override
  void plus() {
    calc.firstOperand.plus();
    calc.operator = "+";
    calc.currentState = calc.secondOperandInputState;
  }

  @override
  void times() {
    calc.firstOperand.times();
    calc.operator = "*";
    calc.currentState = calc.secondOperandInputState;
  }

  @override
  String toDisplay() {
    return calc.firstOperand.strRepr;
  }
}

class SecondOperandInputState implements CalculatorOperations {
  Calculator calc;
  SecondOperandInputState(this.calc);

  @override
  void back() {
    if (calc.secondOperand.currentState == calc.secondOperand.zeroState) {
      calc.currentState = calc.firstOperandInputState;
    } else {
      calc.secondOperand.back();
    }
  }

  @override
  void numb(int digit) {
    calc.secondOperand.numb(digit);
  }

  @override
  void dot() {
    calc.secondOperand.dot();
  }

  @override
  void equals() {
    _operation("");
    calc.currentState = calc.firstOperandInputState;
  }

  void _operation(String operator) {
    double fst = double.parse(calc.firstOperand.strRepr);
    double snd = double.parse(calc.secondOperand.strRepr);

    try {
      String result = switch(calc.operator) {
        "+" => fst + snd,
        "-" => fst - snd,
        "*" => fst * snd,
        "/" => fst / snd,
        _ => 0
      }.toString();

      if (result != "Infinity" && result != "NaN") {
        if (result.contains(".")) {
          int nearestToPointZeroIndex = result.length;

          for (int i = nearestToPointZeroIndex - 1; i >= 0; i --) {
            if (result[i] == "0") {
              nearestToPointZeroIndex --;
            } else if (result[i] == ".") {
              nearestToPointZeroIndex --;
              break;
            }
            else {
              break;
            }
          }

          result = result.substring(0, nearestToPointZeroIndex);
        }

        calc.firstOperand.strRepr = "0";
        calc.firstOperand.currentState = calc.firstOperand.zeroState;

        for (var action in result.characters) {
          if (action == ".") {
            calc.firstOperand.dot();
          } else {
            calc.firstOperand.numb(int.parse(action));
          }
        }

        calc.secondOperand.strRepr = "0";
        calc.secondOperand.currentState = calc.secondOperand.zeroState;

        calc.operator = operator;
      }
    } catch (err) {}

  }

  @override
  void divide() {
    calc.secondOperand.divide();
    _operation("/");
  }

  @override
  void minus() {
    calc.secondOperand.minus();
    _operation("-");
  }

  @override
  void plus() {
    calc.secondOperand.plus();
    _operation("+");
  }

  @override
  void times() {
    calc.secondOperand.times();
    _operation("*");
  }

  @override
  String toDisplay() {
    // TODO: make appropriate form for RichText
    return "${calc.firstOperand.strRepr} ${calc.operator} ${calc.secondOperand.strRepr}";
  }
}

class Calculator implements CalculatorOperations, OperandOperations {
  Operand firstOperand = Operand();
  Operand secondOperand = Operand();

  late CalculatorOperations currentState = firstOperandInputState;
  late CalculatorOperations firstOperandInputState = FirstOperandInputState(this);
  late CalculatorOperations secondOperandInputState = SecondOperandInputState(this);
  String operator = "";

  @override
  String toDisplay() {
    return currentState.toDisplay();
  }

  @override
  void back() {
    currentState.back();
  }

  @override
  void divide() {
    currentState.divide();
  }

  @override
  void dot() {
    currentState.dot();
  }

  @override
  void equals() {
    currentState.equals();
  }

  @override
  void minus() {
    currentState.minus();
  }

  @override
  void numb(int digit) {
    currentState.numb(digit);
  }

  @override
  void plus() {
    currentState.plus();
  }

  @override
  void times() {
    currentState.times();
  }
}