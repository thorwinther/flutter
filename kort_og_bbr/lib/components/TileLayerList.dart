import 'package:flutter_map/flutter_map.dart';

import 'TileLayer.dart' as tl;

class TileLayerList {
  final List<TileLayerOptions> layers = [];

  TileLayerList() {
    addLayer(
      name: 'skærmkort',
      type: 'WMTS',
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
        'uri': 'https://services.datafordeler.dk/DKskaermkort/topo_skaermkort_wmts/1.0.0/Wmts',
      },
    );

    addLayer(
      name: 'Terræn Skyggekort',
      isBaseLayer: false,
      opacity: 0.3,
      type: 'WMTS',
      additionalOptions: {
        'username': 'MBAWETWOSQ',
        'password': 'HestPlastikMule!985',
        'service': 'WMTS',
        'request': 'GetTile',
        'version': '1.0.0',
        'format': 'image%2Fjpeg',
        'layer': 'dhm_terraen_skyggekort',
        'style': 'default',
        'tilematrixset': 'View1',
        'uri': 'https://services.datafordeler.dk/DKskaermkort/topo_skaermkort_wmts/1.0.0/Wmts',
      },
    );
  }

  void addLayer(
      {required name,
      required String type,
      bool isBaseLayer = true,
      double opacity = 1.0,
      required Map<String, String> additionalOptions}) {
    tl.TileLayer layer = tl.TileLayer(
      name: name,
      type: type,
      isBaseLayer: isBaseLayer,
      opacity: opacity,
      additionalOptions: additionalOptions,
    );
    layers.add(layer.generateTileLayerOptions());
  }
}
