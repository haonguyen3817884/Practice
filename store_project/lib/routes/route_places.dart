import 'package:get/get.dart';
import "package:store_project/routes/route_name.dart";
import "package:store_project/screens/ageScreen/age_screen.dart";

import "package:store_project/screens/placeScreen/place_screen.dart";

import "package:store_project/screens/confirmScreen/confirm_screen.dart";

class RoutePlaces {
  static List<GetPage> places = <GetPage>[
    GetPage(
        name: RouteName.agePlace,
        page: () => AgeScreen(),
        binding: AgeScreenBinding()),
    GetPage(
        name: RouteName.placePlace,
        page: () => PlaceScreen(),
        binding: PlaceScreenBinding()),
    GetPage(
        name: RouteName.confirmPlace,
        page: () => ConfirmScreen(),
        binding: ConfirmScreenBinding())
  ];
}
