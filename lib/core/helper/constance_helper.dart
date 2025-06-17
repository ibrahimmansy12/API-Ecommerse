// core/helper/constance_helper.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SharedPrefranceKeys {
  static String userToken = "UserToken";
}

bool isLogedInUser = false;
TabController? homeTabController;
  TabController? seeAllTabController;
String cartBox = "CartBox";
late Box cartBoxbox;
String favoritestBox = "favoritestBox";
late Box favoritestBoxbox;