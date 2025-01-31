import 'package:custom_pickers/custom_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('adds one to input values', () {
    const calculator = CustomPickers(
      maxCount: 2,
      requestType: MyRequestType.image,
    );
    expect(calculator.confirmText, 'ok');
    expect(calculator.appbarColor, Colors.blue);
    expect(calculator.textSelectedListAssetColor, Colors.red);
  });
}
