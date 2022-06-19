import 'package:flutter_map/flutter_map.dart';
import 'package:proj4dart/proj4dart.dart' as proj4;

class DKProjection {

  final epsg25832 =
  proj4.Projection.add('EPSG:25832', '+proj=utm +zone=32 +ellps=GRS80 +units=m +no_defs');

  // zoom level resolutions
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
    4
  ];

  double getMaxZoom () {
    return (resolutions.length - 1).toDouble();
  }

  Proj4Crs getCRS () {
    return Proj4Crs.fromFactory(
      code: 'EPSG:25832',
      proj4Projection: epsg25832,
      resolutions: resolutions,
      origins: [CustomPoint(0, 0)],
      scales: null,
      transformation: null,
    );
  }
}
