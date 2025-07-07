import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../controllers/search_controller.dart';
import '../controllers/carousel_controller.dart' as carousel_ctrl;
import '../widgets/search_box_widget.dart';
import '../widgets/carousel_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
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
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child: Icon(CupertinoIcons.heart_fill, color: Colors.red,),
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
                        carouselController: carouselController.carouselController,
                        options: CarouselOptions(
                          height: 200,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          enlargeCenterPage: true,
                          aspectRatio: 16/9,
                          onPageChanged: (index, reason) {
                            carouselController.updateCurrentIndex(index);
                          },
                        ),
                        items: carouselController.carouselItems.map((item) {
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
                        children: carouselController.carouselItems.asMap().entries.map((entry) {
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: carouselController.currentIndex == entry.key
                                  ? Colors.white
                                  : Colors.white.withValues(alpha: 0.4),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
              ),
              
              const SizedBox(height: 30),
              
              // Main Content Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'محتوای اصلی صفحه اینجا قرار می‌گیرد',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Additional content can be added here
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFF2C3035),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'بخش محتوای اضافی',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}