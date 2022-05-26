import 'package:flutter/material.dart';
import 'package:login_test/models/userss.dart';
import 'package:login_test/screens/home/settings_form.dart';
import 'package:login_test/services/auth.dart';
import 'package:login_test/services/database.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_test/screens/home/user_list.dart ';


class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: HexColor("#0D0D0D"),
            title: const Text(
              'LOG OUT',
              style: TextStyle(
                // fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Productsans",
                color: Colors.deepOrange,
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                    'Are you sure you want to Log Out?',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "ProductSans",
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Yes',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.deepOrange,
                      fontFamily: "Productsans"
                  ),
                ),
                onPressed: () {
                  _auth.signOut();
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text(
                  'No',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontFamily: "Productsans"
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    void _showSettingsPanel(){
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          backgroundColor: HexColor("#121212"),
          context: context,
          builder: (context){
            return Container(
              padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Userss>>.value(
      value: DatabaseService().usersdata,
      child: Container(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'E',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: "Stretchpro",
                    color: Colors.grey[200],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'X',
                  style: TextStyle(
                    fontSize: 42.0,
                    letterSpacing: 1.5,
                    fontFamily: "Stretchpro",
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'ER',
                  style: TextStyle(
                    fontSize: 22.0,
                    letterSpacing: 1.5,
                    fontFamily: "Stretchpro",
                    color: Colors.grey[200],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: HexColor("#000000"),
            actions: <Widget>[
              SizedBox(
                width: 30.0,
                height: 80.0,
                child: FlatButton(
                  child : Icon(Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    // await _auth.signOut();
                    _showMyDialog();
                  },
                ),
              ),
              SizedBox(
                width: 85.0,
                height: 80.0,
                child: FlatButton(
                  onPressed: () => _showSettingsPanel(),
                  child : Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/appbackground.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              child: UserList(),
            ),
          ),
        ),
      ),
    );
  }
}
