import 'package:Calculator/controller/btn_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorPage extends GetWidget<ButtonController> {
  ButtonController btn = Get.put(ButtonController());
  Widget buttonWidget(String btname) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: MaterialButton(
          padding: EdgeInsets.all(20),
          minWidth: Get.width * 0.244,
          onPressed: () => btn.buttonTap(btname),
          child: Text(btname,
              maxLines: 1,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          color: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text('Calculator')),
      body: Column(
        children: [
          GetX<ButtonController>(
              init: btn,
              builder: (_) {
                return Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    color: Colors.yellowAccent,
                    height: Get.height * 0.15,
                    child: _.ans.value.isBlank
                        ? Text(_.equation.value,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold))
                        : Text(_.ans.value,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                );
              }),
          // Expanded(child: Divider()),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buttonWidget('9'),
                  buttonWidget('8'),
                  buttonWidget('7'),
                  buttonWidget('/'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buttonWidget('6'),
                  buttonWidget('5'),
                  buttonWidget('4'),
                  buttonWidget('*'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buttonWidget('3'),
                  buttonWidget('2'),
                  buttonWidget('1'),
                  buttonWidget('+'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buttonWidget('00'),
                  buttonWidget('0'),
                  buttonWidget('.'),
                  buttonWidget('-'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: buttonWidget('Clear')),
                  Expanded(child: buttonWidget('=')),
                  // buttonWidget(),
                  // buttonWidget(),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
