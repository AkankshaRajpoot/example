import 'package:vishrampoint/app/models/ApiResponse.dart';

class Favourites{
  static ApiResponse get favourite => ApiResponse(
    status: "success",
    message: "Sliders are here.",
     data: {
      "favourite": [
        {
          "hotelName" : "Hotel Shivani Palace",
          "location" : "Seoni",
          "discountPercent" : "17% off",
          "price" : "2500",
          "discountPrice" : "1999",
          "tax" : "95 taxes & fees",
          "duration" : "For 24-25 Mar 23",
          "detail" : "Per Room Per Night",
        },
        {
          "hotelName" : "Hotel Shivani Palace",
          "location" : "Seoni",
          "discountPercent" : "17% off",
          "price" : "2500",
          "discountPrice" : "1999",
          "tax" : "95 taxes & fees",
          "duration" : "For 24-25 Mar 23",
          "detail" : "Per Room Per Night",
        },
        {
          "hotelName" : "Hotel Shivani Palace",
          "location" : "Seoni",
          "discountPercent" : "17% off",
          "price" : "2500",
          "discountPrice" : "1999",
          "tax" : "95 taxes & fees",
          "duration" : "For 24-25 Mar 23",
          "detail" : "Per Room Per Night",
        },
        {
          "hotelName" : "Hotel Shivani Palace",
          "location" : "Seoni",
          "discountPercent" : "17% off",
          "price" : "2500",
          "discountPrice" : "1999",
          "tax" : "95 taxes & fees",
          "duration" : "For 24-25 Mar 23",
          "detail" : "Per Room Per Night",
        },
      ]
     }
  );
}