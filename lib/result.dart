import 'package:bmi_calculator_flutter/constants.dart';
import 'package:bmi_calculator_flutter/input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Results_Page extends StatelessWidget {
  // const Results_Page({Key? key}) : super(key: key);

  String interpretation;
  String result;

  Results_Page(this.interpretation, this.result, this.bmiresult);

  String bmiresult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: (Text('BMI Calculator')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              // color: cardcolour,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: cardcolour,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    result,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF24D876),
                    ),
                  ),
                  Text(
                    bmiresult,
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'Re-Calculate BMI',
                  style: semibold,
                ),
              ),
              padding: EdgeInsets.only(bottom: 20),
              color: bottomcontainercolour,
              height: bottomcontainerheight.toDouble(),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}
