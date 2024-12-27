import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:ui_x/helpers/ColorPalette.dart';

import '../../../helpers/Global.dart';

class HotelShimmer extends StatelessWidget {
  const HotelShimmer({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 175,
                      width: screen.width,
                      decoration: BoxDecoration(color: kcOffWhite, borderRadius: BorderRadius.circular(4), boxShadow: [
                        BoxShadow(
                          color: kcDarkAlt.withOpacity(0.4),
                          blurRadius: 1,
                        ),
                      ]),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 15,
                          width: 35,
                          decoration: BoxDecoration(color: kcGray.withOpacity(0.5), borderRadius: BorderRadius.circular(4), boxShadow: [
                          ]),
                        ),
                        SizedBox(width: 6),
                        Container(
                          width: 140,
                          height: 15,
                          color: kcGray.withOpacity(0.5),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: 80,
                      height: 18,
                      color: kcGray.withOpacity(0.5),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: 60,
                      height: 12,
                      color: kcGray.withOpacity(0.5),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 130,
                              height: 12,
                              color: kcGray.withOpacity(0.5),
                            ),
                            SizedBox(height: 12),
                            Container(
                              height: 18,
                              width: 60,
                              decoration: BoxDecoration(color: kcGray.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 50,
                              height: 12,
                              color: kcGray.withOpacity(0.5),
                            ),
                            SizedBox(height: 5),
                            Container(
                              height: 18,
                              width: 65,
                              decoration: BoxDecoration(color: kcGray.withOpacity(0.5),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: 120,
                              height: 12,
                              color: kcGray.withOpacity(0.5),
                            ),
                            SizedBox(height: 5),
                            Container(
                              height: 12,
                              width: 80,
                              decoration: BoxDecoration(color: kcGray.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(color: kcGray.withOpacity(0.5), borderRadius: BorderRadius.circular(50),
                             ),
                        ),
                      ],
                    ),
                    SizedBox(height: 38),
                    Container(
                      height: 175,
                      width: screen.width,
                      decoration: BoxDecoration(color: kcOffWhite, borderRadius: BorderRadius.circular(4), boxShadow: [
                        BoxShadow(
                          color: kcDarkAlt.withOpacity(0.4),
                          blurRadius: 1,
                        ),
                      ]),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 15,
                          width: 35,
                          decoration: BoxDecoration(color: kcGray.withOpacity(0.5), borderRadius: BorderRadius.circular(4), boxShadow: [
                          ]),
                        ),
                        SizedBox(width: 6),
                        Container(
                          width: 140,
                          height: 15,
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