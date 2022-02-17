 import 'package:google_maps_flutter/google_maps_flutter.dart';
 import 'package:flutter/material.dart';


 class Map extends StatefulWidget {
    const Map({Key? key}) : super(key: key);

    @override
    _MapState createState() => _MapState();
 }

  class _MapState extends State<Map> {
    late GoogleMapController mapController;
    final LatLng _center = const LatLng(0.333754, 32.568383);
    void _onMapCreated(GoogleMapController controller) {
     mapController = controller;
    }
    static final CameraPosition _Wandegeya = CameraPosition(
    target: LatLng(0.3335, 32.5675),
    zoom: 14.4746,
  );

  static final Marker _WandegeyaMarker = Marker(
    markerId: MarkerId('_Wandegeya'),
    infoWindow: InfoWindow(title: 'Wandegeya'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(0.3335, 32.5675),
  );

    @override
    Widget build(BuildContext context) {
     return MaterialApp(
        debugShowCheckedModeBanner: false,
       home: Scaffold(
         appBar: AppBar(
            title: const Text('Locate your Gig'),
            backgroundColor: Colors.teal,
          ),
          body: GoogleMap(
            onMapCreated: _onMapCreated,
             markers: {
                 _WandegeyaMarker,
               },
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
        ),
      );
    }
  }
