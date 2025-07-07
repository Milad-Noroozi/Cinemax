import 'package:flutter/material.dart';

class SearchBoxWidget extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final VoidCallback? onFilterPressed;
  final TextEditingController? controller;
  final bool isLoading;

  const SearchBoxWidget({
    super.key,
    this.hintText = 'Search a title..',
    this.onChanged,
    this.onSubmitted,
    this.onFilterPressed,
    this.controller,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 37, 40, 54),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF8B9299),
                      ),
                    ),
                  )
                : const Icon(
                    Icons.search,
                    color: Color(0xFF8B9299),
                    size: 24,
                  ),
          ),
          // فیلد متنی
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              style: const TextStyle(
                color: Color(0xFF8B9299),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFF8B9299),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          // خط جداکننده
          Container(
            width: 1,
            height: 24,
            color: const Color(0xFF8B9299),
            margin: const EdgeInsets.symmetric(horizontal: 8),
          ),
          // آیکون فیلتر
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: onFilterPressed,
              borderRadius: BorderRadius.circular(4),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.tune,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}