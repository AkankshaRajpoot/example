import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import '../../../helpers/Global.dart';

class HotelShowShimmer extends StatelessWidget {
  const HotelShowShimmer({Key? key}) : super(key: key);

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: SingleChildScrollView( scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            height: 200,
                            width: 280,
                            decoration: BoxDecoration(color: kcOffWhite, boxShadow: [
                              BoxShadow(
                                color: kcDarkAlt.withOpacity(0.4),
                                blurRadius: 1,
                              ),
                            ]
                            ),
                          ),
                          SizedBox(width: 6),
                          Container(
                            height: 200,
                            width: 280,
                            decoration: BoxDecoration(color: kcOffWhite, boxShadow: [
                              BoxShadow(
                                color: kcDarkAlt.withOpacity(0.4),
                                blurRadius: 1,
                              ),
                            ]
                            ),
                          ),
                          SizedBox(width: 6),
                          Container(
                            height: 200,
                            width: 280,
                            decoration: BoxDecoration(color: kcOffWhite, boxShadow: [
                              BoxShadow(
                                color: kcDarkAlt.withOpacity(0.4),
                                blurRadius: 1,
                              ),
                            ]
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 80,
                        height: 18,
                        color: kcGray.withOpacity(0.5),
                      ),
                      Container(
                        width: 80,
                        height: 18,
                        color: kcGray.withOpacity(0.5),
                      ),
                      Container(
                        width: 70,
                        height: 18,
                        color: kcGray.withOpacity(0.5),
                      ),
                      Container(
                        width: 70,
                        height: 18,
                        color: kcGray.withOpacity(0.5),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 15),
                    child: Container(
                      height: 240,
                      width: screen.width,
                      decoration: BoxDecoration(color: kcOffWhite, boxShadow: [
                        BoxShadow(
                          color: kcDarkAlt.withOpacity(0.4),
                          blurRadius: 1,
                        ),]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Column(
                          children: [
                            Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 12,
                                width: 70,
                                color: kcGray.withOpacity(0.5),
                              ),
                              SizedBox(width: 8),
                              Container(
                                height: 12,
                                width: 45,
                                color: kcGray.withOpacity(0.5),
                              ),
                              SizedBox(width: 8),
                              Container(
                                height: 12,
                                width: 50,
                                color: kcGray.withOpacity(0.5),
                              ),
                            ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 18,
                                    width: 160,
                                    color: kcGray.withOpacity(0.5),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    height: 12,
                                    width: 120,
                                    color: kcGray.withOpacity(0.5),
                                  ),
                                ],
                                ),
                              ],
                            ),
                            SizedBox(height: 35),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 12,
                                  width: 160,
                                  color: kcGray.withOpacity(0.5),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        color: kcGray.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 52),
                            Row(
                              children: [
                                Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 12,
                                      color: kcGray.withOpacity(0.5),
                                    ),
                                    SizedBox(height: 6),
                                    Container(
                                      width: 220,
                                      height: 12,
                                      color: kcGray.withOpacity(0.5),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      height: 150,
                      width: screen.width,
                      decoration: BoxDecoration(color: kcOffWhite, boxShadow: [
                        BoxShadow(
                          color: kcDarkAlt.withOpacity(0.4),
                          blurRadius: 1,
                        ),
                      ]
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}