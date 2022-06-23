import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:kort_og_bbr/components/DKProjection.dart';
import 'package:kort_og_bbr/components/TileLayerList.dart';
import 'package:kort_og_bbr/plugins/scale_layer_plugin_option.dart';
import 'package:kort_og_bbr/plugins/zoombuttons_plugin_option.dart';
import 'package:latlong2/latlong.dart';

class KortOgBBRMap extends StatelessWidget {
  final dkprojection = DKProjection();
  final List<TileLayerOptions> layers = TileLayerList().layers;

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
      layers: layers,
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
