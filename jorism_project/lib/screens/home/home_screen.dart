
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jorism_project/screens/Details/details.dart';
import 'package:jorism_project/shared/components/component.dart';
import 'package:jorism_project/shared/components/constants.dart';
import 'package:jorism_project/shared/components/widgets/home_widgets/carousal%20widget.dart';
import 'package:jorism_project/shared/components/widgets/home_widgets/text_container_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> images = [
    'assets/images/petraLogin2.png',
    'assets/images/onboarding1.jpg',
    'assets/images/onboarding2.png',
    'assets/images/onboarding 3.jpg',
  ];

  int activatedIndex = 0;
  int activatedAgencyIndex = 0;
  // final carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              color: Colors.white,
              onPressed: () {},
            ),
          ),
        ],
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
                    height: 300,
                    // width: 200,
                    margin: EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(blurRadius: 1.0,color: Colors.grey.shade700),
                      ],
                    ),
                    // child: ,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: carousalWidget(
                      images: images,
                      indicatorIndex: activatedIndex,
                      firstHeight: 290,
                      // width: 250,
                      sizedboxHeight: 65,
                      onPageChanged: (index, reason) =>
                          setState(() => activatedIndex = index),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 23,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textAgencyContainerWidget(
                    text: 'Agency',
                    fontSize: 25
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 250,
                        // width: 200,
                        margin: EdgeInsets.all(22),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(blurRadius: 1.0,color: Colors.grey.shade700),
                          ],
                        ),
                        // child: ,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: carousalWidget(
                          images: images,
                          indicatorIndex: activatedAgencyIndex,
                          // firstHeight: 290,
                          width: 250,
                          sizedboxHeight: 20,
                          onPageChanged: (index, reason) =>
                              setState(() => activatedAgencyIndex = index),
                        ),
                      ),
                    ],
                  ),
                  textContainerWidget(
                    text: 'Trips',
                    fontSize: 23,
                  ),
                  MasonryGridView.count(
                      physics: BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      // crossAxisSpacing: 1,
                      // mainAxisSpacing: 0,
                      // primary: false,
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        // final product = ProductsModel.products[index];
                        return Container(
                          height: 255,
                          // width: 200,
                          margin: EdgeInsets.all(22),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(blurRadius: 1.0,color: Colors.grey.shade700),
                            ],
                          ),
                          child: Column(
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
                                        borderRadius: BorderRadius.circular(40),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/rum.png'),
                                            fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Book Now',
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
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.outlet)),
                                  IconButton(
                                      onPressed: () {
                                        navigators.navigatorWithBack(context, DetailsScreen());
                                      },
                                      icon: Icon(Icons.arrow_forward)),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
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

