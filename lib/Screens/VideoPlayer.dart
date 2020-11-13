
import 'dart:math';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:yellowclass/helper/CameraPreview.dart';
import 'package:yellowclass/helper/Volume.dart';
import 'package:yellowclass/helper/mockData.dart';

import 'VideoPlayerControls.dart';

class LandscapePlayer extends StatefulWidget {
  LandscapePlayer({Key key}) : super(key: key);

  @override
  _LandscapePlayerState createState() => _LandscapePlayerState();
}

class _LandscapePlayerState extends State<LandscapePlayer> {
  FlickManager flickManager;


  @override
  void initState() {
    Random random = new Random();
    int randomNumber = random.nextInt(3);
    super.initState();
    flickManager = FlickManager(
        videoPlayerController:
        VideoPlayerController.network(mockData["items"][randomNumber]["trailer_url"]));
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }
  Offset offset;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            FlickVideoPlayer(
              flickManager: flickManager,
              preferredDeviceOrientation: [
                DeviceOrientation.landscapeRight,
                DeviceOrientation.landscapeLeft
              ],
              systemUIOverlay: [],
              flickVideoWithControls: FlickVideoWithControls(
                controls: LandscapePlayerControls(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 50),
              child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 80,
                        height: 80,
                        color: Colors.black,
                        alignment: Alignment.bottomRight,
                        child: CameraScreen(),
                      ),
                    ),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
