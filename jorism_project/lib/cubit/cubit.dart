
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jorism_project/cubit/state.dart';
import 'package:jorism_project/screens/Agencies/Agencies_Screen.dart';
import 'package:jorism_project/screens/Profile/Profile.dart';
import 'package:jorism_project/screens/home/home_screen.dart';
import 'package:jorism_project/screens/news/news_screen.dart';
import 'package:jorism_project/screens/places/places_screen.dart';
import 'package:path/path.dart' as path;

class JorismCubit extends Cubit<JorismState>{
  JorismCubit(): super(InitialJorismState());

  static JorismCubit get(BuildContext context){
    return BlocProvider.of(context);
  }

  int currentIndex=0;
  List<Widget> screens=[
    HomeScreen(),
    NewsScreen(),
    AgenciesScreen(),
    PlacesScreen(),
    ProfileScreen(),
  ];

  void changeIndex(int index){
    currentIndex=index;
    emit(JorismChangeBottomNavBarState());
  }

  int activatedIndex = 0;
  int activatedAgencyIndex = 0;

  Future<void> datePicker(BuildContext context)async{
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
  }
}