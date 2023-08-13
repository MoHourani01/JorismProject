import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jorism_project/shared/components/component.dart';
import 'package:jorism_project/shared/components/constants.dart';


class AddProductsScreen extends StatefulWidget {
  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  TextEditingController productDate = TextEditingController();
  TextEditingController productTime = TextEditingController();
  TextEditingController productLocation = TextEditingController();
  Future<void> datePicker()async{
   await showDatePicker(
     context: context,
     initialDate: DateTime.now(),
     firstDate: DateTime.now(),
     lastDate: DateTime(2030),
   );
  }


  File? imageFile;
  ImagePicker picker = ImagePicker();
  bool selectImageColor = false;
  String selectedImageUrl = '';
  bool selectFileColor = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Add Products',
          style: TextStyle(
            color: Colors.white,
            fontFamily: primaryFont,
            fontSize:20,
            fontWeight: FontWeight.bold,
          ),),
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
                    hintText: 'Product Date',
                    labilStyleColor: Color(0xFF4F2E1D),
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'please enter Date!';
                      }
                      return null;
                    },
                    prefix: Icons.calendar_month,
                    onTap: (){
                      datePicker();
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
                          await chooseSubjectImage(ImageSource.camera);
                          if (imageFile != null) {
                            // ...
                          }
                        },
                        icon: Icon(
                          Icons.camera_alt_rounded,
                          color: Color(0xFF4F2E1D),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          await chooseSubjectImage(ImageSource.gallery);
                          if (imageFile != null) {
                            // ...
                          }
                        },
                        child: Text(
                          "Select Image",
                          style: TextStyle(
                            color: Colors.blueGrey.shade700.withOpacity(1),
                          ),
                        ),
                      ),
                      SizedBox(width: 190),
                      Icon(
                        selectImageColor == false
                            ? Icons.check_circle_outline
                            : Icons.check_circle,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  defaultLoginButton(
                    radius: 8.0,
                    fontSize: 18,
                    backround: Color(0xFF4F2E1D),
                    function: () async {
                    },
                    text: "Add product",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  chooseSubjectImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }


  Future<void> retrieveImageData(XFile imageFile) async {
    if (imageFile.path.isEmpty) {
      // Handle case where imageFile.path is empty
    } else {
      setState(() {
        imageFile = File(imageFile.path) as XFile;
      });
    }
  }
}
