import 'dart:ffi';

import 'operand.dart';

// TODO: Use bloc

abstract class CalculatorOperations extends OperandOperations {
  void divide() {}
  void times() {}
  void minus() {}
  void plus() {}

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
  }

  @override
  void minus() {
    // TODO: implement minus
  }

  @override
  void plus() {
    // TODO: implement plus
  }

  @override
  void times() {
    // TODO: implement times
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
    calc.secondOperand.back();
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
    // TODO: implement equals
  }

  @override
  void divide() {
  }

  @override
  void minus() {
    // TODO: implement minus
  }

  @override
  void plus() {
    // TODO: implement plus
  }

  @override
  void times() {
    // TODO: implement times
  }

  @override
  String toDisplay() {
    return calc.secondOperand.strRepr;
  }
}

class Calculator implements CalculatorOperations, OperandOperations {
  Operand firstOperand = Operand(OperandType.firstOperand);
  Operand secondOperand = Operand(OperandType.secondOperand);

  late CalculatorOperations currentState = secondOperandInputState;
  late CalculatorOperations firstOperandInputState = FirstOperandInputState(this);
  late CalculatorOperations secondOperandInputState = SecondOperandInputState(this);

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