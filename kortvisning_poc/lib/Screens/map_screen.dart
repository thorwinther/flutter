import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:proj4dart/proj4dart.dart' as proj4;

// SAMPLE URL:
// 'https://services.datafordeler.dk/DKskaermkort/topo_skaermkort_wmts/1.0.0/Wmts?USERNAME=MBAWETWOSQ&PASSWORD=HestPlastikMule!985&SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetTile&FORMAT=image%2Fjpeg&LAYER=topo_skaermkort&STYLE=default&TILEMATRIXSET=View1&TILEMATRIX=0&TILEROW=0&TILECOL=1',

class MapScreen extends StatefulWidget {
  const MapScreen({required this.title});
  final String title;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var epsg3413CRS;
  var maxZoom;

  @override
  void initState() {
    var epsg25832 =
        proj4.Projection.add('EPSG:25832', '+proj=utm +zone=32 +ellps=GRS80 +units=m +no_defs');

    final resolutions = <double>[32768, 16384, 8192, 4096, 2048, 1024, 512, 256, 128];

    maxZoom = (resolutions.length - 1).toDouble();

    epsg3413CRS = Proj4Crs.fromFactory(
      code: 'EPSG:25832',
      proj4Projection: epsg25832,
      resolutions: resolutions,
      origins: [CustomPoint(0, 0)],
      scales: null,
      transformation: null,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 400,
            height: 800,
            child: FlutterMap(
              options: MapOptions(
                crs: epsg3413CRS,
                center: LatLng(2.5231, -122.6765),
                zoom: 13.0,
                maxZoom: maxZoom,
              ),
              layers: [
                TileLayerOptions(
                  additionalOptions: {
                    'request': 'GetTile',
                  },
                  // wmsOptions: WMSTileLayerOptions(
                  //   crs: epsg3413CRS,
                  //   format: 'image/jpeg',
                  //   version: '1.0.0',
                  //   baseUrl:
                  //       'https://services.datafordeler.dk/DKskaermkort/topo_skaermkort_wmts/1.0.0/Wmts?USERNAME=MBAWETWOSQ&PASSWORD=HestPlastikMule!985&LAYER=topo_skaermkort&STYLE=default&TILEMATRIXSET=View1&TILEMATRIX=0&TILEROW=0&TILECOL=1',
                  //
                  // ),
                  urlTemplate:
                      "https://services.datafordeler.dk/DKskaermkort/topo_skaermkort_wmts/1.0.0/Wmts?USERNAME=MBAWETWOSQ&PASSWORD=HestPlastikMule!985&SERVICE=WMTS&VERSION=1.0.0&REQUEST={request}&FORMAT=image%2Fjpeg&LAYER=topo_skaermkort&STYLE=default&TILEMATRIXSET=View1&TILEMATRIX=0&TILEROW=0&TILECOL=1",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
