

import 'package:flutter/material.dart';
import 'package:volume/volume.dart';

class VolumeSlider extends StatefulWidget {
  @override
  _VolumeSliderState createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  double sliderValue=0.0;
  int maxVol, currentVol;

  @override
  void initState() {
    super.initState();
    updateVolumes();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    await Volume.controlVolume(AudioManager.STREAM_MUSIC); // you can change which volume you want to change.
  }

  updateVolumes() async {
    maxVol = await Volume.getMaxVol;
    currentVol = await Volume.getVol;
    setState(() {
      sliderValue = currentVol.toDouble();
    });
  }

  setVol(int i) async {
    await Volume.setVol(i);
  }


  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Slider(
        activeColor: Colors.indigoAccent,
        min: 0.0,
        max: 15.0,
        onChanged: (newRating) async {
          setState(() {
            sliderValue = newRating;
          });
          await setVol(newRating.toInt());
          await updateVolumes();
        },
        value: sliderValue,
      ),
    );
  }
}
