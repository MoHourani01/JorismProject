import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jorism_project/Admin/Admin_Profile_Screen.dart';
import 'package:jorism_project/cubit/cubit.dart';
import 'package:jorism_project/cubit/state.dart';
import 'package:jorism_project/models/products_model.dart';
import 'package:jorism_project/registration/registration_cubit/registration_cubit.dart';
import 'package:jorism_project/screens/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:jorism_project/shared/components/component.dart';
import 'package:jorism_project/shared/components/constants.dart';
import 'package:uuid/uuid.dart';

class AddProductsScreen extends StatelessWidget {
  TextEditingController productName = TextEditingController();

  TextEditingController productPrice = TextEditingController();

  TextEditingController productDescription = TextEditingController();

  TextEditingController productDate = TextEditingController();

  TextEditingController productTime = TextEditingController();

  TextEditingController productLocation = TextEditingController();

  bool selectImageColor = false;

  String selectedImageUrl = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JorismCubit, JorismState>(
      listener: (context, state) {
        if (state is ImageSuccessState){
          selectImageColor=true;
        }
      },
      builder: (context, state) {
        void pickDate(BuildContext context) {
          JorismCubit.get(context).datePicker(context);
        }

        var addProductCubit = JorismCubit.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Add Products',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: primaryFont,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF4F2E1D),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
              ),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      defaultLoginFormField(
                        controller: productName,
                        type: TextInputType.text,
                        labelText: 'Product Name',
                        labilStyleColor: Color(0xFF4F2E1D),
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter email address!';
                          }
                          return null;
                        },
                        prefix: Icons.inbox,
                      ),
                      SizedBox(height: 10),
                      defaultLoginFormField(
                        controller: productPrice,
                        type: TextInputType.text,
                        labelText: 'Product Price',
                        labilStyleColor: Color(0xFF4F2E1D),
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter email address!';
                          }
                          return null;
                        },
                        prefix: Icons.price_change,
                      ),
                      SizedBox(height: 10),
                      defaultLoginFormField(
                        controller: productDescription,
                        type: TextInputType.text,
                        labelText: 'Product Description',
                        labilStyleColor: Color(0xFF4F2E1D),
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter email address!';
                          }
                          return null;
                        },
                        prefix: Icons.description,
                      ),
                      SizedBox(height: 10),
                      defaultDateFormField(
                        controller: productDate,
                        type: TextInputType.datetime,
                        hintText: '${addProductCubit.selectedDate.toString()}',
                        labilStyleColor: Color(0xFF4F2E1D),
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter Date!';
                          }
                          return null;
                        },
                        prefix: Icons.calendar_month,
                        onTap: () async {
                          // datePicker();
                          // addProductCubit.datePicker(context);
                          pickDate(context);
                        },
                      ),
                      SizedBox(height: 10),
                      defaultLoginFormField(
                        controller: productTime,
                        type: TextInputType.datetime,
                        labelText: 'Product Time',
                        labilStyleColor: Color(0xFF4F2E1D),
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter Time!';
                          }
                          return null;
                        },
                        prefix: Icons.access_time_outlined,
                      ),
                      SizedBox(height: 10),
                      defaultLoginFormField(
                        controller: productLocation,
                        type: TextInputType.text,
                        labelText: 'Product Location',
                        labilStyleColor: Color(0xFF4F2E1D),
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter Location!';
                          }
                          return null;
                        },
                        prefix: Icons.location_on,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              // await chooseSubjectImage(ImageSource.camera);
                              // if (imageFile != null) {
                              // ...
                              // }}
                            },
                            icon: Icon(
                              Icons.camera_alt_rounded,
                              color: Color(0xFF4F2E1D),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              await addProductCubit.chooseSubjectImage(
                                  ImageSource.gallery);
                              if (addProductCubit.imageFile != null) {
                                selectedImageUrl = await addProductCubit
                                    .fileUpload(addProductCubit.imageFile!,
                                    'UsersImage')
                                    .whenComplete(() {
                                  selectImageColor = !selectImageColor;
                                });
                                print('Image Selected');
                              }
                            },
                            child: Text(
                              "Select Image",
                              style: TextStyle(
                                color: Colors.blueGrey.shade700.withOpacity(
                                    1),
                              ),
                            ),
                          ),
                          SizedBox(width: 190),
                          Icon(
                            selectImageColor == true
                                ? Icons.check_circle
                                : Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ConditionalBuilder(
                        condition: state is! AddProductLoadingState,
                        builder: (context) =>
                            defaultLoginButton(
                              radius: 8.0,
                              fontSize: 18,
                              backround: Color(0xFF4F2E1D),
                              function: () async {
                                var id = Uuid().v4();
                                var user = RegistrationCubit
                                    .get(context)
                                    .userModel!
                                    .username;
                                var model = ProductsModel(
                                    productId: id,
                                    productName: productName.text,
                                    productPrice: int.parse(productPrice.text),
                                    productDescription: productDescription.text,
                                    productDate: addProductCubit.selectedDate
                                        .toString(),
                                    productTime: productTime.text,
                                    productAddress: productLocation.text,
                                    productImage: selectedImageUrl,
                                    quantity: 0);
                                if (productDescription.text.isEmpty) {
                                  showToast(
                                      text: 'Fill the description',
                                      state: ToastStates.Warning);
                                } else if (productName.text.isEmpty) {
                                  showToast(
                                      text: 'Fill the Name',
                                      state: ToastStates.Warning);
                                } else if (productLocation.text.isEmpty) {
                                  showToast(
                                      text: 'Fill the Address',
                                      state: ToastStates.Warning);
                                } else {
                                  await addProductCubit
                                      .addProduct(model, user as String)
                                      .whenComplete(() {
                                    navigators.navigatePop(context);
                                  });
                                  showToast(
                                      text: 'Product Added Successfully',
                                      state: ToastStates.Success);
                                }
                              },
                              text: "Add product",
                            ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
