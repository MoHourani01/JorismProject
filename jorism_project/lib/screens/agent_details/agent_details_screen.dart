import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jorism_project/screens/Details/details.dart';
import 'package:jorism_project/shared/components/component.dart';
import 'package:jorism_project/shared/components/constants.dart';


class AgentDetailsScreen extends StatelessWidget {
  // const AgentDetailsScreen({super.key});

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

        title: Text(
          'Agent',
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
              color: Colors.white
            ),
            child: Center(
              child: Text('Contact',
              style: TextStyle(
                  fontSize: 23,fontFamily: primaryFont,
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
              child:Container(
                height: 300,
                width: double.infinity,
                margin: EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(blurRadius: 2.0,color: Colors.grey.shade700),
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
                                  image: AssetImage('assets/images/petraRegister.png'), fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          child: Text(
                            'Agent Name',
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
                                    fontFamily: primaryFont
                                ),
                              ),
                              Text(
                                'Address',
                                style: TextStyle(
                                    fontSize: 16,
                                    // fontWeight: FontWeight.bold,
                                    fontFamily: primaryFont
                                ),
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
                                    fontFamily: primaryFont
                                ),
                              ),
                              Text(
                                'hours',
                                style: TextStyle(
                                    fontSize: 16,
                                    // fontWeight: FontWeight.bold,
                                    fontFamily: primaryFont
                                ),
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
                                    fontFamily: primaryFont
                                ),
                              ),
                              Text(
                                'feedback',
                                style: TextStyle(
                                    fontSize: 16,
                                    // fontWeight: FontWeight.bold,
                                    fontFamily: primaryFont
                                ),
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
    );
  }
}
