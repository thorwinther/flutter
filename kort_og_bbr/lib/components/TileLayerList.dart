import 'package:flutter_map/flutter_map.dart';

import 'TileLayer.dart' as tl;

class TileLayerList {
  final List<TileLayerOptions> layers = [];

  TileLayerList() {
    Map<String, String> additionalOptions = {
      'username': 'MBAWETWOSQ',
      'password': 'HestPlastikMule!985',
      'service': 'WMTS',
      'request': 'GetTile',
      'version': '1.0.0',
      'format': 'image%2Fjpeg',
      'layer': 'topo_skaermkort',
      'style': 'default',
      'tilematrixset': 'View1',
    };

    String uri = 'https://services.datafordeler.dk/DKskaermkort/topo_skaermkort_wmts/1.0.0/Wmts';

    addLayer(additionalOptions, uri);
  }

  void addLayer(Map<String, String> additionalOptions, String uri) {
    tl.TileLayer layer = tl.TileLayer(additionalOptions: additionalOptions, uri: uri);
    layers.add(layer.generateTileLayerOptions());
  }
}
