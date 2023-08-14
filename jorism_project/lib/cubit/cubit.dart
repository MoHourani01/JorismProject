import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jorism_project/cubit/state.dart';
import 'package:jorism_project/models/products_model.dart';
import 'package:jorism_project/screens/Agencies/Agencies_Screen.dart';
import 'package:jorism_project/screens/Profile/Profile.dart';
import 'package:jorism_project/screens/home/home_screen.dart';
import 'package:jorism_project/screens/news/news_screen.dart';
import 'package:jorism_project/screens/places/places_screen.dart';
import 'package:path/path.dart' as path;

class JorismCubit extends Cubit<JorismState> {
  JorismCubit() : super(InitialJorismState());

  static JorismCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    NewsScreen(),
    AgenciesScreen(),
    PlacesScreen(),
    ProfileScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(JorismChangeBottomNavBarState());
  }

  // int activatedIndex = 0;
  // int activatedAgencyIndex = 0;

  DateTime dateTime=DateTime.now();
  DateTime selectedDate = DateTime.now();
  String formattedSelectedDate = '';
  Future<void> datePicker(BuildContext context) async {
    final pickDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),

    ).then((value) {
      selectedDate=value!;
      print(selectedDate);
    });
  }


  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  ProductsModel? productsModel;

  // Future<void> addProducts(ProductsModel product, String userId) async {
  //   emit(AddProductLoadingState());
  //   await FirebaseFirestore.instance
  //       .collection('products')
  //       .doc(product.productId)
  //       .collection('userProducts')
  //       .doc(userId)
  //       .set(product.toProductsJson()).then((value) {
  //         emit(AddProductSuccessState());
  //   })
  //       .catchError((error) {
  //         emit(AddProductErrorState(error.toString()));
  //   });
  //   // firestore
  //   //     .collection('products')
  //   //     .add(product.toProductsJson())
  //   //     .then((value) {
  //   //       emit(AddProductSuccessState() as JorismState);
  //   // })
  //   //     .catchError((error) {
  //   //       emit(AddProductErrorState(error.toString()) as JorismState);
  //   // });
  // }

  Future<void> addProduct(ProductsModel product) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('products').doc(product.productId).set(product.toProductsJson())
        .whenComplete(() {
          emit(AddProductSuccessState());
      print('Product added successfully');
    }).catchError((error) {
      emit(AddProductErrorState(error.toString()));
      // print('Error adding product: $error');
    });
  }
}
