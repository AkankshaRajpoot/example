import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:ui_x/helpers/ColorPalette.dart';

import '../../../helpers/Global.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      width: screen.width,
                      height: 50,
                      decoration: BoxDecoration(color: kcOffWhite, borderRadius: BorderRadius.circular(4), boxShadow: [
                        BoxShadow(
                          color: kcDarkAlt.withOpacity(0.4),
                          blurRadius: 1,
                        ),
                      ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 15,
                                      color: kcGray.withOpacity(0.5),
                                    ),
                                    SizedBox(height: 6),
                                    Container(
                                      width: 50,
                                      height: 12,
                                      color: kcGray.withOpacity(0.5),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 170,
                                      height: 18,
                                      color: kcGray.withOpacity(0.5),
                                    ),
                                    SizedBox(height: 6),
                                    Container(
                                      width: 140,
                                      height: 12,
                                      color: kcGray.withOpacity(0.5),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
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
                    SizedBox(height: 10),
                    Container(
                      width: screen.width,
                      height: screen.height * 0.2,
                      decoration: BoxDecoration(color: kcOffWhite, borderRadius: BorderRadius.circular(4), boxShadow: [
                        BoxShadow(
                          color: kcDarkAlt.withOpacity(0.4),
                          blurRadius: 1,
                        ),
                      ]),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: screen.width,
                      height: screen.height * 0.3,
                      decoration: BoxDecoration(color: kcOffWhite, borderRadius: BorderRadius.circular(4), boxShadow: [
                        BoxShadow(
                          color: kcDarkAlt.withOpacity(0.4),
                          blurRadius: 1,
                        ),
                      ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 12,
                            color: kcGray.withOpacity(0.5),
                          ),
                          SizedBox(height: 6),
                          Container(
                            width: 100,
                            height: 18,
                            color: kcGray.withOpacity(0.5),
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 120,
                                    height: 18,
                                    color: kcGray.withOpacity(0.5),
                                  ),
                                  SizedBox(height: 6),
                                  Container(
                                    width: 60,
                                    height: 12,
                                    color: kcGray.withOpacity(0.5),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 18,
                                    color: kcGray.withOpacity(0.5),
                                  ),
                                  SizedBox(height: 6),
                                  Container(
                                    width: 120,
                                    height: 12,
                                    color: kcGray.withOpacity(0.5),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Container(
                            width: 180,
                            height: 12,
                            color: kcGray.withOpacity(0.5),
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: kcGray.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: kcGray.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: screen.width,
                      height: screen.height * 0.3,
                      decoration: BoxDecoration(color: kcOffWhite, borderRadius: BorderRadius.circular(4), boxShadow: [
                        BoxShadow(
                          color: kcDarkAlt.withOpacity(0.4),
                          blurRadius: 1,
                        ),
                      ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 120,
                              height: 18,
                              color: kcGray.withOpacity(0.5),
                            ),
                            SizedBox(height: 12),
                            SingleChildScrollView( scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Container(
                                    width: 180,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: kcGray.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Container(
                                    width: 180,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: kcGray.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Container(
                                    width: 180,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: kcGray.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
