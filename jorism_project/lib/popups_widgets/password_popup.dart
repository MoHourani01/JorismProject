
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:jorism_project/shared/components/component.dart';


TextEditingController passwordController = TextEditingController();
TextEditingController newPasswordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
TextEditingController emailController = TextEditingController();

void passwordDialog(BuildContext context) {
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
            passwordController.clear();
            newPasswordController.clear();
            confirmPasswordController.clear();
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
          height: 350,
          width: double.infinity,
          // color: Colors.blue,
          child: Column(
            children: [
              defaultLoginFormField(
                controller: passwordController,
                type: TextInputType.visiblePassword,
                labelText: 'Old Password',
                prefix: Icons.lock,
                isPassword: true,
                suffix: Icons.remove_red_eye,
              ),
              SizedBox(
                height: 15,
              ),
              defaultLoginFormField(
                controller: newPasswordController,
                type: TextInputType.visiblePassword,
                labelText: 'New Password',
                prefix: Icons.lock,
                isPassword: true,
                suffix: Icons.remove_red_eye,
              ),
              SizedBox(
                height: 15,
              ),
              defaultLoginFormField(
                controller: confirmPasswordController,
                type: TextInputType.visiblePassword,
                labelText: 'Confirm Password',
                prefix: Icons.lock,
                isPassword: true,
                suffix: Icons.remove_red_eye,
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
