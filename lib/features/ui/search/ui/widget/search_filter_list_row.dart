// features/ui/search/ui/widget/search_filter_list_row.dart
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/spacing.dart';
import 'search_text_form_field.dart';

class SearchFilterListRow extends StatelessWidget {
  const SearchFilterListRow({super.key, this.onChanged});
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 7,
            child: SearchTextFormField(
                //  searchController: context.read<SearchCubit>().sesrchControler,
                // onChanged: onChanged,
                )),
        horezontalSpace(2),
        Expanded(
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.filter_list_rounded,
                  size: 30,
                  color: MyColorsManager.lightGrey,
                )))
      ],
    );
  }
}
