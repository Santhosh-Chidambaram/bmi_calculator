import 'package:bmi_calculator/widgets/box_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: EdgeInsets.only(left: 12.0),
                  child: Text('Your Result',
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 12.0,
                ),
                BoxCard(
                    color: defaultCardColor,
                    boxChild: Container(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          Text(resultText.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.greenAccent[400],
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 25.0,
                          ),
                          Text(bmiResult,
                              style: TextStyle(
                                  fontSize: 90.0, fontWeight: FontWeight.w800)),
                          SizedBox(
                            height: 40.0,
                          ),
                          Text(resultText,
                              style: klabelStyle.copyWith(
                                  fontSize: 25.0, fontWeight: FontWeight.w400)),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('18.5 - 25 kg/m2',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 40.0,
                          ),
                          Text(interpretation,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24.0,
                                  height: 1.5,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 10.0),
                    width: double.infinity,
                    height: kbottomContainerHeight,
                    child: RaisedButton(
                      color: buttonColor,
                      child: Text(
                        'RE-CACULATE YOUR BMI',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ))
              ],
            )));
  }
}
