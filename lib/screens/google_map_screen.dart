import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:services_app_flutter/providers/bloc.dart';


class GoogleMapScreen extends StatefulWidget {
  GoogleMapScreen({Key key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  DateTime _chosenDateTime;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final provmaps = Provider.of<ProviderMaps>(context);
    return provmaps.activegps == false
        ? Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 250,
                  width: 250,
                  child: Image.asset('assets/images/nogps.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'You must activate GPS to get your location',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                RaisedButton(
                  onPressed: () {
                    provmaps.getUserLocation();
                  },
                  child: Text('try again'),
                )
              ],
            ),
          ),
        ))
        : Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.grey.shade800,
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 5.0,
        title: Text(
          "Select your location",
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
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.red,
            height: height * 0.9,
            width: width * 1.0,
            child: GoogleMap(
              zoomControlsEnabled: true,
              compassEnabled: true,
              // mapType: MapType.normal,
              //markers:provmaps.markers,
              onCameraMove: provmaps.onCameraMove,
              initialCameraPosition: CameraPosition(
                  target: provmaps.initialPos, zoom: 18.0),
              onMapCreated: provmaps.onCreated,
              onCameraIdle: () async {
                provmaps.getMoveCamera();
              },
            ),
          ),
          Positioned(
            bottom: 100,
            right: 10,
            child: FloatingActionButton(
              mini: true,
              onPressed: provmaps.getUserLocation,
              backgroundColor: Colors.orange.shade400,
              child: Icon(
                Icons.gps_fixed,
                color: Colors.white,
              ),
            ),
          ),
          /*,*/
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                color: Colors.white,
                height: height * 0.06,
                width: width * 0.8,
                child: TextField(
                  maxLines: 1,
                  controller: provmaps.locationController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.map),
                      //hintText: 'CoNstr@seña',
                      border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.white),
                          borderRadius:
                          BorderRadius.circular(10))),
                ),

              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset("assets/images/marker3.png")
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70.0, vertical: 30.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _showDatePicker(context);


                        },
                        child: Text(
                          "Select Location",
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
            ],
          ),
        ],
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
                children: [

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
  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    var height = MediaQuery.of(context).size.height;

    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
          height: height * 0.3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25)),
          ),
          child: Column(
            children: [
              Container(
                height: height * 0.2,
                child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (val) {
                      setState(() {
                        _chosenDateTime = val;
                      });
                    }),
              ),

              // Close the modal
              Material(child: IconButton(icon: Icon(Icons.arrow_forward_rounded), color: Colors.orange.shade400, iconSize: 40.0, onPressed: () {}))
            ],
          ),
        ));
  }

}

/////////////////////////////////////////////////////////////////////////
// class CustomPicker extends CommonPickerModel {
//   String digits(int value, int length) {
//     return '$value'.padLeft(length, "0");
//   }
//
//   CustomPicker({DateTime? currentTime, LocaleType? locale})
//       : super(locale: locale) {
//     this.currentTime = currentTime ?? DateTime.now();
//     this.setLeftIndex(this.currentTime.hour);
//     this.setMiddleIndex(this.currentTime.minute);
//     this.setRightIndex(this.currentTime.second);
//   }
//   @override
//   String? leftStringAtIndex(int index) {
//     if (index >= 0 && index < 24) {
//       return this.digits(index, 2);
//     } else {
//       return null;
//     }
//   }
//
//   @override
//   String? middleStringAtIndex(int index) {
//     if (index >= 0 && index < 60) {
//       return this.digits(index, 2);
//     } else {
//       return null;
//     }
//   }
//
//   @override
//   String? rightStringAtIndex(int index) {
//     if (index >= 0 && index < 60) {
//       return this.digits(index, 2);
//     } else {
//       return null;
//     }
//   }
//
//   @override
//   String leftDivider() {
//     return "|";
//   }
//
//   @override
//   String rightDivider() {
//     return "|";
//   }
//
//   @override
//   List<int> layoutProportions() {
//     return [1, 2, 1];
//   }
//
//   @override
//   DateTime finalTime() {
//     return currentTime.isUtc
//         ? DateTime.utc(
//         currentTime.year,
//         currentTime.month,
//         currentTime.day,
//         this.currentLeftIndex(),
//         this.currentMiddleIndex(),
//         this.currentRightIndex())
//         : DateTime(
//         currentTime.year,
//         currentTime.month,
//         currentTime.day,
//         this.currentLeftIndex(),
//         this.currentMiddleIndex(),
//         this.currentRightIndex());
//   }
// }