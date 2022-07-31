import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:services_app_flutter/screens/google_map_screen.dart';
Color colorOrange = Colors.orange.shade400;
Color colorGrey = Colors.grey.shade800;

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({
    Key key,
    @required this.name,
    @required this.iconn,
    @required this.description,
  }) : super(key: key);
  final String name;
  final String iconn;
  final String description;

  @override
  _GeneralScreenState createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.grey.shade800,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 5.0,
        title: Text(
          "${widget.name} Service",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.grey.shade800,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/icons8-${widget.iconn}-256.png",
                        width: width - 0.6,
                        height: height - 0.7,
                      ),
                    ],
                  ),
                ),
              ),
              width: double.infinity,
              height: height * 0.25,
              decoration: BoxDecoration(
                // color: Colors.orange.shade300,
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF1934EA),
                                Colors.blueAccent,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF1934EA),
                                blurRadius: 3.0,
                                offset: Offset(0, 3.0),
                              ),
                            ],
                          ),
                          width: width * 0.23,
                          height: height * 0.07,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              Text(
                                "Rated by User",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.0),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.green.shade700,
                                Colors.greenAccent,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.shade700,
                                blurRadius: 3.0,
                                offset: Offset(0, 3.0),
                              ),
                            ],
                          ),
                          width: width * 0.23,
                          height: height * 0.07,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Rs.200",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              Text(
                                "Starting from",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.0),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.purple.shade700,
                                Colors.purpleAccent,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purple.shade700,
                                blurRadius: 3.0,
                                offset: Offset(0, 3.0),
                              ),
                            ],
                          ),
                          width: width * 0.23,
                          height: height * 0.07,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              Text(
                                "Done so far",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.037,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${widget.name} Service Features",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.037,
                    ),
                    ServiceDescription(
                      width: width,
                      description:
                      "Hourly, Daily, Weekly and Monthly Subscription.",
                    ),
                    ServiceDescription(
                      width: width,
                      description: "4-Step Trained ${widget.description} Professionals.",
                    ),
                    ServiceDescription(
                      width: width,
                      description: "Background Checked, Verified and Trusted.",
                    ),
                    ServiceDescription(
                      width: width,
                      description: "Affordable Price with Custom Packages.",
                    ),
                    ServiceDescription(
                      width: width,
                      description: "Available AnyWhere in Muzaffarabad.",
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 70.0, vertical: 30.0),
                            child: ElevatedButton(
                              onPressed: () {
                                showBottomSheet(context);


                              },
                              child: Text(
                                "Book this Service",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      side: BorderSide(
                                          color: Colors.orange.shade400)),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.orange.shade400),
                                padding:
                                MaterialStateProperty.all(EdgeInsets.all(15)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future showBottomSheet(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Container(
        child: Container(
          padding: EdgeInsets.all(15.0),
          width: double.infinity,
          height: height * 0.3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Sub-Service",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: Colors.grey.shade200,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CheckBox(),
                      Text("Repairing of an existing Item", style: TextStyle(fontSize: 13.0),),
                    ],
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CheckBox(),
                      Text("Complete Installation of, Taps, Geyser, Showers etc" , style: TextStyle(fontSize: 13.0),),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GoogleMapScreen()));
                    },
                    child: Text(
                      "Done",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                                color: Colors.orange.shade400)),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          Colors.orange.shade400),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.all(5)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceDescription extends StatelessWidget {
  const ServiceDescription({
    Key key,
    @required this.width,
    @required this.description,
  }) : super(key: key);

  final double width;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            Icons.check_circle_outline_outlined,
            color: colorOrange,
          ),
          SizedBox(
            width: width * 0.04,
          ),
          Text(
            description,
            style: TextStyle(color: colorGrey, fontSize: 13.0),
          )
        ],
      ),
    );
  }
}



class CheckBox extends StatefulWidget {
  const CheckBox({Key key}) : super(key: key);

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.grey;
      }
      return colorOrange;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool value) {
        setState(() {
          isChecked = value;
        });
      },
    );
  }
}
