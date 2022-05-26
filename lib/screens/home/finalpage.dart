import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'nextscreen.dart';
import 'undofyfeature.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:slider_button/slider_button.dart';


class finalpage extends StatefulWidget {
  @override
  State<finalpage> createState() => _finalpageState();
}

class _finalpageState extends State<finalpage> {


  Map<String, bool> equipment = {
    'dumbbell' : false,
    'barbell' : false,
    'body weight' : true,
  };

  Map<String, bool> pain = {
    'leg': false,
    'back': false,
    'arms': false,
    'waist': false,
    'shoulder' : false,
    'chest' : false,
    'cardio' : false,

  };

  Map<String, bool> target = {
    'cardio target' : false,
    'abs' : false,
    'legs muscle' : false,
    'arms muscle' : false,
    'back muscle' : false,
    'chest muscle' : false,
    'delts' : false,
    'glutes':  false,
  };
  // Body Part: ['upper legs' 'waist' 'upper arms' 'lower legs' 'cardio' 'shoulders'
  // 'lower arms' 'back' 'neck' 'chest']
  //
  // Equipment: ['body weight' 'barbell' 'dumbbell']
  //
  // Target: ['abductors' 'abs' 'adductors' 'biceps' 'calves' 'cardiovascular system'
  // 'delts' 'forearms' 'glutes' 'hamstrings' 'lats' 'levator scapulae'
  // 'pectorals' 'quads' 'serratus anterior' 'spine' 'traps' 'triceps'
  // 'upper back']


// // training boolean
//   bool cardio_t = false;
//   bool abs_t = false;
//   bool legs_t = false;
//   bool arms_t = false;
//   bool back_t = false;
//   bool chest_t = false;
//   bool delts_t = false;
//   bool glutes_t = false;

  _fetchdata(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
  }

