import 'dart:async';
import 'models/atm_location_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:m_s_application/core/app_export.dart';
import 'provider/atm_location_provider.dart';

class AtmLocationScreen extends StatefulWidget {
  const AtmLocationScreen({Key? key}) : super(key: key);

  @override
  AtmLocationScreenState createState() => AtmLocationScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AtmLocationProvider(), child: AtmLocationScreen());
  }
}

// ignore_for_file: must_be_immutable
class AtmLocationScreenState extends State<AtmLocationScreen> {
  Completer<GoogleMapController> googleMapController = Completer();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: _buildAtmLocation(context)));
  }

  /// Section Widget
  Widget _buildAtmLocation(BuildContext context) {
    return SizedBox(
        height: 768.v,
        width: double.maxFinite,
        child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
                target: LatLng(37.43296265331129, -122.08832357078792),
                zoom: 14.4746),
            onMapCreated: (GoogleMapController controller) {
              googleMapController.complete(controller);
            },
            zoomControlsEnabled: false,
            zoomGesturesEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: false));
  }
}
