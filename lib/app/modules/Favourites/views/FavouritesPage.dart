import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';

import '../models/FavouriteModel.dart';
import '../../../shared/views/errors/NotConnectedErrorPage.dart';
import '../../../shared/views/layouts/MasterLayout.dart';
import '../../../shared/views/layouts/ResponsiveUi.dart';
import '../../../shared/views/widgets/BottomNavbarWidget.dart';
import '../../Hotel/route/HotelRoutes.dart';
import '../controllers/FavouritesController.dart';
import '../shimmer/FavoriteShimmer.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouritesController>(
      init: FavouritesController(),
      builder: (FavouritesController controller) {
        return !controller.isConnected
            ? NotConnectedErrorPage()
            : ResponsiveUi(
                mobile: MobileFavourites(
                  controller: controller,
                ),
                tablet: TabletFavourites(
                  controller: controller,
                ),
              );
      },
    );
  }
}

///+++++++++++++++++++++++++
///Mobile
///+++++++++++++++++++++++++
class MobileFavourites extends StatelessWidget {
  const MobileFavourites({super.key, required this.controller});

  final FavouritesController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      title: "Favourites",
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: controller.isBusy
                  ? FavoriteShimmer()
                  : SingleChildScrollView(
                      // physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          children: [
                            ...List.generate(controller.favourite.length,
                                (index) {
                              FavouriteModel favourite =
                                  controller.favourite[index];
                              return InkWell(
                                onTap: () => Get.toNamed(HotelRoutes.hotelShow),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      color: kcWhite,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: kcDarkAlt.withOpacity(0.2),
                                            blurRadius: 3,
                                            spreadRadius: 2)
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          alignment: Alignment.topRight,
                                          height: 180,
                                          decoration: BoxDecoration(
                                              color: kcDarkAlt.withOpacity(0.1),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5)),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  "assets/placeholders/hotel-placeholder.png",
                                                ),
                                                fit: BoxFit.contain,
                                              )),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: kcBlack.withOpacity(0.1),
                                                shape: BoxShape.circle),
                                            child: Image.asset(
                                              'assets/icons/favorite_filled.png',
                                              color: kcDanger,
                                              width: 18,
                                              height: 18,
                                              // color: kcButton,
                                            ),
                                          )),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${favourite.hotelName}",
                                              style: TextStyl.bodySm?.copyWith(
                                                  fontSize: 16,
                                                  color:
                                                      kcBlack.withOpacity(0.8),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.star,
                                                          color: kcWarning
                                                              .withOpacity(0.8),
                                                          size: 14,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: kcWarning
                                                              .withOpacity(0.8),
                                                          size: 14,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: kcWarning
                                                              .withOpacity(0.8),
                                                          size: 14,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: kcGray,
                                                          size: 14,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: kcGray,
                                                          size: 14,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                            Icons.location_pin),
                                                        Text(
                                                          "${favourite.location}",
                                                          style: TextStyl.bodySm
                                                              ?.copyWith(
                                                                  fontSize: 15),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 6,
                                                              vertical: 2),
                                                      decoration: BoxDecoration(
                                                          color: kcDanger,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Text(
                                                        "20% Off",
                                                        style: TextStyl.title
                                                            ?.copyWith(
                                                                color: kcWhite,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 12),
                                                      ),
                                                    ),

                                                    SizedBox(
                                                      height: 5,
                                                    ),

                                                    Row(
                                                      children: [
                                                        Text(
                                                          "₹ ${favourite.price}",
                                                          style: TextStyle(
                                                            color: kcDarkAlt,
                                                            fontSize: 12,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            // decorationColor: Colors.red,
                                                          ),
                                                        ),
                                                        Text(
                                                          "₹${favourite.price}",
                                                          style: TextStyl.bodySm
                                                              ?.copyWith(
                                                            color: kcBlack,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // Text(
                                                    //   "+ ₹ ${favourite.tax}",
                                                    //   style: TextStyl.bodySm
                                                    //       ?.copyWith(color: kcDarkAlt,
                                                    //       fontWeight: FontWeight.bold, fontSize: 12),
                                                    // ),
                                                    // SizedBox(height: 2),
                                                    // Text(
                                                    //   "${favourite.duration}",
                                                    //   style: TextStyle(
                                                    //     color: kcButton,
                                                    //     fontSize: 10,
                                                    //   ),
                                                    // ),
                                                    SizedBox(height: 2),
                                                    Text(
                                                      "${favourite.detail}",
                                                      style: TextStyle(
                                                        color: kcBlack
                                                            .withOpacity(0.6),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                    ),
            ),
            BottomNavbarWidget(
              route: 'favorites',
            ),
          ],
        ),
      ),
    );
  }
}

