import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jorism_project/shared/components/component.dart';

TextEditingController newUserController = TextEditingController();

void uesrnameDialog(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    width: 400,
    dialogBackgroundColor: Colors.grey.shade200,
    dialogBorderRadius: BorderRadius.circular(40),
    btnOk: Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(blurRadius: 3.0, color: Colors.black),
          ],
        ),
        child: TextButton(
          child: Text(
            'Submit',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          onPressed: () async {
            final User? user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              String newUsername = newUserController.text;

              // Update the username in Firebase Firestore
              CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
              await usersCollection.doc(user.uid).update({
                'username': newUsername,
              });

              newUserController.clear();
              Navigator.of(context).pop(); // Close the dialog
            }
          },
        ),
      ),
    ),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          height: 100,
          width: double.infinity,
          child: Column(
            children: [
              defaultLoginFormField(
                controller: newUserController,
                type: TextInputType.text,
                labelText: 'New Username',
                prefix: Icons.person,
              ),
            ],
          ),
        ),
      ),
    ),
  ).show();
}
