import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:university_canteen/AppbarPages/profilePage.dart';
import '../screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import 'activity.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int _currentIndex = 0;
  bool _isHomeActive = false;
  bool _isProfileActive = true;
  bool _isNotificationActive = false;
  bool _isMenuActive = false;

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
          gap: 8,
          backgroundColor: Colors.black,
          color: Color(0xfff9a825),
          activeColor: Color(0xffffffff),
          tabBackgroundColor: Color.fromRGBO(217, 217, 217, 0.4235294117647059),
          padding: EdgeInsets.all(15),
          onTabChange: (index){
            setState(() {
              _currentIndex = index; // Update the current index when a tab is selected.

              // Update the active states for each tab based on the selected index.
              _isHomeActive = index == 1;
              _isProfileActive = index == 0;
              _isNotificationActive = index == 2;
              _isMenuActive = index == 3;
            });
          },
          tabs:[
            GButton(
              icon: Icons.person,
              text: 'Profile',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(), // Replace HomeScreen with your destination screen.
                  ),
                );
              },
              active: _isProfileActive,
            ),
            GButton(
              icon: Icons.home,
              text: 'Home',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(), // Replace HomeScreen with your destination screen.
                  ),
                );
              },
              active: _isHomeActive,
            ),

            GButton(
              icon: Icons.notifications,
              text: 'Notification',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationPage(), // Replace HomeScreen with your destination screen.
                  ),
                );
              },
              active: _isNotificationActive,
            ),

            GButton(
              icon: Icons.menu_outlined,
              text: 'Activity',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActivityPage(), // Replace HomeScreen with your destination screen.
                  ),
                );
              },
              active: _isMenuActive,
            ),
          ]),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/background.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.04,
                    vertical: MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Your Notification",
                            style: TextStyle(
                              fontSize: 30,
                              height: 1,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //_pages[_currentIndex],
            ],
          ),
        ),
      ),
    );
  }
}
