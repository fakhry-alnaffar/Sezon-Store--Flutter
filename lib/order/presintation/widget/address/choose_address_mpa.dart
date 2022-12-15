import 'package:camel_express_user/order/data/entity/address/address.dart';
import 'package:camel_express_user/order/domain/model/location_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/helpers/app_colors.dart';
import '../../../../core/helpers/text_style.dart';
import '../../screen/address/map_screen.dart';

class ChooseAddressMap extends StatefulWidget {
  ChooseAddressMap({
    Key? key,
    required this.address,
    required this.onAddressSelected,
  }) : super(key: key);
  final String address;
  final Function(LocationModel location) onAddressSelected;

  @override
  State<ChooseAddressMap> createState() => _ChooseAddressMapState();
}

class _ChooseAddressMapState extends State<ChooseAddressMap> {
  LatLng? currentLocation;
  bool loading = true;

  @override
  void initState() {
    _determinePosition().then(
      (value) => setState(
        () {
          currentLocation = LatLng(value.latitude, value.longitude);
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      width: double.infinity.w,
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 6,
            offset: Offset(0, 3.h),
          ),
        ],
    ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(
              top: 16.h,
              bottom: 11.h,
            ),
            width: double.infinity.w,
            height: 128.h,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: loading
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
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      zoom: 10,
                      target: LatLng(
                        currentLocation!.latitude,
                        currentLocation!.longitude,
                      ),
                    ),
                  ),
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/svg_images/Location.svg',
                width: 13.w,
                height: 17.h,
              ),
              SizedBox(
                width: 6.w,
              ),
              Text(
                widget.address,
                style: GoogleFonts.poppins(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.sameGrey,
                ),
              ),
              const Spacer(),
              TextButton(
                style: AppTextStyle.textButtonStyle,
                onPressed: () async {
                  var location = await Get.to<LatLng>(() => const MapScreen());
                  setState(() => currentLocation = location);
                  widget.onAddressSelected(
                    LocationModel(
                      lat: location!.latitude.toString(),
                      long: location.longitude.toString(),
                    ),
                  );
                },
                child: Text(
                  'Edit Address',
                  style: GoogleFonts.poppins(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
