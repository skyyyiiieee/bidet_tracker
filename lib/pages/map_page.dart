import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // static const LatLng _pGooglePlex = LatLng(14.247142, 121.13667);
  // late GoogleMapController mapController;
  // File? _selectedImage;

  // void setMapStyle() {
  //   mapController.setMapStyle(
  //       '[{"featureType": "poi", "stylers": [{ "visibility": "off" }]}]');
  // }

  void _showAddBidet() {
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
                              onPressed: () {},
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
                              onPressed: () {},
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 10.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Name of your Location',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ])),

                        //name of the location
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.0),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'e.g. SM Sta Rosa, Jolibee Pulo',
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
                              minimumSize: const Size(270, 50),
                              textStyle: const TextStyle(
                                fontSize: 20,
                              )),
                          onPressed: () {},
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  )));
        });
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
                  height: 380,
                  child: Center(
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
                              minimumSize: const Size(270, 50),
                              textStyle: const TextStyle(
                                fontSize: 20,
                              )),
                          onPressed: () {},
                          child: const Text('Show'),
                        ),
                      ],
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
                    backgroundColor: Colors.black38,
                    shape: const CircleBorder(),
                    minimumSize: const Size(55, 55)))),
        home: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                // GoogleMap(
                //   initialCameraPosition: CameraPosition(
                //     target: _pGooglePlex,
                //     zoom: 13,
                //   ),
                //   zoomControlsEnabled:
                //       false, // Disable zoom in and zoom out buttons
                //   onMapCreated: (GoogleMapController controller) {
                //     mapController = controller;
                //     setMapStyle();
                //   },
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 140.0, vertical: 80.0),
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
                        child: FloatingActionButton(
                          backgroundColor: Colors.grey[800],
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
}
