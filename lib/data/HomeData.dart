import '../app/models/ApiResponse.dart';
import '../app/modules/Home/models/HomeSliderModel.dart';

class HomeData {
  /// Login Responses
  static ApiResponse get home => ApiResponse(
        status: "success",
        message: "Sliders are here.",
        data: {
          "top": List.generate(
              5,
              (index) => HomeSliderModel(
                    id: index++,
                    image: "https://random.imagecdn.app/500/150?v=$index",
                  ).toJson()),
          "bottom": List.generate(
              5,
              (index) => HomeSliderModel(
                    id: index++,
                    image: "https://random.imagecdn.app/500/150?v=$index",
                  ).toJson()),

          "slider": [
            {
              "id": 0,
              "image": "assets/placeholders/hotel-placeholder.png",
            },
            {
              "id": 1,
              "image": "assets/placeholders/hotel-placeholder.png",
            }, {
              "id": 1,
              "image": "assets/placeholders/hotel-placeholder.png",
            }
          ],

          "hotelNearYou" : [
            {
              "HotelName" : "Taj Hotel",
              "HotelLocation" : "Nagpur",
              "Price" : "999"
            }
          ]
        },
      );

  /// Home Responses
  static ApiResponse get homeData => ApiResponse(
    status: "success",
    message: "Sliders are here.",
    data: {
      "hotelNearYou" : [
        {
          "HotelName" : "Taj Hotel",
          "HotelLocation" : "Nagpur",
          "Price" : "999"
        },
        {
          "HotelName" : "Taj Hotel",
          "HotelLocation" : "Nagpur",
          "Price" : "999"
        },
        {
          "HotelName" : "Taj Hotel",
          "HotelLocation" : "Nagpur",
          "Price" : "999"
        },
      ],
      "dailyDeals" : [
        {
          "hotelName" : "Hotel Prince Viraj",
          "hotelLocation" : "Nagpur",
          "hotelReviews" : "86% users like Property's safety & hygiene",
          "discount" : "2500",
          "price" : "2000",
          "tax" : "95 taxes & fees for 1 room per night"
        },{
          "hotelName" : "Hotel Prince Viraj",
          "hotelLocation" : "Nagpur",
          "hotelReviews" : "86% users like Property's safety & hygiene",
          "discount" : "2500",
          "price" : "2000",
          "tax" : "95 taxes & fees for 1 room per night"
        },{
          "hotelName" : "Hotel Prince Viraj",
          "hotelLocation" : "Nagpur",
          "hotelReviews" : "86% users like Property's safety & hygiene",
          "discount" : "2500",
          "price" : "2000",
          "tax" : "95 taxes & fees for 1 room per night"
        },{
          "hotelName" : "Hotel Prince Viraj",
          "hotelLocation" : "Nagpur",
          "hotelReviews" : "86% users like Property's safety & hygiene",
          "discount" : "2500",
          "price" : "2000",
          "tax" : "95 taxes & fees for 1 room per night"
        },{
          "hotelName" : "Hotel Prince Viraj",
          "hotelLocation" : "Nagpur",
          "hotelReviews" : "86% users like Property's safety & hygiene",
          "discount" : "2500",
          "price" : "2000",
          "tax" : "95 taxes & fees for 1 room per night"
        },
      ],
      "recentSearch" : [
        {
          "district" : "Nagpur District",
          "country" : "India",
          "people" : "2 Adults",
          "duration" : "22 Mar- 24 Mar"
        },
        {
          "district" : "Nagpur District",
          "country" : "India",
          "people" : "2 Adults",
          "duration" : "22 Mar- 24 Mar"
        },
        {
          "district" : "Nagpur District",
          "country" : "India",
          "people" : "2 Adults",
          "duration" : "22 Mar- 24 Mar"
        },
        {
          "district" : "Nagpur District",
          "country" : "India",
          "people" : "2 Adults",
          "duration" : "22 Mar- 24 Mar"
        },
      ]
    },
  );
}
