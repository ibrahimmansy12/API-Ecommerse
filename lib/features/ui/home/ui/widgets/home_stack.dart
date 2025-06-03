// features/ui/home/ui/widgets/home_stack.dart

import 'package:apiecommerse/core/helper/spacing.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/tap_bar_bloc_builder.dart';
import 'package:flutter/material.dart';

// Widget homeStack(TabController tabController) {
//   return HomeStack();
// }

class HomeStack extends StatelessWidget {
  const HomeStack({
    super.key, this.tabController,
  });
final TabController? tabController;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          
          width: double.infinity,
          child: Image.asset(
            "assets/images/home back.png",
            fit: BoxFit.cover,
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          verticalSpace(6),
          Text(" The Collection \n  In The Market ",
              style: MyTextStyles.font26whitesemBold),
          //Text(" Collection", style: MyTextStyles.font26whitesemBold),
          tapBarBlocBuilder(tabController!),
        ])
        // Column(
      ],
    );
  }
}
