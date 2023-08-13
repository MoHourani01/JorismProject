
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:jorism_project/shared/components/component.dart';


TextEditingController phoneController = TextEditingController();
TextEditingController newPhoneController = TextEditingController();
TextEditingController emailController = TextEditingController();


void mobileNumberDialog(BuildContext context) {
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
        child: defaultButton(
          function: () {
            phoneController.clear();
            newPhoneController.clear();
            emailController.clear();
            navigators.navigatePop(context);
          },
          text: 'Submit',
          fontSize: 18,
          backround: Colors.grey.shade700,
          textButtonColor: Colors.black,
        ),
      ),
    ),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          height: 250,
          width: double.infinity,
          // color: Colors.blue,
          child: Column(
            children: [
              defaultLoginFormField(
                controller: phoneController,
                type: TextInputType.number,
                labelText: 'Old Phone Number',
                prefix: Icons.phone_android,
              ),
              SizedBox(
                height: 15,
              ),
              defaultLoginFormField(
                controller: newPhoneController,
                type: TextInputType.number,
                labelText: 'New Phone Number',
                prefix: Icons.phone_android,
              ),
              SizedBox(
                height: 15,
              ),
              defaultLoginFormField(
                controller: emailController,
                type: TextInputType.emailAddress,
                labelText: 'Email Address',
                prefix: Icons.email,
                onChanged: (value){
                  emailController=value;
                },
              ),
            ],
          ),
        ),
      ),
    ),
  ).show();
}