///+++++++++++++++++++++++++
///Tablet
///+++++++++++++++++++++++++
class TabletFavourites extends StatelessWidget {
  const TabletFavourites({super.key, required this.controller});

  final FavouritesController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      title: "Favourites",
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: controller.isBusy
                  ? FavoriteShimmer()
                  : SingleChildScrollView(
                      // physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          children: [
                            ...List.generate(controller.favourite.length,
                                (index) {
                              FavouriteModel favourite =
                                  controller.favourite[index];
                              return InkWell(
                                onTap: () => Get.toNamed(HotelRoutes.hotelShow),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      color: kcWhite,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: kcDarkAlt.withOpacity(0.2),
                                            blurRadius: 3,
                                            spreadRadius: 2)
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          alignment: Alignment.topRight,
                                          height: 180,
                                          decoration: BoxDecoration(
                                              color: kcDarkAlt.withOpacity(0.1),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5)),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  "assets/placeholders/hotel-placeholder.png",
                                                ),
                                                fit: BoxFit.contain,
                                              )),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: kcBlack.withOpacity(0.1),
                                                shape: BoxShape.circle),
                                            child: Image.asset(
                                              'assets/icons/favorite_filled.png',
                                              color: kcDanger,
                                              width: 18,
                                              height: 18,
                                              // color: kcButton,
                                            ),
                                          )),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${favourite.hotelName}",
                                              style: TextStyl.bodySm?.copyWith(
                                                  fontSize: 16,
                                                  color:
                                                      kcBlack.withOpacity(0.8),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.star,
                                                          color: kcWarning
                                                              .withOpacity(0.8),
                                                          size: 14,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: kcWarning
                                                              .withOpacity(0.8),
                                                          size: 14,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: kcWarning
                                                              .withOpacity(0.8),
                                                          size: 14,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: kcGray,
                                                          size: 14,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: kcGray,
                                                          size: 14,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                            Icons.location_pin),
                                                        Text(
                                                          "${favourite.location}",
                                                          style: TextStyl.bodySm
                                                              ?.copyWith(
                                                                  fontSize: 15),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 6,
                                                              vertical: 2),
                                                      decoration: BoxDecoration(
                                                          color: kcDanger,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Text(
                                                        "20% Off",
                                                        style: TextStyl.title
                                                            ?.copyWith(
                                                                color: kcWhite,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 12),
                                                      ),
                                                    ),

                                                    SizedBox(
                                                      height: 5,
                                                    ),

                                                    Row(
                                                      children: [
                                                        Text(
                                                          "₹ ${favourite.price}",
                                                          style: TextStyle(
                                                            color: kcDarkAlt,
                                                            fontSize: 12,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            // decorationColor: Colors.red,
                                                          ),
                                                        ),
                                                        Text(
                                                          "₹${favourite.price}",
                                                          style: TextStyl.bodySm
                                                              ?.copyWith(
                                                            color: kcBlack,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // Text(
                                                    //   "+ ₹ ${favourite.tax}",
                                                    //   style: TextStyl.bodySm
                                                    //       ?.copyWith(color: kcDarkAlt,
                                                    //       fontWeight: FontWeight.bold, fontSize: 12),
                                                    // ),
                                                    // SizedBox(height: 2),
                                                    // Text(
                                                    //   "${favourite.duration}",
                                                    //   style: TextStyle(
                                                    //     color: kcButton,
                                                    //     fontSize: 10,
                                                    //   ),
                                                    // ),
                                                    SizedBox(height: 2),
                                                    Text(
                                                      "${favourite.detail}",
                                                      style: TextStyle(
                                                        color: kcBlack
                                                            .withOpacity(0.6),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                    ),
            ),
            BottomNavbarWidget(
              route: 'favorites',
            ),
          ],
        ),
      ),
    );
  }
}
