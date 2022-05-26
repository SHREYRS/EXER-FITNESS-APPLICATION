import 'package:flutter/material.dart';
import 'package:login_test/screens/authenticate/authenticate.dart';
import 'package:login_test/screens/home/home.dart';
import 'package:login_test/models/user.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    //return either home or authenticate.
    if(user==null){
      return Authenticate();
    } else{
      return Home();
    }
  }
}
