import 'package:flutter/material.dart';
import 'package:kort_og_bbr/constants.dart';
import 'package:kort_og_bbr/widgets/KortOgBBRMap.dart';

class GpsActionButton extends StatelessWidget {
  final bool showButton;

  GpsActionButton(this.showButton);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: showButton ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: FloatingActionButton(
        onPressed: () => updateGPS(),
        backgroundColor: kMainBackgroundColor,
        child: const Icon(Icons.gps_fixed),
      ),
    );
  }

  void updateGPS() {
    print('GPS button clicked');

    // TODO: Handle GPS
  }
}
