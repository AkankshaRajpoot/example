import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';

import '../../../../helpers/Global.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: kcWhite,borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15, vertical: 12),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisAlignment:
              MainAxisAlignment.start,
              children: [
                Text(
                  "Ratings & Review",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color:
                      kcBlack.withOpacity(0.8)),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .center,
                          mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                          children: [
                            Text(
                              "4.2",
                              style: TextStyle(
                                  color: kcBlack,
                                  fontSize: 25),
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: kcGreen,
                            ),
                          ],
                        ),
                        Text(
                          "Verified Guests",
                          style: TextStyle(
                              color: kcDarkAlt,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    Container(
                      color: kcGray,
                      height: 140,
                      width: 0.3,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "5",
                              style: TextStyle(
                                  color: kcBlack,
                                  fontSize: 12,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                            ),
                            Icon(
                              Icons.star,
                              size: 12,
                            ),
                            LinearPercentIndicator(
                              backgroundColor:
                              kcOffWhite,
                              linearStrokeCap:
                              LinearStrokeCap
                                  .roundAll,
                              width: 130.0,
                              lineHeight: 4.0,
                              percent: 0.8,
                              progressColor:
                              kcDarkAlt,
                            ),
                            Text(
                              "10",
                              style: TextStyle(
                                  color: kcDarkAlt,
                                  fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              "4",
                              style: TextStyle(
                                  color: kcBlack,
                                  fontSize: 12,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                            ),
                            Icon(
                              Icons.star,
                              size: 12,
                            ),
                            LinearPercentIndicator(
                              backgroundColor:
                              kcOffWhite,
                              linearStrokeCap:
                              LinearStrokeCap
                                  .roundAll,
                              width: 130.0,
                              lineHeight: 4.0,
                              percent: 0.4,
                              progressColor: kcDarkAlt,
                            ),
                            Text(
                              "14",
                              style: TextStyle(
                                  color: kcDarkAlt,
                                  fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              "3",
                              style: TextStyle(
                                  color: kcBlack,
                                  fontSize: 12,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                            ),
                            Icon(
                              Icons.star,
                              size: 12,
                            ),
                            LinearPercentIndicator(
                              backgroundColor:
                              kcOffWhite,
                              linearStrokeCap:
                              LinearStrokeCap
                                  .roundAll,
                              width: 130.0,
                              lineHeight: 4.0,
                              percent: 0.3,
                              progressColor:
                              kcDarkAlt,
                            ),
                            Text(
                              "15",
                              style: TextStyle(
                                  color: kcDarkAlt,
                                  fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              "2",
                              style: TextStyle(
                                  color: kcBlack,
                                  fontSize: 12,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                            ),
                            Icon(
                              Icons.star,
                              size: 12,
                            ),
                            LinearPercentIndicator(
                              backgroundColor:
                              kcOffWhite,
                              linearStrokeCap:
                              LinearStrokeCap
                                  .roundAll,
                              width: 130.0,
                              lineHeight: 4.0,
                              percent: 0.2,
                              progressColor:
                              kcDarkAlt,
                            ),
                            Text(
                              "5",
                              style: TextStyle(
                                  color: kcDarkAlt,
                                  fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              "1",
                              style: TextStyle(
                                  color: kcBlack,
                                  fontSize: 12,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                            ),
                            Icon(
                              Icons.star,
                              size: 12,
                            ),
                            LinearPercentIndicator(
                              backgroundColor:
                              kcOffWhite,
                              linearStrokeCap:
                              LinearStrokeCap
                                  .roundAll,
                              width: 130.0,
                              lineHeight: 4.0,
                              percent: 0.1,
                              progressColor:
                              kcDarkAlt,
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                  color: kcDarkAlt,
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: kcGray,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Customer Reviews (25)",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color:
                      kcBlack.withOpacity(0.8)),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: screen.width,
          decoration: BoxDecoration(
            color: kcWhite,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Mayank Sarathe",
                  style: TextStyl.bodySm?.copyWith(color: kcBlack.withOpacity(0.8), fontWeight: FontWeight.bold)
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Best place in seoni to stay",
                    style: TextStyl.bodySm?.copyWith(color:kcDarkAlt)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
