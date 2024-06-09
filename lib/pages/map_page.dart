import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/services.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const LatLng _pGooglePlex = LatLng(14.303142147986497, 121.07613374318477);
  late GoogleMapController mapController;
  Location _locationController = new Location();
  LatLng? _currentP = null;
  String? _currentAddress;
  Set<Marker> _markers = {};
  BitmapDescriptor? _customMarkerIcon;
  final Completer<GoogleMapController> _controller = Completer();
  late String _mapStyleString;

  @override
  void initState() {
    rootBundle.loadString('assets/map_style.json').then((string) {
      _mapStyleString = string;
  });
    // TODO: implement initState
    super.initState();
    getLocationUpdates();
    _loadCustomMarkerIcon();
  }

  Future<void> _loadCustomMarkerIcon() async {
    _customMarkerIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(1, 1)),
      'assets/paid_CR_Tag.png',
    );
  }

  Future<void> updateCurrentAddress() async {
    if (_currentP != null) {
      _currentAddress =
          await getAddressFromLatLng(_currentP!.latitude, _currentP!.longitude);
      setState(() {});
    } else {
      _currentAddress = null;
    }
  }

  void _showFindNearestPayToilet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      backgroundColor:
          Colors.transparent, // Set background color to transparent
      builder: (context) {
        return const MyDraggableSheet(
          child: Column(
            children: [
              BottomSheetRecommendationUI(),
              BottomSheetRecommendationUI(),
              BottomSheetRecommendationUI(),
              BottomSheetRecommendationUI(),
              BottomSheetRecommendationUI(),
              BottomSheetRecommendationUI(),
              BottomSheetRecommendationUI(),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    if (_currentP != null) {
      print(_currentP);
      _markers.add(
        Marker(
          markerId: const MarkerId('User Location'),
          position: _currentP!,
        ),
      );
    }

    var markers = {
      Marker(
        markerId: const MarkerId('1'),
        position: LatLng(14.315468626815898, 121.07064669023518),
        icon: _customMarkerIcon ?? BitmapDescriptor.defaultMarker,

      ),
      Marker(
        markerId: const MarkerId('2'),
        position: LatLng(14.356239417708707, 121.04451720560752),
        icon: _customMarkerIcon ?? BitmapDescriptor.defaultMarker,
      ),
      Marker(
        markerId: const MarkerId('3'),
        position: LatLng(14.355059500353084, 121.0442736161414),
        icon: _customMarkerIcon ?? BitmapDescriptor.defaultMarker,
      ),
      Marker(
        markerId: const MarkerId('4'),
        position: LatLng(14.33120930591894, 121.06947036325884),
        icon: _customMarkerIcon ?? BitmapDescriptor.defaultMarker,
      ),
      Marker(
        markerId: const MarkerId('5'),
        position: LatLng(14.31992161435816, 121.1176986169851),
        icon: _customMarkerIcon ?? BitmapDescriptor.defaultMarker,
      ),
      Marker(
        markerId: const MarkerId('6'),
        position: LatLng(14.263368532549292, 121.04213554806316),
        icon: _customMarkerIcon ?? BitmapDescriptor.defaultMarker,
      ),
      Marker(
        markerId: const MarkerId('7'),
        position: LatLng(14.247512370849535, 121.06340147747518),
        icon: _customMarkerIcon ?? BitmapDescriptor.defaultMarker,
      ),
      Marker(
        markerId: const MarkerId('8'),
        position: LatLng(14.247352099793037, 121.06342553348516),
        icon: _customMarkerIcon ?? BitmapDescriptor.defaultMarker,
      ),
      Marker(
        markerId: const MarkerId('9'),
        position: LatLng(14.169189623465543, 121.14310662338366),
        icon: _customMarkerIcon ?? BitmapDescriptor.defaultMarker,
      ),
       Marker(
        markerId: const MarkerId('10'),
        position: LatLng(14.293578936541783, 121.07870252060286),
        icon: _customMarkerIcon ?? BitmapDescriptor.defaultMarker,
      ),
    };

     _markers.addAll(markers);

    return MaterialApp(
        theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const CircleBorder(),
                    minimumSize: const Size(55, 55)))),
        home: Scaffold(
            body: Stack(children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: _pGooglePlex,
              zoom: 13,
            ),
            zoomControlsEnabled: false, // Disable zoom in and zoom out buttons
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
              mapController.setMapStyle(_mapStyleString);
            },
            markers: _markers,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 60.0),
                child: SizedBox.shrink(), // Placeholder for an empty child
              ),
              Container(
                margin: const EdgeInsets.only(
                    bottom: 20.0), // Adjust the value to your needs
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      enableFeedback: false,
                      backgroundColor: Colors.white,

                      minimumSize: const Size(115, 50),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(
                        color: Colors.purple, // Set the border color
                        width: 4.0, // Set the border width
                      ),
                    ),
                      foregroundColor: Colors.purple,
                      textStyle: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    child: const Text("FIND NEAREST PAY TOILET"),
                    onPressed: () {
                      _showFindNearestPayToilet();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          )
        ])));
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
      if (!_serviceEnabled) {
        print('Location services disabled.');
        return;
      }
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print('Location permission denied.');
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });
        updateCurrentAddress();
      }
    });
  }

  Future<String?> getAddressFromLatLng(double lat, double lng) async {
    const apiKey = 'AIzaSyATlFmBj-83JvPniLILsfpyawS8NlKIEDc';
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body) as Map<String, dynamic>;
        final results = decoded['results'] as List<dynamic>;

        if (results.isNotEmpty) {
          final formattedAddress = results[0]['formatted_address'] as String?;
          return formattedAddress;
        } else {
          print('No results found for the provided coordinates.');
          return null;
        }
      } else {
        print('Failed to load address: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching address: $e');
      return null;
    }
  }
}

