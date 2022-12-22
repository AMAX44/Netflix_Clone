import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/ui/startup_view/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../shared/styles.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: kcWhiteColor1,
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  // height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child:
                      Lottie.asset('assets/animations/netflix_animation.json'),
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (StartUpViewModel model) => model.startupLogic(),
    );
  }
}
