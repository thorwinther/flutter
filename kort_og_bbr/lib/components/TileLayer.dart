import 'package:flutter_map/flutter_map.dart';

class TileLayer {
  final Map<String, String> additionalOptions;
  final String uri;

  TileLayer({required this.additionalOptions, required this.uri});

  String generateUrlTemplate() {
    String urlTemplate =
        '$uri?USERNAME={username}&PASSWORD={password}&SERVICE={service}&VERSION={version}&REQUEST={request}&FORMAT={format}&LAYER={layer}&STYLE={style}&TILEMATRIXSET={tilematrixset}&TILEMATRIX={z}&TILEROW={y}&TILECOL={x}';
    // print(urlTemplate);
    return urlTemplate;
  }

  TileLayerOptions generateTileLayerOptions() {
    return TileLayerOptions(
      additionalOptions: additionalOptions,
      urlTemplate: generateUrlTemplate(),
      tileProvider: NetworkTileProvider(),
    );
  }
}