  String url = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(HexColor("#1D1D1D")),
              ),
              onPressed: (){},
              icon: Icon(Icons.fastfood_rounded,
                color: Colors.amber[300],
              ),
              label: Container(
                child: Text('Item - $foodname',
                  style: TextStyle(
                      color: Colors.amber[300],
                      fontFamily: "Productsans"
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
            ),
            SizedBox(width: 5.0,),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(HexColor("#1D1D1D")),
              ),
              onPressed: (){},
              icon: Icon(Icons.rice_bowl_outlined,
                color: Colors.amber[300],
              ),
              label: Text('$foodserving',
                style: TextStyle(
                    color: Colors.amber[300],
                    fontFamily: "Productsans"
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(HexColor("#1D1D1D")),
              ),
              onPressed: (){},
              icon: Icon(Icons.directions_run_rounded,
                color: Colors.amber[300],
              ),
              label: Text('$cals cals',
                style: TextStyle(
                    color: Colors.amber[300],
                    fontFamily: "Productsans"
                ),
              ),
            ),
            SizedBox(width: 6.0,),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(HexColor("#1D1D1D")),
              ),
              onPressed: (){},
              icon: Icon(Icons.pie_chart_rounded,
                color: Colors.amber[300],
              ),
              label: Text('Qty - $quant',
                style: TextStyle(
                    color: Colors.amber[300],
                    fontFamily: "Productsans"
                ),
              ),
            ),

          ],
        ),
        SizedBox(width: 6.0,),
        ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.amber[300]),
          ),
          onPressed: (){},
          icon: Icon(Icons.calculate_sharp,
            color: Colors.black,
          ),
          label: Text('  Total Calories Consumed - $totall cals  ',
            style: TextStyle(
              letterSpacing: 0.7,
              fontSize: 14,
              color: Colors.black,
              fontFamily: "Productsans",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20.0,),
        Text(
          "Equipment you want to use?",
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: "Productsans",
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(
              color: equipment['dumbbell'] ? Colors.grey[800] : Colors.black12,
              onPressed: () {
                setState(() {
                  equipment['dumbbell'] = !equipment['dumbbell'];
                });
                print(equipment['dumbbell']);
              },
              icon: Image.asset('assets/dumbbell.png',
                color: Colors.deepOrange,
                width: 31,
                height: 31,),
              label: Text(
                'Dumbbell',
                style: TextStyle(
                  fontFamily: "Productsans",
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 5.0,),
            RaisedButton.icon(
              color: equipment['barbell'] ? Colors.grey[800] : Colors.black12,
              onPressed: () {
                setState(() {
                  equipment['barbell']= !equipment['barbell'];
                });
                print(equipment['barbell']);
              },
              icon: Image.asset('assets/barbell.png',
                color: Colors.deepOrange,
                width: 28,
                height: 28,),
              label: Text(
                'Barbell',
                style: TextStyle(
                  fontFamily: "Productsans",
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Text(
          "Do you have any recent injury/pain?",
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: "Productsans",
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(
              color: pain['leg'] ? Colors.grey[800] : Colors.black12,
              onPressed: () {
                setState(() {
                  pain['leg'] = !pain['leg'];
                });
                print(pain['leg']);

              },
              icon: Image.asset(
                'assets/leg.png',
                color: Colors.deepOrange,
                width: 35,
                height: 30,
              ),
              label: Text(
                'Leg/Ankle',
                style: TextStyle(
                  fontFamily: "Productsans",
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 5.0,),
            RaisedButton.icon(
              color: pain['arms'] ? Colors.grey[800] : Colors.black12,
              onPressed: () {
                setState(() {
                  pain['arms'] = !pain['arms'];
                });
                print(pain['arms']);
              },
              icon: Image.asset('assets/arm.png',
                color: Colors.deepOrange,
                width: 35,
                height: 35,
              ),
              label: Text(
                'Arms',
                style: TextStyle(
                  fontFamily: "Productsans",
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 5.0,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(
              color: pain['back'] ? Colors.grey[800] : Colors.black12,
              onPressed: () {
                setState(() {
                  pain['back'] = !pain['back'];
                });
                print(pain['back']);
              },
              icon: Image.asset('assets/back.png',
                color: Colors.deepOrange,
                width: 35,
                height: 35,),
              label: Text(
                'Back',
                style: TextStyle(
                  fontFamily: "Productsans",
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 5.0,),
            RaisedButton.icon(
              color: pain['shoulder'] ? Colors.grey[800] : Colors.black12,
              onPressed: () {
                setState(() {
                  pain['shoulder'] = !pain['shoulder'];
                });
                print(pain['shoulder']);
              },
              icon: Image.asset('assets/shoulders.png',
                color: Colors.deepOrange,
                width: 35,
                height: 35,),
              label: Text(
                'Shoulder',
                style: TextStyle(
                  fontFamily: "Productsans",
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 5.0,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(
              color: pain['waist'] ? Colors.grey[800] : Colors.black12,
              onPressed: () {
                setState(() {
                  pain['waist'] = !pain['waist'];
                });
                print(pain['waist']);
              },
              icon: Image.asset('assets/waist.png',
                color: Colors.deepOrange,
                width: 34,
                height: 34,),
              label: Text(
                'Waist',
                style: TextStyle(
                  fontFamily: "Productsans",
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 5.0,),
            RaisedButton.icon(
              color: pain['chest'] ? Colors.grey[800] : Colors.black12,
              onPressed: () {
                setState(() {
                  pain['chest'] = !pain['chest'];
                });
                print(pain['chest']);
              },
              icon: Image.asset('assets/chest.png',
                color: Colors.deepOrange,
                width: 34,
                height: 34,),
              label: Text(
                'Chest',
                style: TextStyle(
                  fontFamily: "Productsans",
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),

        // areas to target
        SizedBox(height: 20.0,),
        Text(
          "Which part do you want to train today?",
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: "Productsans",
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(
              color: target['cardio target'] ? Colors.grey[800] : Colors.black12,
              onPressed: () {
                setState(() {
                  target['cardio target'] = !target['cardio target'];
                });
                print(target['cardio target']);
              },
              icon: Image.asset('assets/heart.png',
                color: Colors.deepOrange,
                width: 35,
                height: 35,),
              label: Text(
                'Cardio',
                style: TextStyle(
                  fontFamily: "Productsans",
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 5.0,),
            RaisedButton.icon(
              color: target['abs'] ? Colors.grey[800] : Colors.black12,
              onPressed: () {
                setState(() {
                  target['abs'] = !target['abs'];
                });
                print(target['abs']);
              },
              icon: Image.asset('assets/abs.png',
                color: Colors.deepOrange,
                width: 31,
                height: 31,),
              label: Text(
                'Abs',
                style: TextStyle(
                  fontFamily: "Productsans",
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 5.0,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(
              color: target['legs muscle'] ? Colors.grey[800] : Colors.black12,
              onPressed: () {
                setState(() {
                  target['legs muscle'] = !target['legs muscle'];
                });
                print(target['legs muscle']);
              },
              icon: Image.asset('assets/leg.png',
                color: Colors.deepOrange,
                width: 35,
                height: 35,
              ),
              label: Text(
                'Legs',
                style: TextStyle(
                  fontFamily: "Productsans",
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 5.0,),
            RaisedButton.icon(
              color: target['arms muscle'] ? Colors.grey[800] : Colors.black12,
              onPressed: () {
                setState(() {
                  target['arms muscle'] = !target['arms muscle'];
                });
                print(target['arms muscle']);
              },
              icon: Image.asset('assets/arm.png',
                color: Colors.deepOrange,
                width: 35,
                height: 35,),
              label: Text(
                'Arms',
                style: TextStyle(
                  fontFamily: "Productsans",
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 5.0,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(
              color: target['back muscle'] ? Colors.grey[800] : Colors.black12,
              onPressed: () {
                setState(() {
                  target['back muscle'] = !target['back muscle'];
                });
                print(target['back muscle']);
              },
              icon: Image.asset('assets/back.png',
                color: Colors.deepOrange,
                width: 35,
                height: 35,),
              label: Text(
                'Back',
                style: TextStyle(
                  fontFamily: "Productsans",
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 5.0,),
            RaisedButton.icon(
              color: target['chest muscle'] ? Colors.grey[800] : Colors.black12,
              onPressed: () {
                setState(() {
                  target['chest muscle'] = !target['chest muscle'];
                });
                print(target['chest muscle']);
              },
              icon: Image.asset('assets/chest.png',
                color: Colors.deepOrange,
                width: 34,
                height: 34,),
              label: Text(
                'Chest',
                style: TextStyle(
                  fontFamily: "Productsans",
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 5.0,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(
              color: target['delts'] ? Colors.grey[800] : Colors.black12,
              onPressed: () {
                setState(() {
                  target['delts'] = !target['delts'];
                });
                print(target['delts']);
              },
              icon: Image.asset('assets/shoulders.png',
                color: Colors.deepOrange,
                width: 35,
                height: 35,),
              label: Text(
                'Delts',
                style: TextStyle(
                  fontFamily: "Productsans",
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 5.0,),
            RaisedButton.icon(
              color: target['glutes'] ? Colors.grey[800] : Colors.black12,
              onPressed: () {
                setState(() {
                  target['glutes'] = !target['glute'];
                });
                print(target['glutes']);
              },
              icon: Image.asset('assets/glutes.png',
                color: Colors.deepOrange,
                width: 35,
                height: 35,
              ),
              label: Text(
                'Glutes',
                style: TextStyle(
                  fontFamily: "Productsans",
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 5.0,),
          ],
        ),
        SizedBox(height: 20.0),
        RaisedButton(
          color: Colors.white,
          onPressed: () async {
            ///Do something here
            // checkpain();
            url = 'http://exerapp.pythonanywhere.com/fitapi?query=' + quant.toString() +
                "&cal=" + cals.toString() + "&gen=" + gen.toString() + "&age=" + age.toString() +
                "&pain=" + pain.toString() + "&target=" + target.toString() + "&equip=" + equipment.toString();
            data = await _fetchdata(url);
            // data = await _fetchdata(url);
            var decoded = jsonDecode(data);
            setState(() {
              output = decoded['output_cal'];
            });
            setState(() {
              rep1 = decoded['rep1'];
            });
            setState(() {
              rep2 = decoded['rep2'];
            });
            setState(() {
              val1 = decoded['val1'];
            });
            setState(() {
              val2 = decoded['val2'];
            });
            setState(() {
              work1_1 = decoded['work1_1'];
            });
            setState(() {
              work1_2 = decoded['work1_2'];
            });
            setState(() {
              work1_3 = decoded['work1_3'];
            });
            setState(() {
              work1_4 = decoded['work1_4'];
            });
            setState(() {
              work2_1 = decoded['work2_1'];
            });
            setState(() {
              work2_2 = decoded['work2_2'];
            });
            setState(() {
              work2_3 = decoded['work2_3'];
            });
            setState(() {
              work2_4 = decoded['work2_4'];
            });
            print(output);
            print(rep1);
            print(work1_1);
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>nextscreen()));
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),

          child: Container(
            constraints: BoxConstraints(maxWidth: 200.0, minHeight: 45.0),
            alignment: Alignment.center,
            child: Text(
              "CONFIRM",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Stretchpro",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(height: 3.8,)

      ],
      // , , , , (Buttocks)
    );
  }
}

String output;
String rep1;
String rep2;

String val1;
String val2;

String work1_1;
String work1_2;
String work1_3;
String work1_4;

String work2_1;
String work2_2;
String work2_3;
String work2_4;
