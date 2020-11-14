
import 'dart:math';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:yellowclass/helper/CameraPreview.dart';
import 'package:yellowclass/helper/Volume.dart';
import 'package:yellowclass/helper/Videos.dart';
import 'package:yellowclass/helper/rough.dart';

import 'VideoPlayerControls.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer({Key key}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  FlickManager flickManager;
  double top=0;
  double left=0;

  @override
  void initState() {
    Random random = new Random();
    int randomNumber = random.nextInt(3);
    super.initState();
    flickManager = FlickManager(
        videoPlayerController:
        VideoPlayerController.network(Videos["Videos"][randomNumber]["link"]));
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
                controls: VideoPlayerControls(),
              ),
            ),
            Draggable(
              child: Container(
                padding: EdgeInsets.only(top: top, left: left),
                child: DragItem(),
              ),
              feedback: Container(
                padding: EdgeInsets.only(top: top, left: left),
                child: DragItem(),
              ),
              childWhenDragging: Container(
                padding: EdgeInsets.only(top: top, left: left),
                child: DragItem(),
              ),
              onDragCompleted: () {},
              onDragEnd: (drag) {
                setState(() {
                  if((top + drag.offset.dy) > (300.0 - 30.0)){
                    top = (300.0 - 30.0);
                  }else if((top + drag.offset.dy-30.0) < 0.0){
                    top = 0;
                  }else{
                    top =  top + drag.offset.dy-30.0;
                  }
                  if((left + drag.offset.dx) > (300.0 - 30.0)){
                    left = (300.0 - 30.0);
                  }else if((left + drag.offset.dx-30.0) < 0.0){
                    left = 0;
                  }else{
                    left =  left + drag.offset.dx-30.0;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
