import 'package:flutter/material.dart';
import 'package:kort_og_bbr/widgets/KortOgBBRMap.dart';
import 'package:kort_og_bbr/widgets/GpsActionButton.dart';

import '../constants.dart';

// SAMPLE URL:
// 'https://services.datafordeler.dk/DKskaermkort/topo_skaermkort_wmts/1.0.0/Wmts?USERNAME=MBAWETWOSQ&PASSWORD=HestPlastikMule!985&SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetTile&FORMAT=image%2Fjpeg&LAYER=topo_skaermkort&STYLE=default&TILEMATRIXSET=View1&TILEMATRIX=0&TILEROW=0&TILECOL=1',

class MapScreen extends StatefulWidget {
  const MapScreen({required this.title});
  final String title;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int _selectedIndex = 0;
  bool _showFloatingActionButton = true;

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        _showFloatingActionButton = true;
      } else {
        _showFloatingActionButton = false;
      }
      _selectedIndex = index;
    });
  }

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    KortOgBBRMap(),
    const Text(
      'Index 1: Søg',
      style: optionStyle,
    ),
    const Text(
      'Index 2: GPS',
      style: optionStyle,
    ),
    const Text(
      'Index 3: Kortlag',
      style: optionStyle,
    ),
    const Text(
      'Index 4: BBR',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: kMainBackgroundColor,
      ),
      //drawer: buildDrawer(context, PluginScaleBar.route),
      body: _widgetOptions.elementAt(_selectedIndex),
      // body: Column(
      //   children: [
      //     Flexible(
      //       //child: KortOgBBRMap(),
      //       child: _widgetOptions.elementAt(_selectedIndex),
      //     ),
      //   ],
      // ),
      floatingActionButton: GpsActionButton(_showFloatingActionButton),
      //floatingActionButton: GpsActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kMainBackgroundColor,
        selectedItemColor: Colors.amber[800],
        selectedFontSize: 20.0,
        unselectedItemColor: Colors.white,
        unselectedFontSize: 20.0,
        elevation: 20.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Kort',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Søg',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Kortlag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'BBR',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
