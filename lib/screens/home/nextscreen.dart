import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'finalpage.dart';

class nextscreen extends StatefulWidget {
  @override
  State<nextscreen> createState() => _nextscreenState();
}

class _nextscreenState extends State<nextscreen> {

  String workout1_1 = 'Skipping (3min)';
  String workout1_2 = 'PushUps';
  String workout1_3 = 'Squats';
  String workout1_4 = 'Lunges';

  String workout2_1 = 'Mountain Climbers';
  String workout2_2 = 'Dumbbell Curl';
  String workout2_3 = 'Dumbbell Chest Fly';
  String workout2_4 = 'High Knees';

  String set1 = '4';
  String set2 = '4';

  @override
  Widget build(BuildContext context) {
    if(work1_1 != null){
      setState(() {
        workout1_1 = work1_1;
      });
    }
    if(work1_2 != null){
      setState(() {
        workout1_2 = work1_2;
      });
    }

    if(work1_3 != null){
      setState(() {
        workout1_3 = work1_3;
      });
    }
    if(work1_4 != null){
      setState(() {
        workout1_4 = work1_4;
      });
    }

    if(work2_1 != null){
      setState(() {
        workout2_1 = work2_1;
      });
    }
    if(work2_2 != null){
      setState(() {
        workout2_2 = work2_2;
      });
    }

    if(work2_3 != null){
      setState(() {
        workout2_3 = work2_3;
      });
    }
    if(work2_4 != null){
      setState(() {
        workout2_4 = work2_4;
      });
    }

    if(rep1 != null){
      setState(() {
        set1 = rep1;
      });
    }
    if(rep2 != null){
      setState(() {
        set2 = rep2;
      });
    }


    return Container(
      child: Scaffold(
        backgroundColor: HexColor("#000000"),
        appBar: AppBar(
          backgroundColor: HexColor("#000000"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "WORKOUTS",
            style: TextStyle(
                fontFamily: "Stretchpro",
                color: Colors.deepOrange,
                fontSize: 35
            ),
          ),
        ),
        body:Container(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Column(
            children: <Widget>[
              Card(
                color: HexColor("#0D0D0D"),
                child: new InkWell(
                  onTap: () {
                    print("tapped");
                  },
                  child: Container(
                    width: 400,
                    height: 300,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('$workout1_1'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: "Stretchpro",
                            color: Colors.white,
                            letterSpacing: 0.5,
                            fontSize: 14,
                          ),
                        ),
                        Text('X12'.toUpperCase(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontFamily: "Stretchpro",
                              color: Colors.deepOrange,
                              letterSpacing: 0.5,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(height: 20),
                        Text('$workout1_2'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: "Stretchpro",
                            color: Colors.white,
                            letterSpacing: 0.5,
                            fontSize: 14,
                          ),
                        ),
                        Text('X12'.toUpperCase(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontFamily: "Stretchpro",
                              color: Colors.deepOrange,
                              letterSpacing: 0.5,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(height: 20),
                        Text('$workout1_3'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: "Stretchpro",
                            color: Colors.white,
                            letterSpacing: 0.5,
                            fontSize: 14,
                          ),
                        ),
                        Text('X12'.toUpperCase(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontFamily: "Stretchpro",
                              color: Colors.deepOrange,
                              letterSpacing: 0.5,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(height: 20),
                        Text('$workout1_4'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: "Stretchpro",
                            color: Colors.white,
                            letterSpacing: 0.5,
                            fontSize: 14,
                          ),
                        ),
                        Text('X12'.toUpperCase(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontFamily: "Stretchpro",
                              color: Colors.deepOrange,
                              letterSpacing: 0.5,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('SETS X$rep1'.toUpperCase(),
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontFamily: "Stretchpro",
                                  color: Colors.amber,
                                  letterSpacing: 0.5,
                                  fontSize: 18
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Card(
                color: HexColor("#0D0D0D"),
                child: new InkWell(
                  onTap: () {
                    print("tapped");
                  },
                  child: Container(
                    width: 400,
                    height: 300,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('$workout2_1'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: "Stretchpro",
                            color: Colors.white,
                            letterSpacing: 0.5,
                            fontSize: 14,
                          ),
                        ),
                        Text('X12'.toUpperCase(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontFamily: "Stretchpro",
                              color: Colors.deepOrange,
                              letterSpacing: 0.5,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(height: 20),
                        Text('$workout2_2'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: "Stretchpro",
                            color: Colors.white,
                            letterSpacing: 0.5,
                            fontSize: 14,
                          ),
                        ),
                        Text('X12'.toUpperCase(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontFamily: "Stretchpro",
                              color: Colors.deepOrange,
                              letterSpacing: 0.5,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(height: 20),
                        Text('$workout2_3'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: "Stretchpro",
                            color: Colors.white,
                            letterSpacing: 0.5,
                            fontSize: 14,
                          ),
                        ),
                        Text('X12'.toUpperCase(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontFamily: "Stretchpro",
                              color: Colors.deepOrange,
                              letterSpacing: 0.5,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(height: 20),
                        Text('$workout2_4'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: "Stretchpro",
                            color: Colors.white,
                            letterSpacing: 0.5,
                            fontSize: 14,
                          ),
                        ),
                        Text('X12'.toUpperCase(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontFamily: "Stretchpro",
                              color: Colors.deepOrange,
                              letterSpacing: 0.5,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('SETS X$rep2'.toUpperCase(),
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontFamily: "Stretchpro",
                                  color: Colors.amber,
                                  letterSpacing: 0.5,
                                  fontSize: 18
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}