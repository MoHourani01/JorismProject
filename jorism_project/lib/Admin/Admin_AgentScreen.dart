import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jorism_project/cubit/cubit.dart';
import 'package:jorism_project/cubit/state.dart';
import 'package:jorism_project/models/products_model.dart';
import 'package:jorism_project/registration/registration_cubit/registration_cubit.dart';
import 'package:jorism_project/screens/Details/details.dart';
import 'package:jorism_project/shared/components/component.dart';
import 'package:jorism_project/shared/components/constants.dart';

class AdminAgentDetailsScreen extends StatelessWidget {
  // const AgentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    JorismCubit.get(context).getUserProductsCollection(RegistrationCubit.get(context).userModel!.userId);
    return BlocConsumer<JorismCubit, JorismState>(
        listener: (context, state) {
          if(state is GetUserProductLoadingState){
            Center(child: CircularProgressIndicator());
          }
          if( state is DeleteUserProductSuccessState){
            showToast(text: 'Delete Product User', state: ToastStates.Success);
          }
        },
        builder: (context, state) {
          var agentCubit = JorismCubit.get(context);

          if(state is GetUserProductSuccessState||state is DeleteProductSuccessState|| state is DeleteUserProductSuccessState){
            return Scaffold(
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
                  'Admin Agent',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: primaryFont,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                actions: [
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 110,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        'Contact',
                        style: TextStyle(
                          fontSize: 23,
                          fontFamily: primaryFont,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
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
                                blurRadius: 2.0, color: Colors.grey.shade700),
                          ],
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 175,
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
                                Positioned(
                                  left: 20,
                                  child: Text(
                                    '${RegistrationCubit.get(context).userModel!.username}',
                                    style: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontSize: 40,
                                      fontFamily: primaryFont,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Address:',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: primaryFont),
                                      ),
                                      Text(
                                        'Address',
                                        style: TextStyle(
                                            fontSize: 16,
                                            // fontWeight: FontWeight.bold,
                                            fontFamily: primaryFont),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Hours:',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: primaryFont),
                                      ),
                                      Text(
                                        'hours',
                                        style: TextStyle(
                                            fontSize: 16,
                                            // fontWeight: FontWeight.bold,
                                            fontFamily: primaryFont),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Feedback:',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: primaryFont),
                                      ),
                                      Text(
                                        'feedback',
                                        style: TextStyle(
                                            fontSize: 16,
                                            // fontWeight: FontWeight.bold,
                                            fontFamily: primaryFont),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        MasonryGridView.count(
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          primary: false,
                          shrinkWrap: true,
                          itemCount: agentCubit.userProducts.length,
                          itemBuilder: (BuildContext context, int index) {
                            ProductsModel product = agentCubit.userProducts[index];
                            // List<ProductsModel> product = agentCubit.getUserProducts(RegistrationCubit.get(context).userModel!.userId) as List<ProductsModel>;
                            return Container(
                              height: 255,
                              margin: EdgeInsets.all(22),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 1.0,
                                      color: Colors.grey.shade700),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, left: 8, right: 8),
                                          child: Container(
                                            height: 150,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(40),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${product.productImage}'),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '${product.productName}',
                                            style: TextStyle(
                                              color: Color(0xFF4F2E1D),
                                              fontSize: 20,
                                              fontFamily: primaryFont,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0),
                                            child: Text(
                                              '${product.productPrice} JD',
                                              style: TextStyle(
                                                fontSize: 16,

                                              ),
                                                ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                ProductsModel productDetails=agentCubit.userProductsList[index];
                                                navigators.navigatorWithBack(
                                                    context, DetailsScreen(productDetails: productDetails,));
                                              },
                                              icon: Icon(Icons.arrow_forward)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: IconButton(
                                      onPressed: () {
                                        agentCubit.deleteProduct(product, RegistrationCubit.get(context).userModel!.userId);
                                        showToast(text: 'Deleted Successfully', state: ToastStates.Success);
                                      },
                                      icon: Icon(Icons.delete),
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          // agentCubit.getUserProducts('${RegistrationCubit.get(context).userModel!.userId}');
          else{
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
