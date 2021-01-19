import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class ButtonController extends GetxController {
  final ans = '0'.obs;
  final equation = '0'.obs;
  final expression = ''.obs;

  buttonTap(String btnSymbol) {
    if (btnSymbol == 'C') {
      ans.value = '0';
      equation.value = '0';
    } else if (btnSymbol == '=') {
      expression.value = equation.value;
      try {
        Parser parser = Parser();
        Expression exp = parser.parse(expression.value);
        ContextModel cm = ContextModel();
        ans.value = '= ${exp.evaluate(EvaluationType.REAL, cm).toString()}';
      } catch (e) {
        ans.value = 'Error';
      }
    } else if (btnSymbol == '⌫') {
      if (equation.value.length == 0) {
        equation.value = '0';
      } else {
        equation.value = equation.value.substring(0, equation.value.length - 1);
      }
    } else if (equation.value.length >= 15) {
      Get.snackbar('Hello', 'Maximum digit(15) reached',
          backgroundColor: Color(0xFF000000),
          margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Color(0xFFFFFFFF));
    } else {
      if (equation.value == '0') {
        equation.value = btnSymbol;
      } else {
        equation.value = equation.value + btnSymbol;
      }
    }
  }
}
