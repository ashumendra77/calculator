import 'package:get/state_manager.dart';
import 'package:math_expressions/math_expressions.dart';

class ButtonController extends GetxController {
  final ans = '0'.obs;
  final equation = '0'.obs;
  final expression = ''.obs;

  buttonTap(String btnSymbol) {
    if (btnSymbol == 'Clear') {
      ans.value = '';
      equation.value = '0';
    } else if (btnSymbol == '=') {
      // Parser ps=
      expression.value = equation.value;
      try {
        Parser parser = Parser();
        Expression exp = parser.parse(expression.value);
        ContextModel cm = ContextModel();
        ans.value = '${exp.evaluate(EvaluationType.REAL, cm).toString()}';
      } catch (e) {
        ans.value = e;
      }
    } else {
      if (equation == '0') {
        equation.value = btnSymbol;
      } else {
        equation.value = equation.value + btnSymbol;
      }
    }
  }
}
