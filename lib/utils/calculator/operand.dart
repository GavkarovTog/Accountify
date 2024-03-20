import 'dart:typed_data';

enum OperandType {
  firstOperand,
  secondOperand
}

abstract class OperandOperations {
  void numb(int digit);
  void dot();
  void back();
}

abstract class OperandState implements OperandOperations {
  Operand operand;
  OperandState(this.operand);

  void numb(int digit) {
    if (digit < 0 || digit > 9) {
      throw UnsupportedError("digit must be in [0, 9]");
    }
  }

  void dot() {}
  void back() {}
}

class ZeroState extends OperandState {
  ZeroState(super.operand);

  @override
  void numb(int digit) {
    super.numb(digit);

    operand.strRepr = digit.toString();
    operand.currentState = operand.nonZeroState;
  }

  @override
  void dot() {
    operand.strRepr = "0.";
    operand.currentState = operand.zeroRationalState;
  }
}

class NonZeroState extends OperandState {
  NonZeroState(super.operand);

  @override
  void numb(int digit) {
    super.numb(digit);
    operand.strRepr += digit.toString();
  }

  @override
  void dot() {
    operand.strRepr += ".";
    operand.currentState = operand.nonZeroRationalState;
  }

  @override
  void back() {
    operand.strRepr = operand.strRepr.substring(0, operand.strRepr.length - 1);

    if (operand.strRepr.isEmpty) {
      operand.strRepr = "0";
      operand.currentState = operand.zeroState;
    }
  }
}

class ZeroRationalState extends OperandState {
  ZeroRationalState(super.operand);

  @override
  void numb(int digit) {
    super.numb(digit);

    operand.strRepr += digit.toString();
  }

  @override
  void back() {
    if (operand.strRepr.endsWith(".")) {
      operand.currentState = operand.zeroState;
    }

    operand.strRepr = operand.strRepr.substring(0, operand.strRepr.length - 1);
  }
}

class NonZeroRationalState extends OperandState {
  NonZeroRationalState(super.operand);

  @override
  void numb(int digit) {
    super.numb(digit);
    operand.strRepr += digit.toString();
  }

  @override
  void back() {
    if (operand.strRepr.endsWith(".")) {
      operand.currentState = operand.nonZeroState;
    }
    operand.strRepr = operand.strRepr.substring(0, operand.strRepr.length - 1);
  }
}

class EmptyState extends OperandState {
  EmptyState(super.operand);

  @override
  void numb(int digit) {
    super.numb(digit);

    if (digit == 0) {
      operand.strRepr = "0";
      operand.currentState = operand.zeroState;
    } else {
      operand.strRepr = digit.toString();
      operand.currentState = operand.nonZeroState;
    }
  }
}

class ZeroWithEmptyState extends ZeroState {
  ZeroWithEmptyState(super.operand);

  @override
  void back() {
    operand.strRepr = "";
    operand.currentState = operand.emptyState!;
  }
}

class NonZeroWithEmptyState extends NonZeroState {
  NonZeroWithEmptyState(super.operand);

  @override
  void back() {
    operand.strRepr = operand.strRepr.substring(0, operand.strRepr.length - 1);

    if (operand.strRepr.isEmpty) {
      operand.currentState = operand.emptyState!;
    }
  }
}

class Operand implements OperandOperations {
  String strRepr = "0";
  Operand(OperandType type) {
    if (type == OperandType.secondOperand) {
      emptyState = EmptyState(this);
      zeroState = ZeroWithEmptyState(this);
      nonZeroState = NonZeroWithEmptyState(this);
      strRepr = "";
    }
  }

  late OperandState currentState = zeroState;

  late OperandState? emptyState;
  late OperandState zeroState = ZeroState(this);
  late OperandState nonZeroState = NonZeroState(this);
  late OperandState zeroRationalState = ZeroRationalState(this);
  late OperandState nonZeroRationalState = NonZeroRationalState(this);

  @override
  void back() {
    currentState.back();
  }

  @override
  void dot() {
    currentState.dot();
  }

  @override
  void numb(int digit) {
    currentState.numb(digit);
  }
}