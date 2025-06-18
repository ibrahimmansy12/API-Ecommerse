// features/ui/search/ui/widget/search_text_form_field.dart
import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../logic/search/logic/search_cubit.dart';

class SearchTextFormField extends StatefulWidget {
  const SearchTextFormField({
    super.key,
    this.searchController,
    // this.doctorsSearchList,
    // this.allDoctorsList,
    // this.onChanged,
  });
  final TextEditingController? searchController;
  // final List<Doctors>? doctorsSearchList;
  // final List<Doctors>? allDoctorsList;
  // final Function(String)? onChanged;
  @override
  State<SearchTextFormField> createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context
          .read<SearchCubit>()
          .searchTextEdtingcontroller, //widget.searchController, //searCharacterControler,
      cursorColor: MyColorsManager.morelighterGrey,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: MyColorsManager.morelighterGrey)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: MyColorsManager.morelighterGrey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: MyColorsManager.morelighterGrey)),
          filled: true,
          fillColor: MyColorsManager.morelighterGrey,
          prefixIcon: Icon(
            AntIcons.cameraFilled,
            color: MyColorsManager.black,
            size: 22.sp,
          ),
          suffixIcon: Icon(
            AntIcons.searchOutlined,
            color: MyColorsManager.black,
            size: 22.sp,
          ),
          hintText: 'Search',
          border: InputBorder.none,
          hintStyle: MyTextStyles.font16blackSemiBold),
      onChanged: (doctorName) {
        context.read<SearchCubit>().searchForProductWithName(doctorName);
      },
    );
  }

  // addSerchedforSerchedList(
  //     List? allDoctorsList, List? doctorsSearchList, String searchedCaracter) {
  //   doctorsSearchList = allDoctorsList
  //       ?.where((chararacter) =>
  //           chararacter.name.toLowerCase().startsWith(searchedCaracter))
  //       .toList();
  //   setState(() {});
  // }
}
