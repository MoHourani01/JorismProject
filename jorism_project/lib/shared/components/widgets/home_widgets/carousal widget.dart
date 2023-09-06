
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jorism_project/shared/components/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


final carouselController = CarouselController();
void animateToSlide(int index) => carouselController.animateToPage(index);

// int indicatorIndex=0;

Widget carousalWidget({ required List<String> images,
    required int indicatorIndex,
    double? firstHeight,
    // required double secondHeight,
    double? width,
    required double sizedboxHeight,
    dynamic Function(int, CarouselPageChangedReason)? onPageChanged}
    )
{
  return Column(
    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CarouselSlider(
        items: images
            .map(
              (e) => Container(
            height: firstHeight,
            // width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, ),
                    child: Container(
                      // height: 250,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        image: DecorationImage(
                          image: AssetImage('${e}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
            .toList(),
        options: CarouselOptions(
          height: 200,
          // aspectRatio: 10/6,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeIn,
          enlargeCenterPage: true,
          enlargeFactor: 2.3,
          // onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
          onPageChanged: onPageChanged,
        ),
      ),
      // SizedBox(
      //   height: 25,
      // ),
      // buildIndicator(indicatorIndex),
    ],
  );
}

Widget buildIndicator(int index) {
  return AnimatedSmoothIndicator(
    activeIndex: index,
    count: 4,
    onDotClicked: animateToSlide,
    effect: SlideEffect(
        dotWidth: 6,
        dotHeight: 5,
        activeDotColor: primaryColor,
        dotColor: Colors.grey),
  );
}

// agency first height 290
// agency second height 178
// agency first width 250