// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hourani_efe_project/registration/register/register_screen.dart';
// import 'package:hourani_efe_project/registration/registration_cubit/registration_agent_cubit.dart';
// import 'package:hourani_efe_project/registration/registration_cubit/registration_agent_state.dart';
// import 'package:hourani_efe_project/shared/component.dart';
//
// class LoginScreen extends StatefulWidget {
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   // const LoginScreen({super.key});
//   var emailController = TextEditingController();
//
//   var passwordController = TextEditingController();
//
//   var formKey = GlobalKey<FormState>();
//
//   // final GlobalKey<State> _keyLoader = GlobalKey<State>();
//   bool showPassword = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             ShaderMask(
//               shaderCallback: (bounds) => LinearGradient(
//                 colors: [Colors.black, Colors.black38],
//                 begin: Alignment.bottomCenter,
//                 end: Alignment.topCenter,
//               ).createShader(bounds),
//               blendMode: BlendMode.srcOver,
//               child: Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('assets/images/petraLogin2.png'),
//                     fit: BoxFit.cover,
//                     colorFilter: ColorFilter.mode(
//                       Colors.grey.shade100,
//                       BlendMode.darken,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Center(
//               child: Container(
//                 width: 344,
//                 height: 485,
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.63),
//                   borderRadius: BorderRadius.circular(35.0),
//                 ),
//                 child: Form(
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 20),
//                           child: Text(
//                             "Login",
//                             style: TextStyle(
//                               color: Color(0xFF4F2E1D),
//                               fontSize: 55,
//                               fontFamily: 'Georgia',
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         defaultLoginFormField(
//                           controller: emailController,
//                           type: TextInputType.emailAddress,
//                           validate: (value) {
//                             if (value!.isEmpty) {
//                               return 'please enter email address!';
//                             }
//                             return null;
//                           },
//                           prefix: Icons.email_outlined,
//                           backgroundHintColor: Colors.white,
//                           prefixIconColor: Color(0xFF6B260B),
//                           onChanged: (value){
//                             print(value);
//                           },
//                           onSubmit: (value){
//                             print(value);
//                           },
//                           labelText: 'Email Address',
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         defaultLoginFormField(
//                           controller: passwordController,
//                           type: TextInputType.visiblePassword,
//                           hintText: 'Password',
//                           prefix: Icons.lock_outline,
//                           suffixIconColor: Color(0xFF6B260B),
//                           suffix: showPassword
//                               ? Icons.visibility_outlined
//                               : Icons.visibility_off_outlined,
//                           isPassword: showPassword,
//                           suffixPressed: () {
//                             // setState(() {
//                             //   showPassword = !showPassword;
//                             // });
//                           },
//                           validate: (value) {
//                             if (value!.isEmpty) {
//                               return 'please enter Password!';
//                             }
//                             return null;
//                           },
//                           onChanged: (value) {
//                             print(value);
//                           },
//                           prefixIconColor: Color(0xFF6B260B),
//                           labelText: 'Password',
//                         ),
//                         defaultTextButton(
//                             function: () {}, text: 'Forgot Password?'),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Center(
//                           child: defaultLoginButton(
//                             width: 200,
//                             //backround: Colors.blue,
//                             function: () {
//                               if (formKey.currentState != null && formKey.currentState!.validate()) {
//                                 print(emailController.text);
//                                 print(passwordController.text);
//                               }
//                             },
//                             text: 'LOGIN',
//                             radius: 9.0,
//                             backround: Color(0xFF4F2E1D),
//                             textButtonColor: Colors.white,
//                             fontSize: 20.0,
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Don\'t have an account?',
//                               style: TextStyle(
//                                 fontSize: 15.0,
//                                 // fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 4.0,
//                             ),
//                             defaultTextButton(
//                               function: () {
//                                 navigators.navigateTo(
//                                     context, RegisterScreen());
//                               },
//                               text: 'sign-up',
//                               textButtonColor: Color(0xFF4F2E1D),
//                               fontSize: 16.0,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//     // return BlocProvider(
//     //   create: (BuildContext context) => RegistrationCubit(),
//     //   child: BlocConsumer<RegistrationCubit, RegisterationState>(
//     //     listener: (context, state) {},
//     //     builder: (context, state) {
//     //
//     //     },
//     //   ),
//     // );
//   }
// }

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jorism_project/Admin/Admin_Profile_Screen.dart';
import 'package:jorism_project/registration/registration_cubit/registration_cubit.dart';
import 'package:jorism_project/registration/registration_cubit/registration_state.dart';
import 'package:jorism_project/screens/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:jorism_project/shared/components/component.dart';


class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController forgetPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit,RegisterationState>(
      listener: (context, state){
        // if(state is RegistrationInitialState) print('RegistrationInitialState');
        // if(state is ChangePasswordVisibiltyState) print('ChangePasswordVisibiltyState');

        // if(state is RegistrationInitialState) print('RegistrationInitialState');
        // if(state is ChangePasswordVisibiltyState) print('ChangePasswordVisibiltyState');
        if(state is LoginErrorState){
          print(state.error.toString());
          showToast(text: 'Wrong Email or Password', state: ToastStates.Error);
        }
        if(state is AgentLoginErrorState){
          print(state.error.toString());
          print('state.error.toString()');
          showToast(text: 'Wrong Email or Password', state: ToastStates.Error);
        }
        if (state is LoginSuccessState){
          showToast(text: 'Login Successfully', state: ToastStates.Success);
          navigators.navigatePushReplacement(context, BottomNavBar());}
        if(state is AgentLoginSuccessState){
          showToast(text: 'Agent Login Successfully', state: ToastStates.Success);
          navigators.navigatePushReplacement(context, AdminProfileScreen());
        }

      },
      builder: (context, state){
        var cubit=RegistrationCubit.get(context);
        // var agentCubit=RegistrationAgentCubit.get(context);
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
                        image: AssetImage('assets/images/petraLogin2.png'),
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
                    height: 485,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.63),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Color(0xFF4F2E1D),
                                    fontSize: 55,
                                    fontFamily: 'Georgia',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  labelText: 'Email Address',
                                  labelStyle: TextStyle(color: Color(0xFF4F2E1D)),
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Color(0xFF4F2E1D),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: BorderSide(
                                        color: Color(0xFF4F2E1D),
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: BorderSide(
                                        color: Color(0xFF4F2E1D),
                                      )),
                                  // border: InputBorder.none
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email address';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),
                              TextFormField(
                                controller: passwordController,
                                obscureText: cubit.showPassword,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Color(0xFF4F2E1D)),
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: Color(0xFF4F2E1D),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      cubit.suffix,
                                      color: Color(0xFF4F2E1D),
                                    ),
                                    onPressed: () {
                                      print('${cubit.showPassword}');
                                      cubit.changePasswordVisibialty();
                                    },
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: BorderSide(
                                        color: Color(0xFF4F2E1D),
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: BorderSide(
                                        color: Color(0xFF4F2E1D),
                                      )),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                              defaultTextButton(
                                  function: () {
                                    cubit.ForgetPassScreen(context);
                                  },
                                  text: 'Forgot Password?'),
                              SizedBox(
                                height: 8,
                              ),
                              // SizedBox(height: 15),
                              ConditionalBuilder(
                                condition: state is! LoginLoadingState,
                                builder:(context)=> Center(
                                  child: Container(
                                    width: 200,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF4F2E1D),
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () async{
                                        if (formKey.currentState!.validate()) {
                                          await cubit.loginToHome(email: emailController.text.toLowerCase(),
                                              password: passwordController.text);
                                          // navigators.navigatePushReplacement(context, BottomNavBar());
                                          // cubit.agentLoginToHome(email: emailController.text, password: passwordController.text);// if (state is LoginSuccessState){

                                          //   cubit.loginToHome(email: emailController.text,
                                          //       password: passwordController.text);
                                          //   showToast(text: 'Login Successfully', state: ToastStates.Success);
                                          //   navigators.navigateTo(context, BottomNavBar());
                                          // }
                                          // else if(state is AgentLoginSuccessState){
                                          //   cubit.agentLoginToHome(email: emailController.text, password: passwordController.text);
                                          //   showToast(text: 'Agent Login Successfully', state: ToastStates.Success);
                                          //   navigators.navigateTo(context, AdminProfileScreen());
                                          // }


                                          // cubit.loginToHome(emailController.text, passwordController.text);
                                          // cubit.stream.listen((state) {
                                          // if (state is LoginSuccessState) {
                                          //   navigators.navigateTo(context, BottomNavBar());
                                          //   showToast(text: 'Success', state: ToastStates.Success);
                                          // } else if (state is LoginErrorState) {
                                          //     showToast(text: 'Wrong Email or Password', state: ToastStates.Error);
                                          //   }
                                          // });
                                        } else {
                                          showToast(text: 'Please enter your info', state: ToastStates.Warning);
                                        }

                                      },
                                      child: Text(
                                        'LOGIN',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ), fallback: (BuildContext context) => Center(child: CircularProgressIndicator()),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don\'t have an account?',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                  defaultTextButton(
                                    function: () {
                                      // navigators.navigateTo(
                                      //     context, RegisterScreen());
                                      cubit.signUpScreen(context);
                                    },
                                    text: 'sign-up',
                                    textButtonColor: Color(0xFF4F2E1D),
                                    fontSize: 16.0,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Are you an agent?',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                  defaultTextButton(
                                    function: () {
                                      // navigators.navigateTo(context, AgentSignUpScreen());
                                      cubit.agentSignUpScreen(context);
                                    },
                                    text: 'sign-up as agent',
                                    textButtonColor: Color(0xFF4F2E1D),
                                    fontSize: 16.0,
                                  ),
                                ],
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
