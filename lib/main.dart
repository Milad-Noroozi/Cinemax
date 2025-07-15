import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/search_controller.dart';
import 'controllers/carousel_controller.dart' as carousel_ctrl;
import 'views/splash_screen.dart';
import 'views/search_view.dart';
import 'views/main_wrapper.dart'; // فایل جدید که ساختیم

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchPageController()),
        ChangeNotifierProvider(create: (_) => carousel_ctrl.CarouselController()),
      ],
      child: MaterialApp(
        title: 'Movie & Series App',
        theme: ThemeData(
          primarySwatch: Colors.blue, 
          fontFamily: 'SF Pro Text'
        ),
        home: SplashScreen(), // همچنان از SplashScreen شروع می‌شود
        routes: {
          '/search': (context) => const SearchView(),
          '/home': (context) => MainWrapper(), // route جدید برای MainWrapper
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}