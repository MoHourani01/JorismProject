import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jorism_project/shared/components/constants.dart';


class ReportScreen extends StatelessWidget {
  // const ReportScreen({super.key});

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
        title: Text(
          'Reports',
          style: TextStyle(
            fontSize:20,
            fontWeight: FontWeight.bold,
            fontFamily: primaryFont,
            color: Colors.white,

          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 5,
              ),
              MasonryGridView.count(
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 1,
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(22),
                      width: 440,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2.0, color: Colors.grey.shade700),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, bottom: 12, right: 15,top:40),
                            child: Text(
                              'Product id:',
                              style: TextStyle(
                                fontSize:20 ,
                                fontWeight: FontWeight.bold,
                                fontFamily: primaryFont,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, bottom: 12, right: 15),
                            child: Text(
                              'Product Name:',
                                style: TextStyle(
                                fontSize:20 ,
                                fontWeight: FontWeight.bold,
                                fontFamily: primaryFont,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, bottom: 12, right: 15),
                            child: Text(
                              'Quantity:',
                              style: TextStyle(
                                fontSize:20 ,
                                fontWeight: FontWeight.bold,
                                fontFamily: primaryFont,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, bottom: 12, right: 15),
                            child: Text(
                              'Date:',
                              style: TextStyle(
                                fontSize:20 ,
                                fontWeight: FontWeight.bold,
                                fontFamily: primaryFont,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, bottom: 12, right: 15),
                            child: Text(
                              'Price:',
                              style: TextStyle(
                                fontSize:20 ,
                                fontWeight: FontWeight.bold,
                                fontFamily: primaryFont,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, bottom: 12, right: 15),
                            child: Text(
                              'Client id:',
                              style: TextStyle(
                                fontSize:20 ,
                                fontWeight: FontWeight.bold,
                                fontFamily: primaryFont,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
