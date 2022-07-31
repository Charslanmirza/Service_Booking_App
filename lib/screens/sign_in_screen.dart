import 'package:flutter/material.dart';
import 'package:services_app_flutter/screens/menu_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

Color colorr = Colors.orange.shade500;

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  bool obscure_text = true;
  Icon iconfirst = Icon(
    Icons.visibility_off,
    color: Colors.grey.shade300,
  );

  @override
  Widget build(BuildContext context) {
    String email;
    String password;

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        color: Colors.orange.shade500,
        child: Container(
          height: height * 1.0,
          width: width * 1.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.red.shade500, Colors.orange.shade500]),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: width * 0.7,
                          height: height * 0.02,
                          decoration: BoxDecoration(
                            color: Colors.orange.shade300,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            // gradient: LinearGradient(begin: Alignment.topCenter,
                            //     end: Alignment.bottomCenter,colors: [Colors.red.shade500 , Colors.orange.shade500]),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: width * 0.9,
                            height: height * 0.75,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              // gradient: LinearGradient(begin: Alignment.topCenter,
                              //     end: Alignment.bottomCenter,colors: [Colors.red.shade500 , Colors.orange.shade500]),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 0.05,
                                ),
                                Text(
                                  "Sign In",
                                  style: TextStyle(
                                      fontSize: 40.0,
                                      color: Colors.orange.shade500,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Pacifico"),
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.orange.shade500,
                                        // set border color
                                        width: 3.0),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 0.0, horizontal: 40.0),
                                  child: TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (value) {
                                      email = value;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: colorr,
                                      ),
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                        color: colorr,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 17.0,
                                ),
                                Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.orange.shade500,
                                        // set border color
                                        width: 3.0),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 0.0, horizontal: 40.0),
                                  child: TextField(
                                    onChanged: (value) {
                                      password = value;
                                    },
                                    obscureText: obscure_text,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: colorr,
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (obscure_text == true) {
                                              obscure_text = false;
                                              iconfirst = Icon(
                                                Icons.visibility,
                                                color: colorr,
                                              );
                                            } else {
                                              obscure_text = true;
                                              iconfirst = Icon(
                                                Icons.visibility_off,
                                                color: Colors.grey.shade300,
                                              );
                                            }
                                          });
                                        },
                                        child: iconfirst,
                                      ),
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        color: colorr,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 38.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MenuScreen()));
                                  },
                                  child: GestureDetector(
                                    // onTap: () async {
                                    //   setState(() {
                                    //     showSpinner = true;
                                    //   });
                                    //   try {
                                    //     final user =
                                    //     await _auth.signInWithEmailAndPassword(
                                    //         email: email, password: password);

                                    //     if (user != null) {
                                    //       Navigator.push(context, MaterialPageRoute(builder: (context) => MenuScreen()));

                                    //     }

                                    //     setState(() {
                                    //       showSpinner = false;
                                    //     });
                                    //   } catch(e) {
                                    //     print(e);
                                    //   }
                                    // },
                                    child: Container(
                                      width: 170.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.orange.shade800,
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.orange.shade900,
                                            blurRadius: 2.0,
                                            spreadRadius: 0.0,
                                            offset: Offset(0.0,
                                                2.0), // shadow direction: bottom right
                                          )
                                        ],
                                      ),
                                      margin: EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 20.0),
                                      child: Center(
                                          child: Text(
                                        "Sign In",
                                        style: TextStyle(
                                            fontFamily: "Pacifico",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25.0,
                                            color: Colors.white),
                                      )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.09,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                                  child: Text(
                                    "Or using social media",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
                                  // color: Colors.green,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      fblogo(
                                          'assets/iconsforsignup/facebook.png'),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                      googlelogo(
                                          'assets/iconsforsignup/google.png'),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 35.0,
                                ),
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  // color: Colors.red,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child: Text(
                                          "Not have an account?",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade500),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignInScreen()));
                                        },
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          "Sign Up",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, "/signup");
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container googlelogo(String imageurl) {
    return Container(
      child: Image(
        image: AssetImage(
          imageurl,
        ),
        fit: BoxFit.cover,
      ),
      height: 40,
      width: 40,
    );
  }

  Container fblogo(String imageurl) {
    return Container(
      child: Image(
        image: AssetImage(
          imageurl,
        ),
        fit: BoxFit.cover,
      ),
      height: 40,
      width: 40,
    );
  }
}
