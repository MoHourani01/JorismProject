import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jorism_project/cubit/cubit.dart';
import 'package:jorism_project/cubit/state.dart';
import 'package:jorism_project/models/products_model.dart';
import 'package:jorism_project/screens/Details/details.dart';
import 'package:jorism_project/shared/components/component.dart';
import 'package:jorism_project/shared/components/constants.dart';
import 'package:jorism_project/shared/components/widgets/home_widgets/carousal%20widget.dart';
import 'package:jorism_project/shared/components/widgets/home_widgets/text_container_widget.dart';

class HomeScreen extends StatelessWidget {
  final List<String> images = [
    'assets/images/petraLogin2.png',
    'assets/images/onboarding1.jpg',
    'assets/images/onboarding2.png',
    'assets/images/onboarding 3.jpg',
  ];

  int activatedIndex = 0;
  int activatedAgencyIndex = 0;
  TextEditingController searchController=TextEditingController();
  // final carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    JorismCubit.get(context).getUserProducts();
    return BlocConsumer<JorismCubit, JorismState>(
      listener: (context, state) {
        if (state is GetUserProductLoadingState) {
          // showToast(text: 'Loading', state: ToastStates.Warning);
          Center(child: CircularProgressIndicator(),);
        }
      },
      builder: (context, state) {
        var homeCubit = JorismCubit.get(context);
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
            // actions: [
            //   Padding(
            //     padding: const EdgeInsets.only(right: 12.0),
            //     child: IconButton(
            //       icon: Icon(
            //         Icons.search,
            //         size: 30,
            //       ),
            //       color: Colors.white,
            //       onPressed: () {},
            //     ),
            //   ),
            // ],
            title: Text(
              'Home',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Georgia',
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 240,
                        width: 370,
                        margin: EdgeInsets.all(22),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1.0, color: Colors.grey.shade700),
                          ],
                        ),
                        // child: ,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: carousalWidget(
                          images: images,
                          indicatorIndex: homeCubit.activatedIndex,
                          // firstHeight: 200,
                          // width: 550,
                          sizedboxHeight: 65,
                          onPageChanged: (index, reason) =>
                              homeCubit.activatIndex(index),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height:,
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // textAgencyContainerWidget(
                      //     text: 'Agency',
                      //     fontSize: 25
                      // ),
                      // Stack(
                      //   alignment: Alignment.topCenter,
                      //   children: [
                      //     Container(
                      //       height: 250,
                      //       // width: 200,
                      //       margin: EdgeInsets.all(22),
                      //       decoration: BoxDecoration(
                      //         color: Colors.grey.shade200,
                      //         borderRadius: BorderRadius.circular(40),
                      //         boxShadow: [
                      //           BoxShadow(blurRadius: 1.0,
                      //               color: Colors.grey.shade700),
                      //         ],
                      //       ),
                      //       // child: ,
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.only(top: 30.0),
                      //       child: carousalWidget(
                      //         images: images,
                      //         indicatorIndex: homeCubit.activatedAgencyIndex,
                      //         // firstHeight: 290,
                      //         width: 350,
                      //         sizedboxHeight: 20,
                      //         onPageChanged: (index, reason) =>
                      //             homeCubit.activatAgencyIndex(index),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      textContainerWidget(
                        text: 'Trips',
                        fontSize: 23,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          height: 45,
                          margin: EdgeInsets.only(left: 22,right: 22,top: 12),
                          child: TextField(
                            controller: searchController,
                            onChanged: (value) {
                              // filterSearchResults(value);
                            },
                            decoration: InputDecoration(

                              prefixIcon: Icon(
                                Icons.search,
                                color:primaryColor,
                              ),
                              hintText: "Search for trips ",
                              hintStyle: TextStyle(
                                color:Colors.grey,

                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color:Colors.black87,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                  borderSide: BorderSide(
                                    color: Colors.black87,
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),

                      ConditionalBuilder(condition: state is! GetUserProductLoadingState,
                          builder: (context) => MasonryGridView.count(
                              physics: BouncingScrollPhysics(),
                              crossAxisCount: 2,
                              // crossAxisSpacing: 1,
                              // mainAxisSpacing: 1,
                              // prima=ry: false,
                              shrinkWrap: true,
                              itemCount: homeCubit.userProductsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                ProductsModel product = homeCubit
                                    .userProductsList[index];
                                // final product = ProductsModel.products[index];
                                if (homeCubit.userProductsList.length <= 0) {
                                  return Center(
                                    child: CircularProgressIndicator(),);
                                }
                                return Container(
                                  height: 255,
                                  width: 200,
                                  margin: EdgeInsets.only(left: 15,bottom: 10,right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(40),
                                    boxShadow: [
                                      BoxShadow(blurRadius: 1.0,
                                          color: Colors.grey.shade700),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, left: 8, right: 8),
                                          child: GestureDetector(
                                            onTap: () {
                                              ProductsModel products = homeCubit
                                                  .userProductsList[index];
                                              navigators.navigatorWithBack(
                                                  context, DetailsScreen(
                                                productDetails: products,));
                                            },
                                            child: Container(
                                              height: 150,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(40),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        '${product
                                                            .productImage}'),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0),
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
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Text(
                                              '${product.productPrice} JD',
                                              style: TextStyle(fontSize: 16),),
                                          ),
                                          // IconButton(
                                          //     onPressed: () {
                                          //       ProductsModel products = homeCubit
                                          //           .userProductsList[index];
                                          //       navigators.navigatorWithBack(
                                          //           context, DetailsScreen(
                                          //         productDetails: products,));
                                          //     },
                                          //     icon: Icon(Icons.arrow_forward)),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          fallback: (context) => Center(child: CircularProgressIndicator(),)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

// Widget buildIndicator(int index) {
//   return AnimatedSmoothIndicator(
//     activeIndex: index,
//     count: 4,
//     onDotClicked: animateToSlide,
//     effect: SlideEffect(
//         dotWidth: 10,
//         dotHeight: 10,
//         activeDotColor: primaryColor,
//         dotColor: Colors.grey),
//   );
// }
//
// void animateToSlide(int index) => carouselController.animateToPage(index);
}

