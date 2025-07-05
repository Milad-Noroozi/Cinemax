import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                          "Let’s stream your favorite movie",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 146, 146, 157),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Spacer(),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 37, 40, 54),
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: Icon(CupertinoIcons.heart_fill,color: Colors.red,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
