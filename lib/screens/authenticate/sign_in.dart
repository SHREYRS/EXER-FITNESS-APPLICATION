import 'package:flutter/material.dart';
import 'package:login_test/services/auth.dart';
import 'package:login_test/shared/constants.dart';
import 'package:login_test/shared/loading.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor("#0C0C0C"),
      body:
      // SingleChildScrollView(
      //   child: Container(
      //     child: Column(
      //       children: [
      //         Container(
      //           height: 250,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.all(Radius.circular(30)),
      //             image: DecorationImage(
      //               image: AssetImage("assets/signin-1.png"),
      //               fit: BoxFit.fill,
      //             )
      //           ),
      //         ),
      //         Padding(
      //             padding: EdgeInsets.all(35),
      //           child: Column(
      //             children: [
      //               Container(
      //                 padding: EdgeInsets.all(5),
      //                 decoration: BoxDecoration(
      //                   color: HexColor("#000000"),
      //                   borderRadius: BorderRadius.circular(10),
      //                   boxShadow: [
      //                     BoxShadow(
      //                       color: HexColor("#ff6a00"),
      //                       blurRadius: 9,
      //                       offset: Offset(0,5),
      //                     )
      //                   ]
      //                 ),
      //                 child: Column(
      //                   children: [
      //                     Container(
      //                       padding: EdgeInsets.all(8),
      //                       decoration: BoxDecoration(
      //                           border: Border(
      //                               bottom: BorderSide(
      //                                   color: Colors.white
      //                               )
      //                           )
      //                       ),
      //                       child: TextField(
      //                         style:
      //                         TextStyle(
      //                             color: Colors.white,
      //                           fontFamily: "Productsans",
      //                         ),
      //                         decoration: InputDecoration(
      //                           border: InputBorder.none,
      //                           hintText: "Email",
      //                           hintStyle: TextStyle(
      //                               color: Colors.grey,
      //                               fontFamily: "Productsans",
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                     Container(
      //                       padding: EdgeInsets.all(8),
      //                       child: TextField(
      //                         style:
      //                         TextStyle(
      //                           color: Colors.white,
      //                           fontFamily: "Productsans",
      //                         ),
      //                         decoration: InputDecoration(
      //                           border: InputBorder.none,
      //                           hintText: "Password",
      //                           hintStyle: TextStyle(
      //                             color: Colors.grey,
      //                             fontFamily: "Productsans",
      //                           ),
      //                         ),
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 50,
      //               ),
      //               Container(
      //                 height: 50,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(30),
      //                   gradient: LinearGradient(
      //                     colors: [
      //                       HexColor("#ff4000"),
      //                       HexColor("#ffbb00"),
      //                     ],
      //                   ),
      //                 ),
      //                 child: Center(
      //                   child: Text(
      //                       "LOGIN",
      //                        style: TextStyle(
      //                          fontWeight: FontWeight.bold,
      //                       fontSize: 18,
      //                       letterSpacing: 1,
      //                       fontFamily: "Productsans"
      //                   )
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(height: 70,),
      //               Text(
      //                   "Register?",
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18,
      //                       letterSpacing: 1,
      //                       fontFamily: "Productsans"
      //                   )
      //               ),
      //            ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      Container(
          child: Column(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    image: DecorationImage(
                      image: AssetImage("assets/signin-1.png"),
                      fit: BoxFit.fill,
                    )
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        TextFormField(
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Productsans"
                          ),
                          cursorColor: HexColor("#ff6a00"),
                          decoration: textInputDecoration.copyWith(
                            fillColor: HexColor("#0D0D0D"),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0,color: Colors.white),
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: HexColor("#ff6a00"), width: 1.0),
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Productsans",
                            ),
                          ),
                          validator: (val) => val.isEmpty ? "Enter an Email" : null,
                          onChanged: (val){
                            if(!mounted) return;
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(height: 30.0),
                        TextFormField(
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Productsans"
                          ),
                          cursorColor: HexColor("#ff6a00"),
                          decoration: textInputDecoration.copyWith(
                            fillColor: HexColor("#0D0D0D"),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0,color: Colors.white),
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: HexColor("#ff6a00"), width: 1.0),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Productsans",
                            ),
                          ),
                          obscureText: true,
                          validator: (val) => val.length < 6 ? "Enter a password of 6+ characters" : null,
                          onChanged: (val){
                            if(!mounted) return;
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(height: 40.0),
                        RaisedButton(
                          onPressed: () async{
                            if(_formKey.currentState.validate()){
                              if(!mounted) return;
                              setState(() => loading = true);
                              dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                              if(result == null){
                                if(!mounted) return;
                                setState((){
                                  error = "Could not sign in with those credentials";
                                  loading = false;
                                });
                              }
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [HexColor("#ff4000"), HexColor("#ffbb00")],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 100.0, minHeight: 45.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Sign-In",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Productsans",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                        SizedBox(height: 80),
                        Text(
                          "Don't have an account? Create One!",
                          style: TextStyle(
                            fontFamily: "Productsans",
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 25),
                        OutlineGradientButton(
                          onTap: () {
                            widget.toggleView();
                          },
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text(
                            "Create An Account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Productsans",
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              letterSpacing: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                          strokeWidth: 2,
                          gradient: LinearGradient(
                              colors: [HexColor("#ff4000"), HexColor("#ffbb00")]
                          ),
                          radius: Radius.circular(10),
                        ),
                      ],
                    ),
                  )
              ),
            ],
          )
      ),
    );
  }
}