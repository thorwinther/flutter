import 'package:flutter/material.dart';
import 'package:kort_og_bbr/components/KortOgBBRMap.dart';

// SAMPLE URL:
// 'https://services.datafordeler.dk/DKskaermkort/topo_skaermkort_wmts/1.0.0/Wmts?USERNAME=MBAWETWOSQ&PASSWORD=HestPlastikMule!985&SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetTile&FORMAT=image%2Fjpeg&LAYER=topo_skaermkort&STYLE=default&TILEMATRIXSET=View1&TILEMATRIX=0&TILEROW=0&TILECOL=1',

class MapScreen extends StatefulWidget {
  const MapScreen({required this.title});
  final String title;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      //drawer: buildDrawer(context, PluginScaleBar.route),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [
            Flexible(
          child: KortOgBBRMap(),
        ),],
      ),),
    );
  }
}
