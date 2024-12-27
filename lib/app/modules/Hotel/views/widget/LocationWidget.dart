import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:vishrampoint/app/helpers/Global.dart';
import 'package:vishrampoint/app/modules/Home/controllers/HomeController.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (HomeController controller) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: screen.width,
              decoration: BoxDecoration(color: kcWhite, borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'This Place is located in',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: kcBlack.withOpacity(0.8)),
                  ),
                  Divider(),
                  SizedBox(
                    height: 150,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GoogleMap(
                          myLocationEnabled: true,
                          zoomGesturesEnabled: false,
                          myLocationButtonEnabled: false,
                          zoomControlsEnabled: false,
                          mapType: MapType.normal,
                          onMapCreated: controller.onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(22.1134138, 79.5385051
                                // double.parse(controller.templateData.coordinate!.lat!),
                                // double.parse(controller.templateData.coordinate!.lon!),
                                ),
                            zoom: 15,
                          ),
                          // markers: controller.markers,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Seoni, Madhya Pradesh",
                    style: TextStyl.bodySm?.copyWith(),
                  )
                ],
              ),
            ),
          );
        });
  }
}
