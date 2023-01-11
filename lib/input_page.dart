import 'dart:ui';
import 'package:bmi_calculator_flutter/Calculations_Page.dart';

import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Identifier_Icon.dart';
import 'Reusuable_Widget.dart';
import 'result.dart';

const identify = IdentifierWidget(FontAwesomeIcons.person, 'Male');

enum Gender {
  male,
  female,
}

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  Gender? selectedgender;
  int height = 180;
  int weight = 50;
  int age = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Center(
          child: Text('BMI Calculator'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusuableCard(
                    onPress: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    colour: selectedgender == Gender.male
                        ? cardcolour
                        : inactivecolor,
                    cardchild: identify,
                  ),
                ),
                Expanded(
                  child: ReusuableCard(
                    onPress: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    colour: selectedgender == Gender.female
                        ? cardcolour
                        : inactivecolor,
                    cardchild: IdentifierWidget(
                        FontAwesomeIcons.personDress, 'Female'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusuableCard(
              colour: cardcolour,
              cardchild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: newstyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: boldstyle,
                      ),
                      Text(
                        'CM',
                        style: newstyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: const Color(0xFFEB1555),
                      inactiveColor: const Color(0xFF8D8E98),
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusuableCard(
                    colour: cardcolour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: newstyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              weight.toString(),
                              style: boldstyle,
                            ),
                            Text(
                              'KGM',
                              style: newstyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundButton(
                              icons: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              givenshape: CircleBorder(),
                            ),
                            RoundButton(
                              icons: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              givenshape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusuableCard(
                    colour: cardcolour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: newstyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              age.toString(),
                              style: boldstyle,
                            ),
                            Text(
                              'YRS',
                              style: newstyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundButton(
                              icons: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                              givenshape: CircleBorder(),
                            ),
                            RoundButton(
                              icons: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                              givenshape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculations bmi = Calculations(height, weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Results_Page(
                    bmi.interpretation(), bmi.result(), bmi.bmiresult());
              }));
            },
            child: Container(
              child: Center(
                child: Text(
                  'Calculate BMI',
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

// Expanded(
// child: Container(
// margin: EdgeInsets.all(15),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(5),
// )),
// )

class RoundButton extends StatelessWidget {
  // const RoundButton({Key? key, required this.icons}) : super(key: key);

  final IconData icons;
  void Function() onPress;
  final ShapeBorder givenshape;

  RoundButton(
      {required this.icons, required this.onPress, required this.givenshape});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shape: givenshape,
        child: Icon(icons),
        onPressed: onPress,
        elevation: 10,
        fillColor: Color(0xFF4C4F5E),
        constraints: BoxConstraints.tightFor(
          height: 56,
          width: 56,
        ));
  }
}
