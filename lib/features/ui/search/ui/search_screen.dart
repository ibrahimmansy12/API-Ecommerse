// features/search/ui/search_screen.dart
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "search",
          style: MyTextStyles.font30darkbluesemBold,
        ),
      ),
    );
  }
}
