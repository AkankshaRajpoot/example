import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:ui_x/helpers/ColorPalette.dart';

import '../../../../helpers/Global.dart';

class ImageSliderWidget extends StatelessWidget {
  const ImageSliderWidget({Key? key, this.length}) : super(key: key);

  final length;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ImageSlideshow(
        width: screen.width,
        isLoop: true,
        height: 150,
        initialPage: 0,
        indicatorRadius: 2,
        autoPlayInterval: 3000,
        indicatorColor: kcButton,
        indicatorBackgroundColor: kcWhite,
        children: [
          ...List.generate(length.length, (index) {
            var image = length[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                '${image.image}',
                fit: BoxFit.fill,
              ),
            );
          })
        ],
      ),
    );
  }
}
