import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jorism_project/shared/components/constants.dart';


class NewsScreen extends StatelessWidget {
  final List<Map<String, String>> newsList = [
    {
      'title': 'As the Dead Sea shrinks, Jordan fights to win back tourists',
      'description': 'Not unlike the Dead Sea, Jordan’s tourist numbers had been drying up in the last decade before almost evaporating during the Covid pandemic',
      'imagePath': 'assets/images/th.jpg',
    },
    {
      'title': 'Jordanian expatriates a major source of tourism revenue — experts',
      'description': 'AMMAN — Jordanians living abroad comprised the largest portion of tourists to the Kingdom this year, according to experts.Jordan’s tourism revenue grew by 204.5 per cent during the first seven months of 2022, and reached about 2.87 billion compared with the same period in 2021, according to the Ministry of Tourism,The number of tourists visiting the Kingdom increased by 1.7 million this year, according to the ministry.',
      'imagePath': 'assets/images/jordan news.jpg',
    },
    {
      'title': 'Is it safe to visit Jordan?',
      'description': 'This trip to Jordan was wonderful and such an eye-opening experience. The country is beautiful, safe and full of history. Our tour guide was exceptional! He knew so much and was a lot of fun! I\'m grateful that Gate 1 created this tour and did it completely in Jordan (instead of a combo with another country).',
      'imagePath': 'assets/images/news3.png',
    },
    {
      'title': 'Best Time To Visit Jordan',
      'description': 'The high seasons (March to May and September to November) are best for outdoor adventures & Low season (December to February) prices are good for budget travelers, but pack for wet weather',
      'imagePath': 'assets/images/news4.jfif',
    },
    {
      'title': 'Jordan\'s Historical and Cultural Gems Continue to Attract Tourists',
      'description': 'As of my last knowledge update in September 2021, Jordan was known for its rich historical and cultural attractions, such as the ancient city of Petra and the historical site of Jerash, which were popular destinations for tourists. For the most recent news about Jordan\'s tourism industry, I recommend checking the latest travel and tourism news sources or the official website of Jordan\'s Ministry of Tourism and Antiquities.',
      'imagePath': 'assets/images/news5.jfif',
    },
    {
      'title': 'Discovering the Enchanting Beauty of Jordan: A Tapestry of History and Nature',
      'description': 'Jordan\'s breathtaking beauty captivates travelers with its diverse landscapes, from the stunning rose-red city of Petra to the serene shores of the Dead Sea. The country\'s blend of historical marvels, like the ancient ruins of Jerash, and natural wonders, such as the red desert of Wadi Rum, creates an enchanting tapestry that continues to mesmerize adventurers and culture enthusiasts alike.',
      'imagePath': 'assets/images/news6.jfif',
    },

  ];

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
          'News',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: primaryFont,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5),
              MasonryGridView.count(
                physics: BouncingScrollPhysics(),
                crossAxisCount: 1,
                shrinkWrap: true,
                itemCount: newsList.length,
                itemBuilder: (BuildContext context, int index) {
                  final news = newsList[index];
                  return Container(
                    margin: EdgeInsets.all(22),
                    width: 440,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2.0,
                          color: Colors.grey.shade700,
                        ),
                      ],
                    ),
                    child: Container(
                      height: 290,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                left: 8,
                                right: 8,
                              ),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  image: DecorationImage(
                                    image: AssetImage(news['imagePath'] ?? ''),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              news['title'] ?? '',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: primaryFont,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              bottom: 12,
                              right: 15,
                            ),
                            child: Text(
                              news['description'] ?? '',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
