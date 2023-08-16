import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jorism_project/cubit/cubit.dart';
import 'package:jorism_project/cubit/state.dart';
import 'package:jorism_project/models/user_model.dart';
import 'package:jorism_project/registration/registration_cubit/registration_cubit.dart';
import 'package:jorism_project/screens/agent_details/agent_details_screen.dart';
import 'package:jorism_project/shared/components/component.dart';
import 'package:jorism_project/shared/components/constants.dart';

class AgenciesScreen extends StatelessWidget {
  // const PlacesScreen({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JorismCubit, JorismState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var agentRegisterCubit=RegistrationCubit.get(context);
          var jorismCubit = JorismCubit.get(context);
          // List<UserModel> agentUsers = jorismCubit.getAgentUsers();
          if(state is GetAgentUsersSuccessState){
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                ),
                backgroundColor: Colors.transparent,
                title: Text(
                  'Agencies',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: primaryFont,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 22, right: 22, top: 12),
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          // filterSearchResults(value);
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: primaryColor,
                          ),
                          hintText: "Search for Agencies",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            borderSide: BorderSide(
                              color: Colors.black87,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide: BorderSide(
                                color: Colors.black87,
                              )),
                        ),
                      ),
                    ),
                    MasonryGridView.count(
                        physics: BouncingScrollPhysics(),
                        crossAxisCount: 1,
                        crossAxisSpacing: 1,
                        // mainAxisSpacing: 0,
                        // primary: false,
                        shrinkWrap: true,
                        itemCount: jorismCubit.agentUsers.length,
                        itemBuilder: (BuildContext context, int index) {
                          // final product = ProductsModel.products[index];
                          UserModel agentUser = jorismCubit.agentUsers[index];
                          return Container(
                            width: double.infinity,
                            child: Container(
                              height: 300,
                              width: double.infinity,
                              margin: EdgeInsets.all(22),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 2.0,
                                      color: Colors.grey.shade700),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      height: 200,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/petraRegister.png'),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${agentUser.username}',
                                          style: TextStyle(
                                            color: Colors.grey.shade800,
                                            fontSize: 40,
                                            fontFamily: primaryFont,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          navigators.navigatorWithBack(
                                              context, AgentDetailsScreen());
                                        },
                                        icon: Icon(Icons.arrow_circle_right),
                                        iconSize: 50.0,
                                        color: primaryColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            );
          }
          return Container();
        });
  }
}
