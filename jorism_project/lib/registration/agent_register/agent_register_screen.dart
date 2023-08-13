import 'dart:collection';
import 'dart:developer';


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jorism_project/Admin/Admin_Profile_Screen.dart';
import 'package:jorism_project/registration/registration_cubit/registration_cubit.dart';
import 'package:jorism_project/registration/registration_cubit/registration_state.dart';
import 'package:jorism_project/shared/components/component.dart';

// import 'registration_cubit/registration_agent_state.dart';

class AgentSignUpScreen extends StatelessWidget {
  // const RegisterScreen({super.key});

  @override
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var userController = TextEditingController();

  var phoneController = TextEditingController();

  var sscController = TextEditingController();

  // final GlobalKey<FormState> formKey = GlobalKey();
  var formKey = GlobalKey<FormState>();

  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  // bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, RegisterationState>(
      listener: (context, state) {
        if (state is AgentCreateAccountErrorState) {
          // showToast(text: state.error, state: ToastStates.Error);
          log(state.error);
        }
        if (state is AgentCreateAccountSuccessState) {
          showToast(
              text: 'Agent Registered Successfully', state: ToastStates.Success);
          navigators.navigateTo(context, AdminProfileScreen());
        }
      },
      builder: (context, state) {
        var cubit = RegistrationCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [Colors.black, Colors.black38],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ).createShader(bounds),
                  blendMode: BlendMode.srcOver,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/petraRegister.png'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.grey.shade100,
                          BlendMode.darken,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 344,
                    height: 620,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.63),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "SignUp",
                                style: TextStyle(
                                  color: Color(0xFF4F2E1D),
                                  fontSize: 55,
                                  fontFamily: 'Georgia',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // SizedBox(
                              //   height: 7.0,
                              // ),
                              // Text(
                              //   'Welcome to Sport Center',
                              //   style: TextStyle(color: Colors.black54, fontSize: 17.0),
                              // ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultLoginFormField(
                                controller: userController,
                                type: TextInputType.text,
                                hintText: 'Agent Name',
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your company name';
                                  }
                                  return null;
                                },
                                prefix: Icons.person,
                                // backgroundHintColor: Colors.white,
                                prefixIconColor: Color(0xFF4F2E1D),
                                // hintStyleColor: Colors.black26,
                                labelText: 'Agent Name',
                                labilStyleColor: Color(0xFF4F2E1D),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultLoginFormField(
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                hintText: 'Email Address',
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Email Address';
                                  }
                                  return null;
                                },
                                prefix: Icons.email,
                                // backgroundHintColor: Colors.white,
                                prefixIconColor: Color(0xFF4F2E1D),
                                // hintStyleColor: Colors.black26,
                                labelText: 'Email Address',
                                labilStyleColor: Color(0xFF4F2E1D),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultLoginFormField(
                                controller: passwordController,
                                type: TextInputType.visiblePassword,
                                hintText: 'Password',
                                prefix: Icons.lock,
                                suffixIconColor: Color(0xFF4F2E1D),
                                suffix: cubit.suffix,
                                isPassword: cubit.showPassword,
                                suffixPressed: () {
                                  // setState(() {
                                  //   showPassword = !showPassword;
                                  // });
                                  print('${cubit.showPassword}');
                                  cubit.changePasswordVisibialty();
                                },
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                prefixIconColor: Color(0xFF4F2E1D),
                                labelText: 'Password',
                                labilStyleColor: Color(0xFF4F2E1D),
                                onChanged: (value) {
//                                  passwordController = value;
                                },
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultLoginFormField(
                                controller: phoneController,
                                type: TextInputType.phone,
                                hintText: 'Phone',
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your phone number';
                                  }
                                  return null;
                                },
                                prefix: Icons.phone_android_outlined,
                                // backgroundHintColor: Colors.white,
                                prefixIconColor: Color(0xFF4F2E1D),
                                // hintStyleColor: Colors.black26,
                                labelText: 'Phone',
                                labilStyleColor: Color(0xFF4F2E1D),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultLoginFormField(
                                controller: sscController,
                                type: TextInputType.phone,
                                hintText: 'SSC Number',
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your ssc number';
                                  }
                                  return null;
                                },
                                prefix: Icons.phone_android_outlined,
                                // backgroundHintColor: Colors.white,
                                prefixIconColor: Color(0xFF4F2E1D),
                                // hintStyleColor: Colors.black26,
                                labelText: 'SSC Number',
                                labilStyleColor: Color(0xFF4F2E1D),
                              ),
                              SizedBox(
                                height: 26.0,
                              ),
                              ConditionalBuilder(
                                condition: state is! CreateAccountLoadingState,
                                builder: (context) => Center(
                                  child: defaultLoginButton(
                                    width: 200,
                                    //backround: Colors.blue,
                                    function: () {
                                      if (formKey.currentState!.validate()) {
                                        cubit.createAccount(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          name: userController.text,
                                          phone: phoneController.text,
                                          ssc: sscController.text,
                                        );
                                        // Perform login here using emailController.text and passwordController.text
                                        // print('Login Successful!');
                                      } else {
                                        showToast(
                                            text: 'Please enter your info',
                                            state: ToastStates.Warning);
                                      }
                                    },
                                    text: 'SignUp',
                                    radius: 8.0,
                                    backround: Color(0xFF4F2E1D),
                                    textButtonColor: Colors.white,
                                    fontSize: 18.0,
                                  ),
                                ),
                                fallback: (BuildContext context) =>
                                    Center(child: CircularProgressIndicator()),
                              ),
                              SizedBox(
                                height: 12.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Back to Login',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward),
                                    SizedBox(
                                      width: 3.0,
                                    ),
                                    defaultTextButton(
                                      function: () {
                                        // navigators.navigateTo(context, LoginScreen());
                                        cubit.loginBack(context);
                                      },
                                      text: 'Login',
                                      textButtonColor: Color(0xFF4F2E1D),
                                      fontSize: 16.0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
