import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jorism_project/registration/login/login_screen.dart';
import 'package:jorism_project/shared/Network/Cache_Helper.dart';
import 'package:jorism_project/shared/components/component.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class BoardingModel {
  final String image;
  final String title;
  final String description;

  BoardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  bool isLast = false;
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/onboarding1.jpg',
      title: 'Explore The Neighborhood 🌍 ',
      description: 'Discover the hidden gems ,captivating stories ,and vibrant culture of Jordan with our tourism app,Whether You\,re a visitor or a resident',
    ),
    BoardingModel(
      image: 'assets/images/onboarding2.png',
      title: 'Your Personalized Journey 🗺️ ',
      description: 'we\'ve got you covered with the best tips, recommendations, and exciting activities to make your experience unforgettable',
    ),
    BoardingModel(
      image: 'assets/images/onboarding 3.jpg',
      title: 'Capture The Moment 📸',
      description: 'Share your discoveries with the world!,Don\'t forget to tag us and use our unique [#Jorism] to connect with fellow adventurers.',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEDEDE),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                    // print('Last');
                  } else {
                    setState(() {
                      isLast = false;
                    });
                    // print('Not Last');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  // bool checkIfLastPage(){
  //   return (isLast==boarding.length-1);
  // }
  //
  // closeOnBoarding(){
  //   CacheHelper.cachehelper.storeUserStatus();
  //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context){
  //     return BottomNavBar();
  //   }));
  //   }
  // }

  Widget buildBoardingItem(BoardingModel model) => Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: defaultTextButton(
                function: () {
                  closeOnBoarding();
                  navigators.navigatorWithBack(context, LoginScreen());
                },
                text: 'Skip',
                fontFamily: 'Georgia',
                textButtonColor:Color(0xFF4F2E1D),
                fontSize: 25,
              ),
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 450,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      image: DecorationImage(
                          image: AssetImage(model.image),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.grey, BlendMode.multiply))),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.title}',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Georgia',
                    color: Color(0xFF4F2E1D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  '${model.description}',
                  style: TextStyle(
                      fontSize: 17.0,
                      // fontFamily: 'Georgia',
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SmoothPageIndicator(
                    controller: boardController,
                    count: boarding.length,
                    // axisDirection: Axis.horizontal,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Color(0xFF4F2E1D),
                      dotColor: Colors.grey.shade700,
                      dotHeight: 10,
                      dotWidth: 20,
                      spacing: 5,
                      expansionFactor: 1.1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
  bool checkIfLastPage(){
    return (isLast==boarding.length-1);
  }

  closeOnBoarding(){
    CacheHelper.cachehelper.storeUserStatus();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context){
      return LoginScreen();
    }));
  }
}
