// features/ui/search/ui/search_page.dart
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'widget/search_bloc_builder.dart';
import 'widget/search_text_form_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                height: 22.h,
                color: MyColorsManager.black,
                child: Center(child: SearchTextFormField())),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                width: double.infinity,
                child: SearchBlocBuilder())
          ],
        ),
      ),
    );
  }
}

// Expanded(
//                   child: ListView.builder(
//                 itemCount: 12,
//                 itemBuilder: (context, index) {
//                   return DoctorListViewItem(doctorData: BlocProvider.of<HomeCubit>(context).specializatonList.) ;
//                 },
//               ))
