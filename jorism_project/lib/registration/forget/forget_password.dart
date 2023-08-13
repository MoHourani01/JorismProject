
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jorism_project/registration/registration_cubit/registration_cubit.dart';
import 'package:jorism_project/registration/registration_cubit/registration_state.dart';
import 'package:jorism_project/shared/components/component.dart';



class ForgetPasswordScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  // TextEditingController passwordController = TextEditingController();
  // TextEditingController forgetPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit,RegisterationState>(
      listener: (context, state){
        // if (state is resetSuccessState){
        //   showToast(text: 'Reset Successfully', state: ToastStates.Success);
        //   navigators.navigateTo(context, LoginScreen());}

        if(state is ForgetPasswordSuccessState){
          showToast(text: 'Email Sent', state: ToastStates.Success);
          navigators.navigatePop(context);
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
                    height: 350,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.63),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(top:100.0,left: 10.0,right: 10.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              SizedBox(
                                height: 8,
                              ),
                              // SizedBox(height: 15),
                              ConditionalBuilder(
                                condition: state is! ForgetPasswordLoadingState,
                                builder:(context)=> Center(
                                  child: Container(
                                    width: 200,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF4F2E1D),
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          cubit.forgetPassword(emailController.text.toLowerCase());
                                        } else {
                                          showToast(text: 'Please enter your info', state: ToastStates.Warning);
                                        }
                                      },
                                      child: Text(
                                        'Reset Password',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ), fallback: (BuildContext context) => Center(child: CircularProgressIndicator()),
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
