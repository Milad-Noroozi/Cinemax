import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/search_controller.dart'; 
import '../widgets/search_box_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3035),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C3035),
        title: const Text(
          'Search',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<SearchPageController>(  // اینجا باید SearchPageController باشه
        builder: (context, pageController, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // سرچ باکس
                SearchBoxWidget(
                  hintText: 'Search a title..',
                  controller: pageController.textController,
                  isLoading: pageController.model.isLoading,
                  onChanged: pageController.onSearchChanged,
                  onSubmitted: pageController.onSearchSubmitted,
                  onFilterPressed: pageController.onFilterPressed,
                ),
                
                const SizedBox(height: 24),
                
                // نمایش متن جستجو
                if (pageController.model.searchText.isNotEmpty) ...[
                  Text(
                    'جستجو برای: ${pageController.model.searchText}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                
                // تاریخچه جستجو
                if (pageController.model.searchHistory.isNotEmpty) ...[
                  const Text(
                    'تاریخچه جستجو:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: pageController.model.searchHistory.length,
                      itemBuilder: (context, index) {
                        final historyItem = pageController.model.searchHistory[index];
                        return ListTile(
                          leading: const Icon(
                            Icons.history,
                            color: Color(0xFF8B9299),
                          ),
                          title: Text(
                            historyItem,
                            style: const TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            pageController.textController.text = historyItem;
                            pageController.onSearchChanged(historyItem);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}