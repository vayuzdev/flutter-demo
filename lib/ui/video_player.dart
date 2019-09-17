import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_video_player/flutter_simple_video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo"),
        ),
        body: Column(
          children: <Widget>[

            Container(
              child: YoutubePlayer(
                context: context,
                videoId: "R1XIXSXKuCw",
                flags: YoutubePlayerFlags(
                  mute: false,
                  autoPlay: true,
                  forceHideAnnotation: true,
                  showVideoProgressIndicator: true,
                ),
                videoProgressIndicatorColor: Colors.amber,
                progressColors: ProgressColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
              ),
            ),
          ],
        ));
  }
}
