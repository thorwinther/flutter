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
  var epsg25832CRS;
  var maxZoom;

  var point;
  var point_transformed;
  // EPSG:4326 is a predefined projection ships with proj4dart
  var epsg4326 = proj4.Projection.get('EPSG:4326')!;

  @override
  void initState() {
    var epsg25832 =
        proj4.Projection.add('EPSG:25832', '+proj=utm +zone=32 +ellps=GRS80 +units=m +no_defs');

    // 9 example zoom level resolutions
    final resolutions = <double>[
      32768,
      16384,
      8192,
      4096,
      2048,
      1024,
      512,
      256,
      128,
      64,
      32,
      16,
      8,
    ];

    maxZoom = (resolutions.length - 1).toDouble();

    epsg25832CRS = Proj4Crs.fromFactory(
      code: 'EPSG:25832',
      proj4Projection: epsg25832,
      resolutions: resolutions,
      origins: [CustomPoint(0, 0)],
      scales: null,
      transformation: null,
    );

    // Define start point
    point = proj4.Point(x: 6178892.29, y: 722125.86); // In epsg25832
    print('point: $point');

    // EPSG:4326 is a predefined projection ships with proj4dart
    epsg4326 = proj4.Projection.get('EPSG:4326')!;

    print(
        'Which is (${epsg25832.transform(epsg4326, point).x.toStringAsFixed(2)}, ${epsg25832.transform(epsg4326, point).y.toStringAsFixed(2)}) in EPSG:4326.');
    print(epsg25832.transform(epsg4326, point));
    //epsg4326.transform(epsg25832CRS, point);

    point_transformed = epsg25832.transform(epsg4326, point);
    print('epsg4326: $point_transformed');

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
                crs: epsg25832CRS,
                //center: LatLng(epsg25832.transform(epsg4326, point).y, epsg25832.transform(epsg4326, point).x),
                //center: LatLng(point_transformed.y, point_transformed.x),
                center: LatLng(-15.419022, 88.829566),
                zoom: 10,
                maxZoom: maxZoom,
                onTap: (tapPosition, point) => {
                  print(point.toString()),
                },
              ),
              layers: [
                TileLayerOptions(
                  additionalOptions: {
                    'username': 'MBAWETWOSQ',
                    'password': 'HestPlastikMule!985',
                    'service': 'WMTS',
                    'request': 'GetTile',
                    'version': '1.0.0',
                    'format': 'image%2Fjpeg',
                    'layer': 'topo_skaermkort',
                    'style': 'default',
                    'tilematrixset': 'View1',
                    // 'tilematrix' : '0',
                    // 'tilerow' : '0',
                    // 'tilecol' : '1',
                  },
                  // wmsOptions: WMSTileLayerOptions(
                  //   crs: epsg25832CRS,
                  //   format: 'image/png',
                  //   version: '1.3.0',
                  //   transparent: true,
                  //   uppercaseBoolValue: false,
                  //   styles: [
                  //     'default'
                  //   ],
                  //   baseUrl:'https://services.datafordeler.dk/Dkskaermkort/topo_skaermkort/1.0.0/wms?USERNAME=MBAWETWOSQ&PASSWORD=HestPlastikMule!985',
                  //   layers: [
                  //     'topo_skaermkort'
                  //   ]
                  //
                  // ),

                  urlTemplate:
                      "https://services.datafordeler.dk/DKskaermkort/topo_skaermkort_wmts/1.0.0/Wmts?USERNAME={username}&PASSWORD={password}&SERVICE={service}&VERSION={version}&REQUEST={request}&FORMAT={format}&LAYER={layer}&STYLE={style}&TILEMATRIXSET={tilematrixset}&TILEMATRIX={z}&TILEROW={y}&TILECOL={x}",
                  //"https://services.datafordeler.dk/DKskaermkort/topo_skaermkort_wmts/1.0.0/Wmts?USERNAME={username}&PASSWORD={password}&SERVICE={service}&VERSION={version}&REQUEST={request}&FORMAT={format}&LAYER={layer}&STYLE={style}&TILEMATRIXSET={tilematrixset}&TILEMATRIX={tilematrix}&TILEROW={tilerow}&TILECOL={tilecol}",
                  //tileProvider: const NonCachingNetworkTileProvider(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
