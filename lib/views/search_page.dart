import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.person_alt_circle,
                size: 100,
                color: const Color.fromARGB(255, 18, 205, 217),
              ),
              SizedBox(height: 20),
              Text(
                'Profile Page',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Coming Soon...',
                style: TextStyle(
                  color: const Color.fromARGB(255, 146, 146, 157),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}