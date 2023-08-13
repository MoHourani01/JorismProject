import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jorism_project/Admin/Admin_AgentScreen.dart';
import 'package:jorism_project/Admin/addProduct.dart';
import 'package:jorism_project/popups_widgets/mobile_number_popup.dart';
import 'package:jorism_project/popups_widgets/password_popup.dart';
import 'package:jorism_project/popups_widgets/username_popup.dart';
import 'package:jorism_project/registration/registration_cubit/registration_cubit.dart';
import 'package:jorism_project/registration/registration_cubit/registration_state.dart';
import 'package:jorism_project/shared/components/component.dart';
import 'package:jorism_project/shared/components/constants.dart';


class AdminProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit,RegisterationState>(
      listener:(context,state){},
      builder:(context, state){
        var agentCubit=RegistrationCubit.get(context);
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
                'Agent Profile',
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 390,
                            height: 550,
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
                                        title: '${agentCubit.userModel!.username}',
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
                                        title: '${agentCubit.userModel!.phone}',
                                        Ficon: Icons.numbers,
                                        Licon: Icons.settings),
                                  ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  // Expanded(
                                  //   child: defaultProfileFormField(
                                  //       onTap: (){
                                  //       },
                                  //       onPressed: (){},
                                  //       title: 'Email',
                                  //       Ficon: Icons.email_outlined,
                                  //       Licon: Icons.settings),
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: defaultProfileFormField(
                                        onTap: (){
                                        },
                                        onPressed: (){},
                                        title: 'Address',
                                        Ficon: Icons.pin_drop,
                                        Licon: Icons.settings),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: defaultProfileFormField(
                                        onTap: (){
                                        },
                                        onPressed: (){},
                                        title: '${agentCubit.userModel!.ssc}',
                                        Ficon: Icons.numbers,
                                        Licon: Icons.settings),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: defaultProfileFormField(
                                        onPressed: () {

                                        },
                                        title: 'Reports',
                                        Ficon: Icons.report,
                                        Licon: Icons.arrow_forward_ios_outlined),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: defaultProfileFormField(
                                        onPressed: () {
                                          navigators.navigatorWithBack(context, AddProductsScreen());
                                        },
                                        title: 'Add Product',
                                        Ficon: Icons.shopping_cart,
                                        Licon: Icons.add_circle_sharp),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: defaultProfileFormField(
                                        onPressed: () {
                                          navigators.navigatorWithBack(context, AdminAgentDetailsScreen());
                                        },
                                        title: 'Agent Details Screen',
                                        Ficon: Icons.admin_panel_settings,
                                        Licon: Icons.arrow_forward_ios_outlined),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    child: Center(
                                      child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFFF5555),
                                                Color(0xFFDB0202),
                                                Color(0xFF880000),
                                              ],
                                              begin: AlignmentDirectional.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                            // color:  Colors.white,
                                            borderRadius: BorderRadius.circular(30.0),
                                            boxShadow: [
                                              BoxShadow(blurRadius: 0.5,color: Colors.grey.shade700),
                                            ],
                                          ),
                                          child:
                                          TextButton(onPressed: () {  },
                                            child: Text('Delete Account',
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),),
                                          )
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}