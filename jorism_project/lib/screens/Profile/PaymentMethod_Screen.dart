import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jorism_project/registration/registration_cubit/registration_cubit.dart';
import 'package:jorism_project/registration/registration_cubit/registration_state.dart';
import 'package:jorism_project/shared/components/component.dart';


class PaymentScreen extends StatelessWidget {
  // const PaymentScreen({super.key});
  var emailController = TextEditingController();

  var FnameController = TextEditingController();
  var LnameController = TextEditingController();

  var payController = TextEditingController();
  var CardNoController = TextEditingController();
  var CVVController = TextEditingController();

  var ssnController = TextEditingController();

  // final GlobalKey<FormState> formKey = GlobalKey();
  var formKey = GlobalKey<FormState>();

  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, RegisterationState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = RegistrationCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                ShaderMask(
                  shaderCallback: (bounds) =>
                      LinearGradient(
                        colors: [Colors.brown, Colors.white70],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ).createShader(bounds),
                  blendMode: BlendMode.srcOver,
                  child: Container(
                    decoration: BoxDecoration(
                      color:Color(0xFFEACECE),
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
                    height:700,
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
                                "Payment",
                                style: TextStyle(
                                  color: Color(0xFF4F2E1D),
                                  fontSize: 55,
                                  fontFamily: 'Georgia',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(
                                height: 15.0,
                              ),
                              defaultPaymentFormField(
                                fieldHeight: 50.0,
                                controller: payController,
                                type: TextInputType.text,
                                hintText: 'PaymentMethod',
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Choose your PaymentMethod';
                                  }
                                  return null;
                                },
                                prefix: Icons.payment,
                                prefixIconColor: Color(0xFF4F2E1D),
                                labelText: 'PaymentMethod',
                                labelStyleColor: Color(0xFF4F2E1D),
                                popupMenuItems: [
                                  PopupMenuItem<int>(
                                    value: 1,
                                    child: Text('Visa'),
                                  ),
                                  PopupMenuItem<int>(
                                    value: 2,
                                    child: Text('MasterCard'),
                                  ),
                                  PopupMenuItem<int>(
                                    value: 3,
                                    child: Text('Paypal'),
                                  ),
                                  PopupMenuItem<int>(
                                    value: 4,
                                    child: Text('Cash'),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 15.0,
                              ),

                              defaultPayFormField(
                                fieldHeight: 50.0,
                                controller: CardNoController,
                                type: TextInputType.number,
                                hintText: 'CardNumber',
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your CardNumber';
                                  }
                                  return null;
                                },
                                prefix: Icons.payment,
                                // backgroundHintColor: Colors.white,
                                prefixIconColor: Color(0xFF4F2E1D),
                                // hintStyleColor: Colors.black26,
                                labelText: 'CardNumber',
                                labilStyleColor: Color(0xFF4F2E1D),

                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultPayFormField(
                                fieldHeight: 50.0,
                                controller: CVVController,
                                type: TextInputType.number,
                                hintText: 'CVV',
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your CVV';
                                  }
                                  return null;
                                },
                                prefix: Icons.numbers,
                                // backgroundHintColor: Colors.white,
                                prefixIconColor: Color(0xFF4F2E1D),
                                // hintStyleColor: Colors.black26,
                                labelText: 'CVV',
                                labilStyleColor: Color(0xFF4F2E1D),

                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultnameFormField(
                                fieldHeight: 50.0,
                                fieldWidth: 170,
                                controller: FnameController,
                                type: TextInputType.text,
                                hintText: 'FirstName',
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your First Name';
                                  }
                                  return null;
                                },
                                prefix: Icons.person,
                                // backgroundHintColor: Colors.white,
                                prefixIconColor: Color(0xFF4F2E1D),
                                // hintStyleColor: Colors.black26,
                                labelText: 'FirstName',
                                alignment:Alignment.centerLeft,
                                labilStyleColor: Color(0xFF4F2E1D),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultnameFormField(
                                fieldHeight: 50.0,
                                fieldWidth: 170,
                                controller:LnameController,
                                type: TextInputType.text,
                                hintText: 'LastName',
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Last Name';
                                  }
                                  return null;
                                },
                                prefix: Icons.person,
                                // backgroundHintColor: Colors.white,
                                prefixIconColor: Color(0xFF4F2E1D),
                                // hintStyleColor: Colors.black26,
                                labelText: 'Last Name',
                                alignment: Alignment.centerRight,
                                labilStyleColor: Color(0xFF4F2E1D),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultPayFormField(
                                fieldHeight: 50.0,
                                controller: ssnController,
                                type: TextInputType.number,
                                hintText: 'SocialSecurityNumber',
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your SSN';
                                  }
                                  return null;
                                },
                                prefix: Icons.security,
                                // backgroundHintColor: Colors.white,
                                prefixIconColor: Color(0xFF4F2E1D),
                                // hintStyleColor: Colors.black26,
                                labelText: 'SSN',
                                labilStyleColor: Color(0xFF4F2E1D),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),

                              defaultPayFormField(
                                fieldHeight: 50.0,
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
                                // labilStyleColor: Color(0xFF4F2E1D),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              ConditionalBuilder(
                                condition: state is! SignUpLoadingState,
                                builder: (context) =>
                                    Center(
                                      child: defaultLoginButton(
                                        width: 200,
                                        //backround: Colors.blue,
                                        function: () {
                                          if (formKey.currentState!
                                              .validate()) {

                                          }
                                        },
                                        text: 'Confirm',
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
                                    MaterialButton(
                                      onPressed: (){navigators.navigatePop(context);
                                        },
                                      child: Text(
                                        ("back").toUpperCase(),
                                        style: TextStyle(
                                          color: Colors.brown,
                                          fontSize: 22,
                                          fontFamily: ('Belgiano'),
                                          fontWeight: FontWeight.bold,
                                          // backgroundColor: defaultColor,
                                        ),
                                      ),
                                    ),
                                    // Text(
                                    //   'Back to Login',
                                    //   style: TextStyle(
                                    //     fontSize: 15.0,
                                    //     // fontWeight: FontWeight.bold,
                                    //   ),
                                    // ),
                                    // Icon(Icons.arrow_forward),
                                    SizedBox(
                                      width: 3.0,
                                    ),
                                    // defaultTextButton(
                                    //   function: () {
                                    //     // navigators.navigateTo(context, LoginScreen());
                                    //     cubit.loginBack(context);
                                    //   },
                                    //   text: 'Login',
                                    //   textButtonColor: Color(0xFF4F2E1D),
                                    //   fontSize: 16.0,
                                    // ),
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