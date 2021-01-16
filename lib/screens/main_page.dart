import 'package:Calculator/controller/btn_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorPage extends GetWidget<ButtonController> {
  ButtonController btn = Get.put(ButtonController());
  Widget buttonWidget(String btname) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 5),
      decoration: BoxDecoration(
          // border: Border.all(),
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(35),
          gradient: LinearGradient(
              begin: Alignment(-1.0, -4.0),
              end: Alignment(1.0, 4.0),
              colors: [Color(0xFF5bc6ff), Color(0xFF4da7db)]),
          boxShadow: [
            BoxShadow(
                color: Color(0xFF4ca5d8),
                offset: Offset(4.0, 4.0),
                blurRadius: 10.0,
                spreadRadius: 1.0),
            BoxShadow(
                color: Color(0xFF5ecdff),
                offset: Offset(-3.0, -3.0),
                blurRadius: 5.0,
                spreadRadius: 1.0),
          ]),
      child: MaterialButton(
        padding: EdgeInsets.all(10),
        // minWidth: Get.width * 0.244,
        onPressed: () => btn.buttonTap(btname),
        child: Text(btname,
            maxLines: 1,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF55b9f3),
      resizeToAvoidBottomPadding: false,
      appBar:
          AppBar(title: Text('Calculator'), backgroundColor: Color(0xFF55b9f3)),
      body: Column(
        children: [
          GetX<ButtonController>(
              init: btn,
              builder: (_) {
                return Expanded(
                  // flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.white,
                    // height: Get.height * 0.15,
                    child: _.ans.value.isBlank
                        ? Text(_.equation.value.toString(),
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold))
                        : Text(_.ans.value.toString(),
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold)),
                  ),
                );
              }),
          // Expanded(child: Divider()),
          Expanded(
            child: Column(
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
                    Expanded(child: buttonWidget('C')),
                    Expanded(child: buttonWidget('=')),
                    // buttonWidget(),
                    // buttonWidget(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
