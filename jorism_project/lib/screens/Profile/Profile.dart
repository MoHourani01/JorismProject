
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jorism_project/popups_widgets/mobile_number_popup.dart';
import 'package:jorism_project/popups_widgets/password_popup.dart';
import 'package:jorism_project/popups_widgets/username_popup.dart';
import 'package:jorism_project/registration/registration_cubit/registration_cubit.dart';
import 'package:jorism_project/registration/registration_cubit/registration_state.dart';
import 'package:jorism_project/screens/Profile/PaymentMethod_Screen.dart';
import 'package:jorism_project/shared/components/component.dart';
import 'package:jorism_project/shared/components/constants.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit,RegisterationState>(
    listener: (context, state){
    },
    builder: (context, state){
      var profileCubit=RegistrationCubit.get(context);
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Color(0xFF4F2E1D),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
            ),
            backgroundColor: Colors.transparent,

            title: Text(
              'Profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: primaryFont,
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body:
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 35,),
                Container(
                  width: 150,
                  height: 150,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage("assets/images/user.png"),
                  ),
                ),
                SizedBox(height: 25,),
                Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 390,
                        height: 400,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          boxShadow: [
                            BoxShadow(blurRadius: 3.0,color: Colors.grey.shade700),
                          ],
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: defaultProfileFormField(
                                    onPressed: ()
                                    { uesrnameDialog(context);
                                    },
                                    title: 'Name: ${profileCubit.userModel?.username??''}',
                                    Ficon: Icons.man,
                                    Licon: Icons.settings,
                                    onTap: (){
                                    }
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: defaultProfileFormField(
                                    onTap: (){
                                    },
                                    onPressed: (){
                                      mobileNumberDialog(context);
                                    },
                                    title: 'Phone: ${profileCubit.userModel?.phone??''}',
                                    Ficon: Icons.numbers,
                                    Licon: Icons.settings),
                              ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // Expanded(
                              //   child: defaultProfileFormField(
                              //     onTap: (){
                              //     },
                              //       onPressed: (){},
                              //       title: 'Email Address',
                              //       Ficon: Icons.email_outlined,
                              //       Licon: Icons.settings),
                              // ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: defaultProfileFormField(
                                    onTap:() {},
                                    onPressed:(){
                                      navigators.navigatorWithBack(context, PaymentScreen());
                                    },
                                    title: 'Payment',
                                    Ficon: Icons.payment,
                                    Licon: Icons.add_card_outlined),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: defaultProfileFormField(
                                    onPressed: () {

                                    },
                                    title: 'Contact Us',
                                    Ficon: Icons.phone,
                                    Licon: Icons.navigate_next),
                              ),
                              Spacer(),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color:  Colors.white,
                                            borderRadius: BorderRadius.circular(30.0),
                                            boxShadow: [
                                              BoxShadow(blurRadius: 0.5,color: Colors.grey.shade700),
                                            ],
                                          ),
                                          child:
                                          TextButton(onPressed: () {  },
                                            child: Text('Log Out',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red
                                              ),),
                                          )
                                      ),
                                    ),
                                    SizedBox(width: 20,),
                                    Expanded(
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color:  Colors.white,
                                            borderRadius: BorderRadius.circular(30.0),
                                            boxShadow: [
                                              BoxShadow(blurRadius: 0.5,color: Colors.grey.shade700),
                                            ],
                                          ),
                                          child:
                                          TextButton(onPressed: () {
                                            passwordDialog(context);
                                          },
                                            child: Text('Change Password' ,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red
                                              ),),
                                          )
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}