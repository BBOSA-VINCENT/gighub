import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gighub/location.dart';
import 'package:gighub/mainAppPage.dart';
import 'package:gighub/gig_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
   Completer<GoogleMapController> _controller = Completer();
   TextEditingController _searchController = TextEditingController();


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

  // static final CameraPosition _Muk = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(0.3338, 32.5684),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  // static final Marker _MukMarker = Marker(
  //   markerId: MarkerId('_MukMarker'),
  //   infoWindow: InfoWindow(title: 'Makerere University'),
  //   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //   position: LatLng(0.3338, 32.5684),
  // );


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Locate Your Gig'),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          },
        ),
      ),
      body: Column(
        children: [
           Row(
             children: [
               Expanded(
                   child: TextFormField(
                 controller: _searchController,
                 textCapitalization: TextCapitalization.words,
                 decoration: InputDecoration(hintText: 'Search by place'),
                 onChanged: (value) {
                   print(value);
                 },
               )),
               IconButton(
                 onPressed: () async{
                  var place=
                    await LocationService().getPlace(_searchController.text);
                    _goToPlace(place);
                 },
                 icon: Icon(Icons.search,
                 ),
               ),
             ],
           ),
          Expanded(
            child:
             GoogleMap(
              mapType: MapType.normal,
               markers: {
                 _WandegeyaMarker,
               },
            
              initialCameraPosition: _Wandegeya,
               onMapCreated: (GoogleMapController controller) {
                 _controller.complete(controller);
               },
            ),
          ),

          //  floatingActionButton: FloatingActionButton.extended(
          //    onPressed: _findYourGig,
          //    label: Text('Makerere University'),
          //    icon: Icon(Icons.school),
        ],
      ),
    );
  }


  Future<void> _goToPlace(Map<String, dynamic> place) async {

    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];
     final GoogleMapController controller = await _controller.future;
     controller.animateCamera(
       CameraUpdate.newCameraPosition(
       CameraPosition(target: LatLng(lat,lng),
       zoom: 12
       ),
       )
     );
   }

    Future<void> _findYourGig() async {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(_Wandegeya));
    }
 }

