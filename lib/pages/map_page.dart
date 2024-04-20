import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage ({super.key});

  @override
  State<MapPage> createState() => _MapPageState ();
}

class _MapPageState extends State<MapPage> {
 int _selectedIndex = 0;



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

     // Add your navigation logic here based on the index
    switch (index) {
      case 0:
        // Navigate to the first screen
       
        break;
      case 1:
        // Navigate to the second screen
        break;
      // Add cases for other indices as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.indigo[800],

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo_outlined),
        onPressed: () {
          
        },
      ),

      body: Center(
          child: Text(
        'Map',
      )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey[800],
        items: const [
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.blue, // Desired color
                BlendMode.srcIn,
              ),
              child: Icon(Icons.map_outlined),
            ),
            label: 'Map',
            
          ),
       
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.white60, // Desired color
                BlendMode.srcIn,
              ),
              child: Icon(Icons.settings),
            ),
            label: 'Settings',
          )
        ],
         currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    ));
  }

  
}