class MyDraggableSheet extends StatefulWidget {
  final Widget child;
  const MyDraggableSheet({super.key, required this.child});

  @override
  State<MyDraggableSheet> createState() => _MyDraggableSheetState();
}

class _MyDraggableSheetState extends State<MyDraggableSheet> {
  final sheet = GlobalKey();
  final controller = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    controller.addListener(onChanged);
  }

  void onChanged() {
    final currentSize = controller.size;
    if (currentSize <= 0.05) collapse();
  }

  void collapse() => animateSheet(getSheet.snapSizes!.first);

  void anchor() => animateSheet(getSheet.snapSizes!.last);

  void expand() => animateSheet(getSheet.maxChildSize);

  void hide() => animateSheet(getSheet.minChildSize);

  void animateSheet(double size) {
    controller.animateTo(
      size,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  DraggableScrollableSheet get getSheet =>
      (sheet.currentWidget as DraggableScrollableSheet);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return DraggableScrollableSheet(
        key: sheet,
        initialChildSize: 0.5,
        maxChildSize: 0.95,
        minChildSize: 0,
        expand: true,
        snap: true,
        snapSizes: [
          60 / constraints.maxHeight,
          0.5,
        ],
        controller: controller,
        builder: (BuildContext context, ScrollController scrollController) {
          return DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                topButtonIndicator(),
                SliverToBoxAdapter(
                  child: widget.child,
                ),
              ],
            ),
          );
        },
      );
    });
  }

  SliverToBoxAdapter topButtonIndicator() {
    return SliverToBoxAdapter(
      child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            Container(
                child: Center(
                    child: Wrap(children: <Widget>[
              Container(
                  width: 100,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  height: 5,
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  )),
            ]))),
          ])),
    );
  }
}

class BottomSheetRecommendationUI extends StatelessWidget {
  const BottomSheetRecommendationUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 220,
                      ),
                    ),
                    SizedBox(height: 5),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 170,
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
                SizedBox(width: 30),
                ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: Container(
                    child: const Icon(
                      Icons.directions,
                      size: 30,
                    ),
                    color: Colors.black12,
                    height: 60,
                    width: 60,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
