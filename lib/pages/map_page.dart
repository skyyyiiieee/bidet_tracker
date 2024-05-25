import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const LatLng _pGooglePlex = LatLng(14.247142, 121.13667);
  late GoogleMapController mapController;
  Location _locationController = new Location();
  LatLng? _currentP = null;
  File? _selectedImage;
  String? _currentAddress;

  void setMapStyle() {  
    mapController.setMapStyle(
        '[{"featureType": "poi", "stylers": [{ "visibility": "off" }]}]');
  }

 void _showAddBidet() async {
  await getLocationUpdates();
  await updateCurrentAddress();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    backgroundColor: Colors.indigo[950],
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SizedBox(
          height: 530,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  const Text(
                    'ADD BIDET INFORMATION',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            enableFeedback: false,
                            backgroundColor: Colors.black38,
                            minimumSize: const Size(150, 50),
                            textStyle: const TextStyle(
                              fontSize: 18,
                            )),
                        onPressed: () {
                          _pickImageFromGallery();
                        },
                        child: const Text('Upload'),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 0.0),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            enableFeedback: false,
                            backgroundColor: Colors.black38,
                            minimumSize: const Size(150, 50),
                            textStyle: const TextStyle(
                              fontSize: 18,
                            )),
                        onPressed: () {
                          _pickImageFromCamera();
                        },
                        child: const Text('Capture'),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 0.0),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: TextField(
                      readOnly: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: _currentAddress,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        floatingLabelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        fillColor: Colors.transparent,
                        filled: true,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Additional Details',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ])),

                  //additional details
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText:
                              'Floor #, near etc, is it a pay CR?, etc.',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          floatingLabelStyle: TextStyle(
                            fontSize: 15,
                            color: Colors
                                .white, // Change this color to the desired color,
                          ),
                          fillColor: Colors.transparent,
                          filled: true,
                        ),
                      )),

                  const SizedBox(height: 30),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        enableFeedback: false,
                        backgroundColor: Colors.black38,
                        minimumSize: const Size(270, 60),
                        textStyle: const TextStyle(
                          fontSize: 20,
                        )),
                    onPressed: () {},
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

Future<void> updateCurrentAddress() async {
  if (_currentP != null) {
    _currentAddress = await getAddressFromLatLng(_currentP!.latitude, _currentP!.longitude);
    setState(() {});
  } else {
    _currentAddress = null;
  }
}


  void _showDirections() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        backgroundColor: Colors.indigo[950],
        builder: (context) {
          return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SizedBox(
                  height: 470,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 30),
                          const Text(
                            'DIRECTIONS',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),

                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50.0, vertical: 10.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Starting point',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ])),

                          //name of the location
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50.0),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: 'Pulo Cabuyao, Laguna',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                  floatingLabelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors
                                        .white, // Change this color to the desired color,
                                  ),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                ),
                              )),

                          const SizedBox(height: 30),

                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50.0, vertical: 10.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Destination',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ])),

                          //additional details
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50.0),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: 'Mamatid Cabuyao, Laguna',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                  floatingLabelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors
                                        .white, // Change this color to the desired color,
                                  ),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                ),
                              )),

                          const SizedBox(height: 25),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                enableFeedback: false,
                                backgroundColor: Colors.black38,
                                minimumSize: const Size(270, 60),
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                )),
                            onPressed: () {},
                            child: const Text('Show'),
                          ),
                        ],
                      ),
                    ),
                  )));
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const CircleBorder(),
                    minimumSize: const Size(55, 55)))),
        home: Scaffold(
            body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _pGooglePlex,
                zoom: 13,
              ),
              zoomControlsEnabled:
                  false, // Disable zoom in and zoom out buttons
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
                setMapStyle();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 140.0, vertical: 80.0),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showDirections();
                  },
                  child: const Icon(Icons.directions),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      child: const Icon(Icons.add),
                      onPressed: () {
                        _showAddBidet();
                      },
                    ),
                  ),
                )
              ],
            )
          ],
        )));
  }

  Future _pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;
    setState(() {
      _selectedImage = File(pickedFile.path);
    });
  }

  Future _pickImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile == null) return;
    setState(() {
      _selectedImage = File(pickedFile.path);
    });
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

  _locationController.onLocationChanged.listen((LocationData currentLocation) {
  if (currentLocation.latitude != null && currentLocation.longitude != null) {
    setState(() {
      _currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
    });
    updateCurrentAddress();
  }
});
}


Future<String?> getAddressFromLatLng(double lat, double lng) async {
  const apiKey = 'AIzaSyATlFmBj-83JvPniLILsfpyawS8NlKIEDc';
  final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$apiKey';
  
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
