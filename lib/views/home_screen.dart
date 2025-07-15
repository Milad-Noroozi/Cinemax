import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../controllers/search_controller.dart';
import '../controllers/carousel_controller.dart' as carousel_ctrl;
import '../widgets/search_box_widget.dart';
import '../widgets/carousel_item_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> genre = [
    "ALL",
    "Action",
    "Comedy",
    "Horror",
    "Drama",
    "Science Fiction",
    "Western",
    "Romance",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.person_alt_circle,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello, Smith",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Let's stream your favorite movie",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 146, 146, 157),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 37, 40, 54),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Icon(CupertinoIcons.heart_fill, color: Colors.red),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Search Box Section
              Consumer<SearchPageController>(
                builder: (context, searchController, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SearchBoxWidget(
                      hintText: 'Search a title..',
                      controller: searchController.textController,
                      isLoading: searchController.model.isLoading,
                      onChanged: searchController.onSearchChanged,
                      onSubmitted: (value) {
                        searchController.onSearchSubmitted(value);
                        // Here you can navigate to the search page
                        Navigator.pushNamed(context, '/search');
                      },
                      onFilterPressed: () {
                        // Here you can navigate to the filter page
                        searchController.onFilterPressed();
                      },
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),

              // Carousel Section
              Consumer<carousel_ctrl.CarouselController>(
                builder: (context, carouselController, child) {
                  return Column(
                    children: [
                      // Carousel
                      CarouselSlider(
                        carouselController:
                            carouselController.carouselController,
                        options: CarouselOptions(
                          height: 180,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 9,
                          onPageChanged: (index, reason) {
                            carouselController.updateCurrentIndex(index);
                          },
                        ),
                        items:
                            carouselController.carouselItems.map((item) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return CarouselItemWidget(item: item);
                                },
                              );
                            }).toList(),
                      ),

                      const SizedBox(height: 15),

                      // Carousel Indicators
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            carouselController.carouselItems
                                .asMap()
                                .entries
                                .map((entry) {
                                  return Container(
                                    width:
                                        carouselController.currentIndex ==
                                                entry.key
                                            ? 20.0
                                            : 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 4.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        4.0,
                                      ), // گرد کردن گوشه‌ها
                                      color:
                                          carouselController.currentIndex ==
                                                  entry.key
                                              ? const Color.fromARGB(
                                                255,
                                                18,
                                                205,
                                                217,
                                              )
                                              : Color.fromARGB(
                                                255,
                                                18,
                                                205,
                                                217,
                                              ).withValues(alpha: 0.4),
                                    ),
                                  );
                                })
                                .toList(),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.03,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
                height: MediaQuery.of(context).size.height * 0.08,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: genre.length,
                  itemBuilder: (context, index) {
                    final isFirst = index == 0;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Card(
                        color:
                            isFirst
                                ? const Color.fromARGB(255, 37, 40, 54)
                                : const Color(0xFF1A1A2E),
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 4.0,
                          ),
                          child: Center(
                            child: Text(
                              genre[index],
                              style: TextStyle(
                                color:
                                    isFirst
                                        ? const Color.fromARGB(
                                          255,
                                          18,
                                          205,
                                          217,
                                        )
                                        : Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.03,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Most popular",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 18, 205, 217),
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              

              // List View
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.03,
                ),
                child: Container(
                  height: 230,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 135,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                      child: Image.asset(
                                        'assets/images/-see-tv-series.jpg',
                                        height: 170,
                                        width: 135,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(120, 37, 54, 1),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 14,
                                            ),
                                            SizedBox(width: 2),
                                            Text(
                                              '4.5',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 37, 40, 54),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'The See ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Action',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
