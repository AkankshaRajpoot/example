import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import '../../../helpers/Global.dart';

class FavoriteShimmer extends StatelessWidget {
  const FavoriteShimmer({Key? key}) : super(key: key);

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
                   padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                   child: Column(
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
                       SizedBox(height: 12),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Container(
                                 width: 130,
                                 height: 18,
                                 color: kcGray.withOpacity(0.5),
                               ),
                               SizedBox(height: 5),
                               Container(
                                 width: 80,
                                 height: 12,
                                 color: kcGray.withOpacity(0.5),
                               ),
                               SizedBox(height: 5),
                               Container(
                                 width: 60,
                                 height: 12,
                                 color: kcGray.withOpacity(0.5),
                               ),
                               SizedBox(height: 5),
                             ],
                           ),
                           Spacer(),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               Container(
                                 width: 90,
                                 height: 15,
                                 color: kcGray.withOpacity(0.5),
                               ),
                               SizedBox(height: 5),
                               Container(
                                 width: 70,
                                 height: 18,
                                 color: kcGray.withOpacity(0.5),
                               ),
                               SizedBox(height: 4),
                               Container(
                                 width: 110,
                                 height: 12,
                                 color: kcGray.withOpacity(0.5),
                               ),
                               SizedBox(height: 4),
                               Container(
                                 width: 100,
                                 height: 12,
                                 color: kcGray.withOpacity(0.5),
                               ),
                               SizedBox(height: 4),
                               Container(
                                 width: 100,
                                 height: 12,
                                 color: kcGray.withOpacity(0.5),
                               ),
                             ],
                           ),
                         ],
                       ),
                       SizedBox(height: 25),
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
                       SizedBox(height: 12),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Container(
                                 width: 130,
                                 height: 18,
                                 color: kcGray.withOpacity(0.5),
                               ),
                               SizedBox(height: 5),
                               Container(
                                 width: 80,
                                 height: 12,
                                 color: kcGray.withOpacity(0.5),
                               ),
                               SizedBox(height: 5),
                               Container(
                                 width: 60,
                                 height: 12,
                                 color: kcGray.withOpacity(0.5),
                               ),
                               SizedBox(height: 5),
                             ],
                           ),
                           Spacer(),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               Container(
                                 width: 90,
                                 height: 15,
                                 color: kcGray.withOpacity(0.5),
                               ),
                               SizedBox(height: 5),
                               Container(
                                 width: 70,
                                 height: 18,
                                 color: kcGray.withOpacity(0.5),
                               ),
                               SizedBox(height: 4),
                               Container(
                                 width: 110,
                                 height: 12,
                                 color: kcGray.withOpacity(0.5),
                               ),
                               SizedBox(height: 4),
                               Container(
                                 width: 100,
                                 height: 12,
                                 color: kcGray.withOpacity(0.5),
                               ),
                               SizedBox(height: 4),
                               Container(
                                 width: 100,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}