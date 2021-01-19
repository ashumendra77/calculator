import 'package:Calculator/controller/btn_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorPage extends GetWidget<ButtonController> {
  ButtonController btn = Get.put(ButtonController());
  Widget buttonWidget(String btname) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 5),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
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
        splashColor: Colors.transparent,
        autofocus: false,
        padding: EdgeInsets.all(15),
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
                  child: Container(
                      padding: EdgeInsets.only(bottom: 15),
                      alignment: Alignment.bottomRight,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(_.equation.value.toString(),
                              style: TextStyle(fontSize: 30)),
                          Text(_.ans.value.toString(),
                          maxLines: 2,
                          softWrap: true,
                          // overflow: TextOverflow.fade,
                              style: TextStyle(fontSize: 30))
                        ],
                      )),
                );
              }),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0, top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonWidget('C'),
                    buttonWidget('⌫'),
                    buttonWidget('%'),
                    buttonWidget('/'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonWidget('7'),
                    buttonWidget('8'),
                    buttonWidget('9'),
                    buttonWidget('*'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonWidget('4'),
                    buttonWidget('5'),
                    buttonWidget('6'),
                    buttonWidget('+'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonWidget('1'),
                    buttonWidget('2'),
                    buttonWidget('3'),
                    buttonWidget('-'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonWidget('00'),
                    buttonWidget('0'),
                    buttonWidget('.'),
                    buttonWidget('='),
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
