import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/ColorPalette.dart';

import '../../../helpers/Global.dart';
import '../../../modules/Modules.dart';
import 'ExitPopup.dart';

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({Key? key, required this.route}) : super(key: key);
  final String route;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: kcWhite,

      height: 65,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.offAllNamed(HomeRoutes.home);
              },
              child: route == "home"
                  ? Container(
                height: screen.height * 0.42,
                width: screen.width * 0.50,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: kcButton.withOpacity(0.06)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/stay.png',
                      width: 22,
                      height: 22,
                      color: kcButton,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
                  : Container(
                height: screen.height * 0.42,
                width: screen.width * 0.15,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kcOffWhite.withOpacity(0.5),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/stay.png',
                      color: kcBlack.withOpacity(0.5),
                      width: 22,
                      height: 22,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.offAllNamed(FavouritesRoutes.favourites);
              },
              child: route == "favorites"
                  ? Container(
                height: screen.height * 0.42,
                width: screen.width * 0.50,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: kcButton.withOpacity(0.06)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/favorite_filled.png',
                      width: 22,
                      height: 22,
                      color: kcButton,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Favourite",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
                  : Container(
                height: screen.height * 0.42,
                width: screen.width * 0.15,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kcOffWhite.withOpacity(0.5),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/favorite_filled.png',
                      width: 22,
                      height: 22,
                      color: kcBlack.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.offAllNamed(BookingsRoutes.bookings);
              },
              child: route == "bookings"
                  ? Container(
                height: screen.height * 0.42,
                width: screen.width * 0.50,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: kcButton.withOpacity(0.06)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/booking_filled.png',
                      color: kcButton,
                      width: 22,
                      height: 22,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Booking",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
                  : Container(
                height: screen.height * 0.42,
                width: screen.width * 0.15,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kcOffWhite.withOpacity(0.5),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/booking_filled.png',
                      color: kcBlack.withOpacity(0.5),
                      width: 22,
                      height: 22,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



