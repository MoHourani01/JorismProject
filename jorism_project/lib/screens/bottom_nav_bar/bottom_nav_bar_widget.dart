
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jorism_project/cubit/cubit.dart';
import 'package:jorism_project/cubit/state.dart';


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JorismCubit,JorismState>(
        listener: (context, state){},
        builder: (context, state){
          var cubit=JorismCubit.get(context);
          return Scaffold(
            body:cubit.screens[cubit.currentIndex],
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
                cubit.changeIndex(index);
              },
            ),
          );
        },
    );
  }
}
