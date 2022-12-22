import 'package:flutter/material.dart';
import 'package:netflix_clone/shared/styles.dart';
import 'package:stacked/stacked.dart';

import '../../services/video_service.dart';
import 'detail_screen_viewmodel.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailScreenViewModel>.reactive(
      viewModelBuilder: () => DetailScreenViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.60,
                    width: double.infinity,
                    child: const Videoplayer(
                      videoLink:
                          'https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.mp4/.m3u8',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.arrow_back,
                        color: kcWhiteColor1,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
