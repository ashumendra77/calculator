import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class ButtonController extends GetxController {
  final ans = '0'.obs;
  final equation = '0'.obs;
  final expression = ''.obs;

  buttonTap(String btnSymbol) {
    if (btnSymbol == 'C') {
      ans.value = '';
      equation.value = '0';
    } else if (btnSymbol == '=') {
      expression.value = equation.value;
      try {
        Parser parser = Parser();
        Expression exp = parser.parse(expression.value);
        ContextModel cm = ContextModel();
        ans.value = '${exp.evaluate(EvaluationType.REAL, cm).toString()}';
      } catch (e) {
        ans.value = 'Error';
      }
    } else if (equation.value.length >= 20) {
      Get.snackbar('hi', 'Maximum digit(20) reached');
      // Get.dialog(Center(child:Text('Maximum digit(20) reached')));
    } else {
      if (equation.value =='0') {
        equation.value = btnSymbol;
      } else {
        equation.value = equation.value + btnSymbol;
      }
    }
  }
  
}

