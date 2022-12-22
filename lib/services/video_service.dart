import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Videoplayer extends StatefulWidget {
  final String? videoLink;
  const Videoplayer({Key? key, this.videoLink}) : super(key: key);

  @override
  State<Videoplayer> createState() => _VideoplayerState();
}

class _VideoplayerState extends State<Videoplayer> {
  Future<void>? videoPlayerFuture;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoLink!);
    videoPlayerFuture = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    _videoPlayerController.play();
    _videoPlayerController.setVolume(0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // _videoPlayerController.value.isPlaying
        //     ? _videoPlayerController.pause()
        //     : _videoPlayerController.play();
      },
      child: Stack(
        children: [
          SizedBox(
            // color: Colors.black,
            // height: 250,
            width: MediaQuery.of(context).size.width,
            // color: Colors.red,
            child: Column(
              children: [
                FutureBuilder(
                  future: videoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          // Positioned.fill(
          //   child: BasicOverlayWidget(controller: _videoPlayerController),
          // ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   child: IconButton(
          //       onPressed: () {
          //         setState(() {
          //           _videoPlayerController.value.isPlaying
          //               ? _videoPlayerController.pause()
          //               : _videoPlayerController.play();
          //         });
          //       },
          //       icon: Icon(
          //         _videoPlayerController.value.isPlaying
          //             ? Icons.pause
          //             : Icons.play_arrow,
          //         color: Colors.white,
          //       )),
          // )
        ],
      ),
    );
  }
}

class BasicOverlayWidget extends StatefulWidget {
  final VideoPlayerController controller;
  const BasicOverlayWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<BasicOverlayWidget> createState() => _BasicOverlayWidgetState();
}

class _BasicOverlayWidgetState extends State<BasicOverlayWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Positioned(
        //   left: 48,
        //   bottom: 30,
        //   child: Text(
        //     getPosition(),
        //     style: const TextStyle(color: Colors.white),
        //   ),
        // ),
        Positioned(
          bottom: 5,
          left: 0,
          right: 0,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: VideoProgressIndicator(
                    widget.controller,
                    allowScrubbing: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String getPosition() {
    final duration = Duration(
      milliseconds: widget.controller.value.position.inMilliseconds.round(),
    );
    return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }
}
