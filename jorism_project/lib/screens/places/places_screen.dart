import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jorism_project/shared/components/component.dart';
import 'package:jorism_project/shared/components/constants.dart';


class PlacesScreen extends StatelessWidget {
  // const PlacesScreen({super.key});

  TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          'Locations',
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
            SizedBox(height: 10,),
            Container(
              height: 50,
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
                  hintText: "Search for Location",
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
            MasonryGridView.count(
                physics: BouncingScrollPhysics(),
                crossAxisCount: 1,
                crossAxisSpacing: 1,
                // mainAxisSpacing: 0,
                // primary: false,
                shrinkWrap: true,
                itemCount:6,
                itemBuilder: (BuildContext context, int index) {
                  // final product = ProductsModel.products[index];
                  return Container(
                    width: double.infinity,
                    child:Container(
                      height: 450,
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
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 235,
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
                                  'Petra',
                                  style: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 50,
                                    fontFamily: primaryFont,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(
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
                                      text: 'Activities',
                                      textButtonColor: Colors.black,
                                      // width: 150,
                                      backround: Colors.black54,
                                      fontSize: 13,
                                      fontFamily: primaryFont,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: Container(
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
                                      text: 'Restaurants',
                                      textButtonColor: Colors.black,
                                      // width: 150,
                                      backround: Colors.black54,
                                      fontSize: 11.2,
                                      fontFamily: primaryFont,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: Container(
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
                                      text: 'Sites',
                                      textButtonColor: Colors.black,
                                      // width: 150,
                                      backround: Colors.black54,
                                      fontSize: 13,
                                      fontFamily: primaryFont,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('The city of Petra, capital of the Nabataean Arabs,'
                                'is one of the most famous archaeological sites in the world,'
                                'it is Located 240 km south of the capital Amman and 120 km'
                                'north of the red sea town of Aqaba (see the Map),'
                                'Petra the world wonder,'
                                'is undoubtedly Jordan\'s'
                                ' most valuable treasure'
                                'and greatest tourist attraction,'
                                'and it is visited by tourists from all over the world.',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              // style: TextStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
