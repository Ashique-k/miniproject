import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:miniproject/screens/const.dart';





class Map_page extends StatefulWidget {
  const Map_page({super.key});

  @override
  State<Map_page> createState() => _Map_pageState();
}

class _Map_pageState extends State<Map_page> {

  Location _locationController = new Location();
  static const LatLng Gplex = LatLng(10.8110,76.6267);
  static const LatLng Qplex = LatLng(10.8281,76.7368);
  LatLng ? _currentP=null;
  final Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();

  //polymapline
  Map<PolylineId,Polyline> polylines = {};

  // camera position

  Future<void>_cameraToPosition(LatLng pos)async{

    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(target: pos,zoom: 13);
    await controller.animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
  }

  //polylines on map

  Future<List<LatLng>> getPolylinespoints() async{
    List<LatLng> polylinecoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult  result = await polylinePoints
        .getRouteBetweenCoordinates(GOOGLE_MAPS_API_KEY,
      PointLatLng(Gplex.latitude, Gplex.longitude),
      PointLatLng(Qplex.latitude, Qplex.longitude),
      travelMode: TravelMode.driving,
    );
    if(result.points.isNotEmpty){
      result.points.forEach((PointLatLng point) {
        polylinecoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }else{
      print(result.errorMessage);
    }
    return polylinecoordinates;

  }

  //generate polylines from points

  void generatePolylineFromPoints(List<LatLng> polylineCoordinates)async{
    PolylineId id= PolylineId("poly");
    Polyline polyline = Polyline(polylineId: id,color: Colors.black,points: polylineCoordinates,width: 30);
    setState(() {
      polylines[id] = polyline;
    });
  }

  //getlocation function

  Future<void> getLocationUpdates() async{
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await _locationController.serviceEnabled();

    //gmap service

    if(_serviceEnabled){
      _serviceEnabled = await _locationController.requestService();
    }else{
      return ;
    }

    //permission granted
    _permissionGranted = await _locationController.hasPermission();
    if(_permissionGranted == PermissionStatus.denied){
      _permissionGranted = await _locationController.requestPermission();
      if(_permissionGranted != PermissionStatus.granted){
        return;
      }
    }

    //updatecurrentlocation

    _locationController.onLocationChanged.listen((LocationData currentlocation) {
      if(currentlocation.latitude != null && currentlocation.longitude !=null){

        setState(() {
          _currentP = LatLng(currentlocation.latitude!, currentlocation.longitude!);
          _cameraToPosition(_currentP!);

        });
      }
    });

  }
  @override
  void initState() {
    super.initState();
    getLocationUpdates().then((value) => {
      getPolylinespoints().then((coordinats) => {
        generatePolylineFromPoints(coordinats)
      }
      )
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _currentP == null ? const Center(child: Text("Loading...")):


        GoogleMap(
          onMapCreated:((GoogleMapController controller)=> _mapController.complete(controller)),
          trafficEnabled: true,

          initialCameraPosition: CameraPosition(target: Gplex,
            zoom:50 ,
          ),
          mapType: MapType.normal,

          markers:{
            Marker(markerId: MarkerId("currentlocation"),
                icon: BitmapDescriptor.defaultMarker,
                position: _currentP!),
            Marker(markerId: MarkerId("sourcelocation"),
                icon: BitmapDescriptor.defaultMarker,
                position: Gplex),
            Marker(markerId: MarkerId("destinationlocation"),
                icon: BitmapDescriptor.defaultMarker,
                position: Qplex),
          },
          polylines: Set<Polyline>.of(polylines.values),
        )
    );
  }
}