import 'result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../widgets/box_card.dart';
import '../models/bmi_model.dart';

BMIModel bmiModel =
    BMIModel(Gender.male, 180, 60, 20); //BMI Model with default data

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void genderSelect(Gender selectedGender) {
    bmiModel.gender = selectedGender;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 15.0,
        centerTitle: true,
        title: Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              BoxCard(
                onPress: () {
                  setState(() {
                    genderSelect(Gender.male);
                  });
                },
                color: bmiModel.gender == Gender.male
                    ? activeCardColor
                    : inactiveCardColor,
                boxChild: BoxContent(
                  icon: FontAwesomeIcons.mars,
                  text: 'Male',
                ),
              ),
              BoxCard(
                onPress: () {
                  setState(() {
                    genderSelect(Gender.female);
                  });
                },
                color: bmiModel.gender == Gender.female
                    ? activeCardColor
                    : inactiveCardColor,
                boxChild: BoxContent(
                  icon: FontAwesomeIcons.venus,
                  text: 'Female',
                ),
              )
            ],
          )),
          BoxCard(
            color: defaultCardColor,
            boxChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: klabelStyle,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      bmiModel.height.toString(),
                      style: kHeightTextStyle,
                    ),
                    Text('cm'),
                  ],
                ),
                SliderTheme(data: SliderTheme.of(context).copyWith(
                  thumbColor:buttonColor ,
                  inactiveTrackColor: Color(0xFF8D8E98),
                  activeTrackColor: Colors.white,
                  overlayColor: Color(0x29EB1555),
                  
                ), child: Slider(
                  
                    value: bmiModel.height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (selectedValue) {
                      setState(() {
                        bmiModel.height = selectedValue.round();
                      });
                    }))
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              BoxCard(
                color: defaultCardColor,
                boxChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: klabelStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      bmiModel.weight.toString(),
                      style: kHeightTextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          width: 55.0,
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                bmiModel.weight = bmiModel.weight - 1;
                              });
                            },
                            elevation: 5.0,
                            padding: EdgeInsets.all(15.0),
                            color: iconButtonColor,
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.minus,
                                size: 25.0,
                              ),
                            ),
                            shape: CircleBorder(),
                          ),
                        ),
                        Container(
                          width: 55.0,
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                bmiModel.weight = bmiModel.weight + 1;
                              });
                            },
                            elevation: 5.0,
                            padding: EdgeInsets.all(15.0),
                            color: iconButtonColor,
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.plus,
                                size: 25.0,
                              ),
                            ),
                            shape: CircleBorder(),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              BoxCard(
                color: defaultCardColor,
                boxChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: klabelStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      bmiModel.age.toString(),
                      style: kHeightTextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          width: 55.0,
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                bmiModel.age = bmiModel.age - 1;
                              });
                            },
                            elevation: 5.0,
                            padding: EdgeInsets.all(15.0),
                            color: iconButtonColor,
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.minus,
                                size: 25.0,
                              ),
                            ),
                            shape: CircleBorder(),
                          ),
                        ),
                        Container(
                          width: 55.0,
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                bmiModel.age = bmiModel.age + 1;
                              });
                            },
                            elevation: 5.0,
                            padding: EdgeInsets.all(15.0),
                            color: iconButtonColor,
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.plus,
                                size: 25.0,
                              ),
                            ),
                            shape: CircleBorder(),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
          Container(
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kbottomContainerHeight,
              child: RaisedButton(
                color: buttonColor,
                child: Text(
                  'CACULATE',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmiResult: bmiModel.calculateBMI(),
                        resultText: bmiModel.getResult(),
                        interpretation: bmiModel.getInterpretation(),
                      ),
                    ),
                  );
                },
              ))
        ],
      ),
    ));
  }
}
