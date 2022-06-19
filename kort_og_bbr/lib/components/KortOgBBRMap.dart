import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kort_og_bbr/components/DKProjection.dart';
import 'package:latlong2/latlong.dart';
import 'package:kort_og_bbr/plugins/scale_layer_plugin_option.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:kort_og_bbr/plugins/zoombuttons_plugin_option.dart';

class KortOgBBRMap extends StatelessWidget {
  final dkprojection = DKProjection();

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        crs: dkprojection.getCRS(),
        center: LatLng(-15.343678, 88.97539), // Center of Copenhagen
        zoom: 10,
        maxZoom: dkprojection.getMaxZoom(),
        onTap: (tapPosition, point) => {
          print(point.toString()),
        },
        plugins: [
          ScaleLayerPlugin(),
          ZoomButtonsPlugin(),
        ],
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
            },
            urlTemplate:
                "https://services.datafordeler.dk/DKskaermkort/topo_skaermkort_wmts/1.0.0/Wmts?USERNAME={username}&PASSWORD={password}&SERVICE={service}&VERSION={version}&REQUEST={request}&FORMAT={format}&LAYER={layer}&STYLE={style}&TILEMATRIXSET={tilematrixset}&TILEMATRIX={z}&TILEROW={y}&TILECOL={x}",
            tileProvider: NetworkTileProvider()),
      ],
      nonRotatedLayers: [
        ScaleLayerPluginOption(
          lineColor: Colors.blue,
          lineWidth: 2,
          textStyle: const TextStyle(color: Colors.blue, fontSize: 12),
          padding: const EdgeInsets.all(10),
        ),
        ZoomButtonsPluginOption(
          minZoom: 4,
          maxZoom: 19,
          mini: true,
          padding: 10,
          alignment: Alignment.bottomRight,
        ),
      ],
    );
  }
}
