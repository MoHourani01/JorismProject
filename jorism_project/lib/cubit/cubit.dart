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

  // int currentIndex = 0;
  // List<Widget> screens = [
  //   HomeScreen(),
  //   NewsScreen(),
  //   AgenciesScreen(),
  //   PlacesScreen(),
  //   ProfileScreen(),
  // ];
  //
  // void changeIndex(int index) {
  //   currentIndex = index;
  //   emit(JorismChangeBottomNavBarState());
  // }

  DateTime selectedDate = DateTime.now();
  String formattedSelectedDate = '';

  Future<void> datePicker(BuildContext context) async {
    emit(DateTimeLoadingState());
    final pickDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((value) {
      emit(DateTimeSuccessState());
      selectedDate = value!;
      print(selectedDate);
    }).catchError((error){
      emit(DateTimeErrorState());
      print('date time error=> ${error}');
    });
  }

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  ProductsModel? productsModel;


  Future<void> addProduct(ProductsModel product, String userId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection('products')
        .doc(product.productId)
        .set(product.toProductsJson())
        .whenComplete(() async {
      await firestore
          .collection('products')
          .doc(product.productId)
          .collection('userProducts')
          .doc(userId)
          .set(product.toProductsJson())
          .then((value) {
            emit(AddUserProductSuccessState());
            print('User Product Added Successfully');
      })
          .catchError((error) {
            emit(AddUserProductErrorState(error.toString()));
      });
      emit(AddProductSuccessState());
      print('Product added successfully');
    }).catchError((error) {
      emit(AddProductErrorState(error.toString()));
      print('Error adding product: $error');
    });
  }

  File? imageFile;
  bool selectImageColor = false;
  ImagePicker picker = ImagePicker();
  late Reference firebaseStorageRef;

  Future<String> fileUpload(File file, String valueName) async {
    String result = '';
    firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('$valueName/${path.basename(file.path)}');
    await firebaseStorageRef.putFile(file).whenComplete(() async {
      await firebaseStorageRef.getDownloadURL().then((value) {
        result = value;
      });
    });
    return result;
  }

  chooseSubjectImage(ImageSource source) async {
    emit(ImageLoadingState());
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile!.path.isEmpty) {
      retrieveLostData();
      emit(UploadImageErrorState());
    } else {
      imageFile = File(pickedFile.path);
      print('Image Path=> ${imageFile}');
      emit(ImageSuccessState());
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.file != null) {
      imageFile = File(response.file!.path);
      print('image path ==> ${imageFile}');
      emit(UploadImageSuccessState());
    } else {
      emit(UploadImageErrorState());
    }
  }
}
