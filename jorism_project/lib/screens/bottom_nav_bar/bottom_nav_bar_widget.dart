
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jorism_project/cubit/cubit.dart';
import 'package:jorism_project/cubit/state.dart';
import 'package:jorism_project/screens/Agencies/Agencies_Screen.dart';
import 'package:jorism_project/screens/Profile/Profile.dart';
import 'package:jorism_project/screens/home/home_screen.dart';
import 'package:jorism_project/screens/news/news_screen.dart';
import 'package:jorism_project/screens/places/places_screen.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int page = 0;

  List<Widget> screens = [
    HomeScreen(),
    NewsScreen(),
    AgenciesScreen(),
    PlacesScreen(),
    ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:screens[page],
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.easeOut,
        index: 0,
        backgroundColor: Colors.white,
        color: Color(0xFF4F2E1D),
        height: 60,
        // currentIndex: page,
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.newspaper,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.account_balance,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.place,
            color: Colors.white,size: 30,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
            size: 30,
          ),
        ],
        onTap: (index){
          setState(() {
            page=index;
          });
        },
      ),
    );
  }
}


