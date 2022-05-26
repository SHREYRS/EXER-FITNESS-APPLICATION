import 'package:flutter/material.dart';
import 'package:login_test/screens/wrapper.dart';
import 'package:login_test/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:login_test/models/user.dart';
import 'package:change_app_package_name/change_app_package_name.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
