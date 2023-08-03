class Memory {
  static const operations = ['%', "÷", "X", '-', '+', '='];

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String? operation;
  bool _wipeValue = false;
  String _value = '0';
  String? _lastCommand;

  void applyCommand(String command) {
    if (isReplacingOperantion(command)) {
      operation = command;
      return;
    }

    if (command == 'AC') {
      allClear();
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }
    _lastCommand = command;
  }

  isReplacingOperantion(String command) {
    return operations.contains(_lastCommand) &&
        operations.contains(command) &&
        _lastCommand != '=' &&
        command != '=';
  }

  _setOperation(String newOperation) {
    bool isEqual = newOperation == '=';
    if (_bufferIndex == 0) {
      if (!isEqual) {
        operation = newOperation;
        _bufferIndex = 1;
        _wipeValue = true;
      }
    } else {
      _buffer[0] = _calculate();
      _buffer[1] = 0;
      _value = _buffer[0].toString();
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;
      operation = isEqual ? null : newOperation;
      _bufferIndex = isEqual ? 0 : 1;
    }

    _wipeValue = true;
  }

  void _addDigit(String digit) {
    final isDot = digit == '.';

    final bool wipeValue = (_value == '0' && !isDot) || _wipeValue;

    if (isDot && _value.contains('.') && !wipeValue) {
      return;
    }
    final emptyValue = isDot ? '0' : '';
    final currentValue = wipeValue ? emptyValue : _value;
    _value = currentValue + digit;
    _wipeValue = false;
    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
  }

  void allClear() {
    _value = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    operation = null;
    _wipeValue = false;
  }

  _calculate() {
    switch (operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case 'X':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      case '÷':
        return _buffer[0] / _buffer[1];
      default:
        return _buffer[0];
    }
  }

  String get value {
    return _value;
  }
}
