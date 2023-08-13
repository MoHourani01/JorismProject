import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jorism_project/shared/components/component.dart';


class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
           //   leading:
           // IconButton(
           //   icon: Icon(Icons.arrow_back_ios,),
           //   onPressed: (){},
           // ),
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
                child: Container(
                  width: 140,
                    height: 40,
                    decoration: BoxDecoration(
                      color:  Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(blurRadius: 0.5,color: Colors.grey.shade900),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.phone),
                        TextButton(onPressed: () {  },
                          child: Text('Contact Us',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54
                            ),),
                        ),
                      ],
                    ),

                ),
              ),
            ],
          ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 381,
                height: 279,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_pin),
                    Text('  Aqaba , Jordan  '),
                    Row(
                      children: [
                        SizedBox(width: 70,),
                        Text('1.3'),
                        Icon(Icons.star),
                      ],
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                  child: Stack(
                  children: [
                  Center(
      child: Container(
      width: 390,
      height: 350,
      decoration: BoxDecoration(
      color: Color(0xFFFDEDE7),
      borderRadius: BorderRadius.circular(35.0),
      ),
      child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
        children: [
//           Row(
//             children: [
// //              Expanded(
// //                child: Container(
// //                    decoration: BoxDecoration(
// //                      color:  Colors.white,
// //                      borderRadius: BorderRadius.circular(30.0),
// //                      boxShadow: [
// //                        BoxShadow(blurRadius: 0.5,color: Colors.grey.shade700),
// //                      ],
// //                    ),
// //                    child:
// //                    TextButton(onPressed: () {},
// //                      child: Text('About' ,
// //                        style: TextStyle(
// //                            fontSize: 15,
// //                            color: Colors.black
// //                        ),),
// //                    )
// //                ),
// //              ),
// //              SizedBox(width: 10,),
//               Expanded(
//                 child: Container(
//                   height: 30,
//                   // width: ,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade200,
//                     borderRadius: BorderRadius.circular(40),
//                     boxShadow: [
//                       BoxShadow(blurRadius: 2.0,color: Colors.black),
//
//                     ],
//                   ),
//                   child: defaultButton(
//                     function: (){},
//                     text: 'Activities',
//                     textButtonColor: Colors.black,
//                     // width: 150,
//                     backround: Colors.black54,
//                     fontSize: 13,
//                   ),
//                 ),
//               ),
//               SizedBox(width: 10,),
//               Expanded(
//                 child: Container(
//                   height: 30,
//                   // width: ,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade200,
//                     borderRadius: BorderRadius.circular(40),
//                     boxShadow: [
//                       BoxShadow(blurRadius: 2.0,color: Colors.black),
//
//                     ],
//                   ),
//                   child: defaultButton(
//                     function: (){},
//                     text: 'Price',
//                     textButtonColor: Colors.black,
//                     // width: 150,
//                     backround: Colors.black54,
//                     fontSize: 13,
//                   ),
//                 ),
//               ),
//               SizedBox(width: 10,),
//               Expanded(
//                 child: Container(
//                   height: 30,
//                   // width: ,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade200,
//                     borderRadius: BorderRadius.circular(40),
//                     boxShadow: [
//                       BoxShadow(blurRadius: 2.0,color: Colors.black),
//
//                     ],
//                   ),
//                   child: defaultButton(
//                     function: (){},
//                     text: 'Insurance',
//                     textButtonColor: Colors.black,
//                     // width: 150,
//                     backround: Colors.black54,
//                     fontSize: 13,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 30),
//

        ],
        ),
      ),
      ),
                  ),
                  ),

                  ]),
                ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 35,
                      width: 100,
                      // width: ,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(blurRadius: 2.0,color: Colors.black),

                        ],
                      ),
                      child: defaultButton(
                        function: (){},
                        text: 'Buy Now',
                        textButtonColor: Colors.black,
                        // width: 150,
                        backround: Colors.black54,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  SizedBox(width: 30,),
                  Expanded(
                  child: Row(
                    children: [
                      Container(
                        child: IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.add_circle_outline,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                            'Quantity'
                        ),
                      ),
                      Container(
                        child: IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.remove_circle_outline,

                          ),
                        ),
                      ),
                    ],
                  ),
                )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
