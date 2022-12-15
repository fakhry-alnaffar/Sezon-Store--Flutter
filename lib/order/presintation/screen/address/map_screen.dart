import 'package:camel_express_user/core/helpers/app_colors.dart';
import 'package:camel_express_user/order/presintation/getx/controller/address/address_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Position? currentLocation;
  bool loading = true;
  Set<Marker> markers = {};


  @override
  void initState() {
    _determinePosition().then(
      (value) => setState(
        () {
          currentLocation = value;
          markers = Get.find<AddressGetXController>().getMarkers();
          loading = false;
        },
      ),
    );
    super.initState();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines``
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            )
          : GoogleMap(
              zoomControlsEnabled: true,
              myLocationButtonEnabled: true,
              buildingsEnabled: true,
              myLocationEnabled: true,
              tiltGesturesEnabled: true,
              markers: markers,
              mapType: MapType.normal,
              onTap: (value) {
                setState(() {
                  markers.add(Marker(markerId: MarkerId(value.latitude.toString()), position: value));
                  Future.delayed(const Duration(milliseconds: 100),() => Get.back<LatLng>(result: value),);
                });
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(currentLocation!.latitude, currentLocation!.longitude),
                zoom: 14.4746,
              ),
            ),
    );
  }
}
