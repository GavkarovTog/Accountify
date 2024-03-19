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
    operand.strRepr = operand.strRepr.substring(0, operand.strRepr.length - 1);

    if (operand.strRepr.endsWith(".")) {
      operand.strRepr = "0";
      operand.currentState = operand.zeroState;
    }
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

class Operand implements OperandOperations {
  String strRepr = "0";

  late OperandState currentState = zeroState;

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