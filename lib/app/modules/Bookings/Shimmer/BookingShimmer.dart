import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import '../../../helpers/Global.dart';

class BookingShimmer extends StatelessWidget {
  const BookingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        width: screen.width,
        height: screen.height,
        child: Shimmer(
          duration: Duration(seconds: 3),
          interval: Duration(seconds: 5),
          color: kcWhite,
          colorOpacity: 0,
          enabled: true,
          direction: ShimmerDirection.fromLTRB(),
          child: Container(
            color: kcWhite,
            width: screen.width,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 95,
                        height: 18,
                        color: kcGray.withOpacity(0.5),
                      ),
                      Container(
                        width: 95,
                        height: 18,
                        color: kcGray.withOpacity(0.5),
                      ),
                      Container(
                        width: 95,
                        height: 18,
                        color: kcGray.withOpacity(0.5),
                      ),
                    ],
                  ),
                    SizedBox(height: 15),
                    Column(
                      children: [
                        Container(
                          width: 75,
                          height: 75,
                          color: kcGray.withOpacity(0.5),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: 200,
                          height: 18,
                          color: kcGray.withOpacity(0.5),
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: 160,
                          height: 12,
                          color: kcGray.withOpacity(0.5),
                        ),
                        SizedBox(height: 26),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              color: kcGray.withOpacity(0.5),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 180,
                                  height: 18,
                                  color: kcGray.withOpacity(0.5),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: 130,
                                  height: 18,
                                  color: kcGray.withOpacity(0.5),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: 220,
                                  height: 12,
                                  color: kcGray.withOpacity(0.5),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: 50,
                                  height: 12,
                                  color: kcGray.withOpacity(0.5),
                                ),
                              ],
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              color: kcGray.withOpacity(0.5),
                            ),],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              color: kcGray.withOpacity(0.5),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 180,
                                  height: 18,
                                  color: kcGray.withOpacity(0.5),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: 220,
                                  height: 12,
                                  color: kcGray.withOpacity(0.5),
                                ),
                              ],
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              color: kcGray.withOpacity(0.5),
                            ),],
                        ),
                      ],
                    ),
                    SizedBox(height: 55),
                    Column(
                      children: [
                        Container(
                          width: 180,
                          height: 12,
                          color: kcGray.withOpacity(0.5),
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: 100,
                          height: 18,
                          color: kcGray.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}