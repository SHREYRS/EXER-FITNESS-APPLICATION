import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:login_test/models/user.dart';
import 'package:login_test/models/userss.dart';
import 'package:login_test/screens/home/undofyfeature.dart';
import 'package:login_test/services/database.dart';
import 'package:login_test/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:url_launcher/url_launcher.dart';
import 'undofyfeature.dart';



class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  _launchURL() async {
    const url = 'https://www.nhlbi.nih.gov/health/educational/lose_wt/BMI/bmicalc.htm';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {



    void _showSettingsPanelbmi(){
      final user = Provider.of<User>(context);

      showModalBottomSheet(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)),
          backgroundColor: HexColor("#171717"),
          context: context,
          builder: (context){
            return StreamBuilder<UserData>(
                stream: DatabaseService(uid: user.uid).userData,
                builder: (context, snapshot) {
                  UserData userData = snapshot.data;
                  int _userweight = userData.weight;
                  double heightmt = (userData.height_feet* 0.3048) + (userData.height_inches*0.0254);
                  heightmt = heightmt*heightmt;
                  double heighttmt = double.parse((heightmt).toStringAsFixed(2));
                  double bmi;
                  String bmi_text = '';
                  bmi = _userweight/heighttmt;
                  bmi = double.parse((bmi).toStringAsFixed(2));
                  if(bmi<18.5){
                    bmi_text = 'Under Weight';
                  } else if(bmi>18.5 && bmi<24.9){
                    bmi_text = 'Normal';
                  } else if(bmi>24.9&& bmi<29.9){
                    bmi_text = 'Over Weight';
                  } else {
                    bmi_text = 'Obese';
                  }
                  print(bmi_text);

                  return Container(
                    height: 1500,
                    padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                    child: Column(
                      children: [
                        Text('BMI',
                          style: TextStyle(
                            fontFamily: "Stretchpro",
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                          child: Container(
                            height: 250.0,
                            width: 300.0,
                            child: SfRadialGauge(
                              // enableLoadingAnimation: true, animationDuration: 4500,
                                axes: <RadialAxis>[
                                  RadialAxis(minimum: 10,maximum: 40,showLabels: false, showAxisLine: false, showTicks: false,
                                      ranges: <GaugeRange>[
                                        GaugeRange(
                                          startValue: 0,
                                          endValue: 18.5,
                                          color: Colors.yellow,
                                          label: "Under-weight",
                                          labelStyle: GaugeTextStyle(
                                              fontFamily: "Productsans",
                                              fontWeight: FontWeight.bold
                                          ),
                                          startWidth: 40,
                                          endWidth: 40,
                                        ),
                                        GaugeRange(
                                          startValue: 18.6,
                                          endValue: 24.9,
                                          color: Colors.amber,
                                          label: "Normal",
                                          labelStyle: GaugeTextStyle(
                                              fontFamily: "Productsans",
                                              fontWeight: FontWeight.bold
                                          ),
                                          startWidth: 40,
                                          endWidth: 40,
                                        ),
                                        GaugeRange(
                                          startValue: 25,
                                          endValue: 29.9,
                                          color: Colors.orange,
                                          label: "Over-weight",
                                          labelStyle: GaugeTextStyle(
                                              fontFamily: "Productsans",
                                              fontWeight: FontWeight.bold
                                          ),
                                          startWidth: 40,
                                          endWidth: 40,
                                        ),
                                        GaugeRange(
                                          startValue: 30,
                                          endValue: 40,
                                          color: Colors.red,
                                          label: "Obese",
                                          labelStyle: GaugeTextStyle(
                                              fontFamily: "Productsans",
                                              fontWeight: FontWeight.bold
                                          ),
                                          startWidth: 40,
                                          endWidth: 40,
                                        ),
                                      ],
                                      pointers: <GaugePointer>[NeedlePointer(
                                        needleColor: Colors.white,
                                        value:bmi,
                                        enableAnimation: true,
                                      ),
                                      ],
                                      annotations: <GaugeAnnotation>[
                                        GaugeAnnotation(widget: Container(child:
                                        Text(bmi.toString(),style: TextStyle(fontSize: 18,fontFamily: "Productsans", color: Colors.white,fontWeight:FontWeight.bold))),
                                            angle: 90,positionFactor: 0.5)]
                                  )]
                            ),
                          ),
                        ),
                        // Text('You are $bmi_text'),
                        ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                            ),
                            onPressed: () {},
                            icon: Icon(
                              Icons.accessibility_new_sharp,
                              color: Colors.black,
                            ),
                            label: Text('You Fall Under $bmi_text Category', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "Productsans", color: Colors.black),))

                      ],
                    ),
                  );
                }
            );
          });
    }

    void _showundofeature() {
      showModalBottomSheet(
          backgroundColor: Colors.black,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          context: context,
          builder: (context){
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              child: UndofyFeature(),
            );
          });
    }


    final usersdata = Provider.of<List<Userss>>(context) ?? [];
    usersdata.forEach((userss) {
    });
    final user = Provider.of<User>(context);


    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,

        builder: (context, snapshot) {
          if(snapshot.hasData) {
            UserData userData = snapshot.data;
            int _userage = userData.age;
            int _userweight = userData.weight;
            int UserheightF = userData.height_feet;
            int UserheightI = userData.height_inches;
            double heightmt = (userData.height_feet* 0.3048) + (userData.height_inches*0.0254);
            heightmt = heightmt*heightmt;
            double heighttmt = double.parse((heightmt).toStringAsFixed(2));
            getuser(userData.gender, userData.age, userData.weight, userData.height_feet, userData.height_inches);

            return Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Card(
                      margin: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            gradient: LinearGradient(
                              colors: [HexColor("#ff4000"), HexColor("#ffbb00")],
                            )
                        ),
                        child: Card(
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/spikes.png'),
                                  fit: BoxFit.cover,
                                )),
                            height: 450,
                            // color: Colors.white,
                            child: Row(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    // child: Expanded(
                                    //   child:Image.asset("assets/images/shape_of_you.png"),
                                    //   flex:2 ,
                                    // ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(0, 30, 10, 0),
                                    // alignment: Alignment.topLeft,
                                    child: Column(
                                      textDirection: TextDirection.ltr,
                                      children: [
                                        Expanded(
                                          flex: 10,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              ElevatedButton.icon(
                                                onPressed: null,
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(HexColor("#0F0F0F")),
                                                ),
                                                icon: Icon(// <-- Icon
                                                  Icons.person,
                                                  size: 24.0,
                                                  color: Colors.deepOrange,
                                                ),
                                                label: Text(userData.name,
                                                  style: TextStyle(
                                                      letterSpacing: 1,
                                                      fontSize: 14,
                                                      fontFamily: "Productsans",
                                                      color: Colors.white
                                                  ),
                                                ), // <-- Text
                                              ),
                                              ElevatedButton.icon(
                                                onPressed: null,
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(HexColor("#0F0F0F")),
                                                ),
                                                icon: Icon( // <-- Icon
                                                  Icons.flag_outlined,
                                                  size: 24.0,
                                                  color: Colors.deepOrange,
                                                ),
                                                label: Text(userData.gender,
                                                  style: TextStyle(
                                                      letterSpacing: 1,
                                                      fontSize: 14,
                                                      fontFamily: "Productsans",
                                                      color: Colors.white
                                                  ),
                                                ), // <-- Text
                                              ),
                                              ElevatedButton.icon(
                                                onPressed: null,
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(HexColor("#0F0F0F")),
                                                ),
                                                icon: Icon( // <-- Icon
                                                  Icons.timeline,
                                                  size: 24.0,
                                                  color: Colors.deepOrange,
                                                ),
                                                label: Text('Age $_userage',
                                                  style: TextStyle(
                                                      letterSpacing: 1,
                                                      fontSize: 14,
                                                      fontFamily: "Productsans",
                                                      color: Colors.white
                                                  ),
                                                ), // <-- Text
                                              ),
                                              ElevatedButton.icon(
                                                onPressed: null,
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(HexColor("#0F0F0F")),
                                                ),
                                                icon: Icon( // <-- Icon
                                                  Icons.accessibility_new_outlined,
                                                  size: 24.0,
                                                  color: Colors.deepOrange,
                                                ),
                                                label: Text('Weight $_userweight kg',
                                                  style: TextStyle(
                                                      letterSpacing: 1,
                                                      fontSize: 14,
                                                      fontFamily: "Productsans",
                                                      color: Colors.white
                                                  ),
                                                ), // <-- Text
                                              ),
                                              ElevatedButton.icon(
                                                onPressed: null,
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(HexColor("#0F0F0F")),
                                                ),
                                                icon: Icon( // <-- Icon
                                                  Icons.height_outlined,
                                                  size: 24.0,
                                                  color: Colors.deepOrange,
                                                ),
                                                label: Text('Height $UserheightF ft $UserheightI in',
                                                  style: TextStyle(
                                                      letterSpacing: 1,
                                                      fontSize: 14,
                                                      fontFamily: "Productsans",
                                                      color: Colors.white
                                                  ),
                                                ), // <-- Text
                                              ),
                                              ElevatedButton.icon(
                                                onPressed: () =>_showSettingsPanelbmi(),
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                                ),
                                                icon: Icon( // <-- Icon
                                                  Icons.speed_rounded,
                                                  size: 24.0,
                                                  color: Colors.black,
                                                ),
                                                label: Text('Check BMI',
                                                  style: TextStyle(
                                                    letterSpacing: 1,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "Productsans",
                                                    color: Colors.black,
                                                  ),
                                                ), // <-- Text
                                              ),
                                            ],
                                          ),

                                        ),
                                      ],
                                    ),
                                  ),
                                  flex: 8,
                                ),
                              ],
                            ),
                          ),
                          elevation: 8,
                          margin: EdgeInsets.all(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox.fromSize(
                        size: Size(56, 56),
                        child: ClipOval(
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              splashColor: Colors.deepOrange,
                              onTap: () => _showundofeature(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.undo_sharp,
                                    color: Colors.black,
                                  ), // <-- Icon
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'GET RID OF THOSE CALORIES!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Productsans",
                          color: Colors.deepOrange,
                        ),

                      ),
                      SizedBox(width: 8,)
                    ],
                  ),
                ),

                SizedBox(width: 8,),
              ],

            );
          } else {
            return Loading();
          }

        }
    );
  }


}