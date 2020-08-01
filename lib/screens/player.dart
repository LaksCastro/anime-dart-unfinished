import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Player extends StatefulWidget {
  final String url;
  final String title;

  Player({this.title = 'Chewie Demo', this.url});

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState(url: url);
  }
}

class _ChewieDemoState extends State<Player> {
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;
  final String url;

  _ChewieDemoState({this.url});

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(url);

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Chewie(
                controller: _chewieController,
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              _chewieController.enterFullScreen();
            },
            child: Text('Fullscreen'),
          ),
        ],
      ),
    );
  }
}
