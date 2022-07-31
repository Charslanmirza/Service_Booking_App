import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'sign_in_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(

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
                  // Container(
                  //   margin: EdgeInsets.all(8.0),
                  //   child: Image(
                  //     image: AssetImage("assets/images/services.png"),
                  //   ),
                  // ),
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
                          height: height * 0.3,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            // gradient: LinearGradient(begin: Alignment.topCenter,
                            //     end: Alignment.bottomCenter,colors: [Colors.red.shade500 , Colors.orange.shade500]),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              options(width: width, height: height, texxt: "Service Provider",),
                              SizedBox(height: height * 0.03,),
                              options(width: width, height: height, texxt: "Service Taker",),
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
    );
  }
}

class options extends StatelessWidget {
  const options({
    Key key,
    @required this.width,
    @required this.height,
    @required this.texxt,
  }) : super(key: key);

  final double width;
  final double height;
  final String texxt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
          },
          child: Container(
            width: width * 0.7,
            height: height * 0.08,
              decoration: BoxDecoration(
                color: Colors.orange.shade500,
                borderRadius: BorderRadius.circular(30),

                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.shade900,
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                    offset: Offset(2.0 , 2.0 ), // shadow direction: bottom right
                  )
                ],
              ),

              child: Center(
                child: Text(
                  texxt,
            style: TextStyle(
                  fontSize: 20.0, color: Colors.white),
          ),
              )),
        )
      ],
    );
  }
}
