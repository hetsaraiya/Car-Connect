import 'package:carconnect/models/models.dart';
import 'package:carconnect/models/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart' as locpoi;
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// class MapState extends ChangeNotifier {
//   locpoi.LatLng _center = const locpoi.LatLng(37.7749, -122.4194);

//   locpoi.LatLng get center => _center;

//   void updateMap(LatLng newCenter) {
//     _center = newCenter;
//     notifyListeners();
//   }
// }

// class MapQuestDataProvider {
//   Future<MapQuestDirection> getDirections(
//       LatLng Source, LatLng Destination) async {
//     try {
//       MapQuestDirection result = MapQuestDirection(locations: []);

//       var aPIKey = "kBEVbZm3gsQjxw9AxkAwjUbICySUacls";
//       var url =
//           "https://www.mapquestapi.com/directions/v2/optimizedroute?key=$aPIKey&json={\"locations\":[\"${Source.latitude},${Destination.longitude}\",\"${Destination.latitude},${Source.longitude}\"]}";

//       var uri = Uri.parse(url);
//       final response = await http.get(uri);
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         var route = data["route"];
//         var legs = route["legs"];
//         var zero = legs[0];
//         var maneuvers = zero["maneuvers"] as List;

//         for (var element in maneuvers) {
//           var startPoint = element["startPoint"];
//           var lat = startPoint["lat"];
//           var lng = startPoint["lng"];
//           result.locations.add(LatLng(lat, lng));
//         }

//         return result;
//       } else {
//         throw Exception('Failed to load Locations');
//       }
//     } catch (e) {
//       print("Exception throuwn $e");
//       throw e;
//     }
//   }
// }

// SetPathFromMapQuestData(List<LatLng> Locations) {
//   PolylinePoints polylinePoints = PolylinePoints();
//   Set<Marker> markers = Set(); //markers for google map

//   LatLng startLocation = this.startLocation!;
//   LatLng endLocation = this.endLocation!;

//   double distance = 0.0;

//   List<LatLng> polylineCoordinates = [];

//   //polylineCoordinates.add(this.startLocation!);
//   Locations.forEach((LatLng point) {
//     polylineCoordinates.add(point);
//   });

//   polylineCoordinates.insert(0, this.startLocation!);
//   polylineCoordinates.add(this.endLocation!);

//   PolylineId id = PolylineId("poly");
//   var poly = GetPloylineId(polylineCoordinates, id);

//   var polylines;
//   polylines[id] = poly;

//   setState(() {
//     this.polylines = polylines;
//   });
// }

// Polyline GetPloylineId(List<LatLng> polylineCoordinates, PolylineId id) {
//   Polyline polyline = Polyline(
//     polylineId: id,
//     color: Colors.deepPurpleAccent,
//     points: polylineCoordinates,
//     width: 8,
//   );
//   return polyline;
// }

class _HomePageState extends State<HomePage> {
  // Map<PolylineId, Polyline> polylines = {};

  // SetPathFromMapQuestData(List<LatLng> Locations) {
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   Set<Marker> markers = Set();

  //   LatLng startLocation = ...;  // Define or get the start location
  //   LatLng endLocation = ...;    // Define or get the end location

  //   double distance = 0.0;
  //   List<LatLng> polylineCoordinates = [];

  //   Locations.forEach((LatLng point) {
  //     polylineCoordinates.add(point);
  //   });

  //   polylineCoordinates.insert(0, startLocation);
  //   polylineCoordinates.add(endLocation);

  //   PolylineId id = PolylineId("poly");
  //   var poly = GetPloylineId(polylineCoordinates, id);

  //   setState(() {
  //     polylines[id] = poly;
  //   });
  // }

  var apiKey = "kBEVbZm3gsQjxw9AxkAwjUbICySUacls";
  String origin = "Ldrp-itr Gandhinagar gujarat india";
  String destination = "ahmedabad gujarat india";
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    User user = context.read<UserCubit>().state;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.purple, Colors.blueAccent],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.4, 0.7],
          tileMode: TileMode.repeated,
        )),
        child: Container(
            padding: const EdgeInsets.all(50),
            child: FlutterMap(
              options: const MapOptions(backgroundColor: Colors.black),
              children: [
                TileLayer(
                  urlTemplate:
                      // ignore: unnecessary_brace_in_string_interps
                      // https://www.mapquestapi.com/staticmap/v5/map?key=kBEVbZm3gsQjxw9AxkAwjUbICySUacls&center={center}&zoom={zoom}&size=600,400
                      // https://www.mapquestapi.com/directions/v2/route?key=$apiKey&from=$origin&to=$destination
                      'https://www.mapquestapi.com/staticmap/v5/map?key=kBEVbZm3gsQjxw9AxkAwjUbICySUacls&center={center}&zoom={zoom}&size=600,400',
                  additionalOptions: const {
                    'center': '23.238855, 72.638193',
                    'zoom': '13',
                  },
                ),
              ],
            )),
      ),
    );
  }
}


// class MapWidget extends StatefulWidget {
//   MapWidget(
//       {Key? key,
//       this.currentLocation,
//       required this.onTab,
//       required this.markers,
//       this.endLocation,
//       required this.polylines})
//       : super(key: key);
//   LatLng? currentLocation;
//   void Function(LatLng) onTab;
//   Set<Marker> markers = {};
//   LatLng? endLocation;
//   Map<PolylineId, Polyline> polylines = {};

//   @override
//   State<MapWidget> createState() => _MapWidgetState();
// }

// class _MapWidgetState extends State<MapWidget> {
//   GoogleMapController? mapController;
//   final defaultMapZooming = 18.0;

//   @override
//   Widget build(BuildContext context) {
//     return Container(child: mapView(context));
//   }

//   Widget mapView(BuildContext context) {
//     if (mapController != null && widget.currentLocation != null) {
//       mapController!.animateCamera(CameraUpdate.newLatLngZoom(
//           LatLng(widget.currentLocation!.latitude,
//               widget.currentLocation!.longitude),
//           defaultMapZooming));
//     }

//     var map = GoogleMap(
//       onMapCreated: onMapCreated,
//       zoomControlsEnabled: false,
//       myLocationEnabled: false,
//       mapType: MapType.normal,
//       onLongPress: (loc) {
//         widget.onTab(loc);
//       },
//       markers: widget.markers,
//       polylines: widget.polylines.values.toSet(),
//       minMaxZoomPreference: const MinMaxZoomPreference(12, 25),
//       initialCameraPosition: CameraPosition(
//         target: getLocationOrDefault(),
//         zoom: defaultMapZooming,
//       ),
//       onCameraMove: (CameraPosition cameraPosition) {
//         print("ZOOOOOOOOOOOOOOOOOOOM IS : " + cameraPosition.zoom.toString());
//       },
//     );
//     return map;
//   }

//   onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   getLocationOrDefault() {
//     return widget.currentLocation ??
//         const LatLng(21.215415017175165, 72.8879595194489);
//   }
// }
