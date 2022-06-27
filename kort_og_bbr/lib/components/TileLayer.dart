import 'package:flutter_map/flutter_map.dart';

class TileLayer {
  final Map<String, String> additionalOptions;
  final String name;
  final bool isBaseLayer; // "true" or "false"
  final double opacity; //Between 0.0 and 1.0
  final String type; // "WMS" or "WMTS"

  TileLayer(
      {required this.name,
      required this.additionalOptions,
      this.isBaseLayer = true,
      this.opacity = 1.0,
      required this.type});

  String buildUrlTemplate() {
    String urlTemplate = '{uri}?';
    additionalOptions.forEach((key, value) {
      if (key != 'uri') {
        urlTemplate += '${key.toUpperCase()}={$key}&';
      }
    });
    urlTemplate += 'TILEMATRIX={z}&TILEROW={y}&TILECOL={x}';
    // String urlTemplate2 =
    '{uri}?USERNAME={username}&PASSWORD={password}&SERVICE={service}&VERSION={version}&REQUEST={request}&FORMAT={format}&LAYER={layer}&STYLE={style}&TILEMATRIXSET={tilematrixset}&TILEMATRIX={z}&TILEROW={y}&TILECOL={x}';
    // print('urlTemplate1: $urlTemplate1');
    // print('urlTemplate2: $urlTemplate2');

    return urlTemplate;
  }

  TileLayerOptions generateTileLayerOptions() {
    return TileLayerOptions(
      additionalOptions: additionalOptions,
      urlTemplate: buildUrlTemplate(),
      tileProvider: NetworkTileProvider(),
    );
  }
}
