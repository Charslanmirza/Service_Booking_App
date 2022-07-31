import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:services_app_flutter/screens/general_services_screen_1.dart';

var cardColor = Colors.white;
var activeCardColor = Color(0xFF464657);

class MenuScreen extends StatefulWidget {
  final String value;

  MenuScreen({Key key, this.value}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    getUser();
  }

  void getUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      // key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade400,
        elevation: 0.0,
        title: Text("Order a Service"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      drawer: SafeArea(
        child: Container(
          width: width * 0.7,
          color: Colors.orange.shade200,
          child: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.orange.shade200,
                            radius: 50.0,
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                DrawerList(
                  iconName: Icons.location_on,
                  texxt: 'Address',
                ),
                // Divider(height: 1.0, color: Colors.grey.shade600, indent: 40.0, endIndent: 40.0,),
                DrawerList(
                  iconName: Icons.star,
                  texxt: 'Rate',
                ),
                DrawerList(
                  iconName: Icons.share,
                  texxt: 'Share',
                ),
                DrawerList(
                  iconName: Icons.feedback,
                  texxt: 'Feedback',
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    _auth.signOut();
                    Navigator.popUntil(context, ModalRoute.withName('/login'));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.loose,
          children: [
            // Container(
            //   child: Align(
            //     alignment: Alignment.topCenter,
            //     child: Container(
            //       padding:
            //           EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           // IconButton(
            //           //   icon: Icon(
            //           //     Icons.dehaze_outlined,
            //           //     color: Colors.black,
            //           //     size: 30.0,
            //           //   ),
            //           //   onPressed: () {
            //           //     // return scaffoldKey.currentState.openDrawer();
            //           //   },
            //           // ),
            //           // Text("Order a Service", style: TextStyle(fontSize: 20.0),),
            //           //
            //           // Icon(
            //           //   Icons.notifications,
            //           //   color: Colors.black,
            //           //   size: 30.0,
            //           // ),
            //         ],
            //       ),
            //     ),
            //   ),
            //   width: double.infinity,
            //   height: height * 0.3,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //   ),
            // ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: GridView.count(
                // crossAxisSpacing: 0,
                // mainAxisSpacing: 2,
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GeneralScreen(
                                  name: "Ac Technician",
                                  iconn: "air-conditioner",
                                  description: "Ac")));
                    },
                    child: ExpandedInsideContainer(
                      name: "Ac Technician",
                      url: "assets/icons/icons8-air-conditioner-256.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GeneralScreen(
                                  name: "Electrician",
                                  iconn: "electrical",
                                  description: "Electricity")));
                    },
                    child: ExpandedInsideContainer(
                      name: "Electrician",
                      url: "assets/icons/icons8-electrical-256.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GeneralScreen(
                                  name: "Plumber",
                                  iconn: "plumbing",
                                  description: "Plumbing")));
                    },
                    child: ExpandedInsideContainer(
                      name: "Plumber",
                      url: "assets/icons/icons8-plumbing-256.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GeneralScreen(
                                  name: "Carpenter",
                                  iconn: "saw-blade",
                                  description: "Carpenting")));
                    },
                    child: ExpandedInsideContainer(
                      name: "Carpenter",
                      url: "assets/icons/icons8-saw-blade-256.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GeneralScreen(
                                  name: "Labour",
                                  iconn: "spade",
                                  description: "Working")));
                    },
                    child: ExpandedInsideContainer(
                      name: "Labour",
                      url: "assets/icons/icons8-spade-256.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GeneralScreen(
                                  name: "Painter",
                                  iconn: "paint-roller",
                                  description: "Painting")));
                    },
                    child: ExpandedInsideContainer(
                      name: "Painter",
                      url: "assets/icons/icons8-paint-roller-256.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GeneralScreen(
                                  name: "Driver",
                                  iconn: "driver",
                                  description: "Driving")));
                    },
                    child: ExpandedInsideContainer(
                      name: "Driver",
                      url: "assets/icons/icons8-driver-256.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GeneralScreen(
                                  name: "Gardener",
                                  iconn: "tree-planting",
                                  description: "Gardening")));
                    },
                    child: ExpandedInsideContainer(
                      name: "Gardener",
                      url: "assets/icons/icons8-tree-planting-256.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GeneralScreen(
                                  name: "Mason",
                                  iconn: "mason",
                                  description: "Masonry")));
                    },
                    child: ExpandedInsideContainer(
                      name: "Mason",
                      url: "assets/icons/icons8-mason-256.png",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerList extends StatelessWidget {
  const DrawerList({
    Key key,
    @required this.iconName,
    @required this.texxt,
    this.stylee,
  }) : super(key: key);

  final IconData iconName;
  final String texxt;
  final TextStyle stylee;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconName,
      ),
      title: Text(
        texxt,
        style: stylee,
      ),
      onTap: () {},
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////

class ExpandedInsideContainer extends StatelessWidget {
  const ExpandedInsideContainer({
    Key key,
    this.width,
    this.height,
    this.url,
    this.name,
  }) : super(key: key);

  final double width;
  final double height;
  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                url,
                width: 60.0,
                height: 60.0,
              ),
              SizedBox(
                height: 17.0,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 20.0, color: Colors.grey.shade800),
              )
            ],
          ),
          // width: width - 0.5,
          // height: height * 0.28,
          // margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            // color: Colors.red,
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////

class WorkSearch extends SearchDelegate<String> {
  final cities = [
    'Plumber',
    'Labor',
    'Driver',
    'Painter',
    'Carpenter',
    'Electrician',
  ];

  final recentCities = [
    'Plumber',
    'Labor',
    'Driver',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
            showSuggestions(context);
          }
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_city, size: 120),
          const SizedBox(height: 48),
          Text(
            query,
            style: TextStyle(
              color: Colors.black,
              fontSize: 64,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? recentCities
        : cities.where((city) {
            final cityLower = city.toLowerCase();
            final queryLower = query.toLowerCase();

            return cityLower.startsWith(queryLower);
          }).toList();

    return buildSuggestionsSuccess(suggestions);
  }

  Widget buildSuggestionsSuccess(List<String> suggestions) => ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          final queryText = suggestion.substring(0, query.length);
          final remainingText = suggestion.substring(query.length);

          return ListTile(
            onTap: () {
              query = suggestion;

              // 1. Show Results
              showResults(context);

              // 2. Close Search & Return Result
              // close(context, suggestion);

              // 3. Navigate to Result Page
              //  Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => ResultPage(suggestion),
              //   ),
              // );
            },
            leading: Icon(Icons.location_city),
            // title: Text(suggestion),
            title: RichText(
              text: TextSpan(
                text: queryText,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: remainingText,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
