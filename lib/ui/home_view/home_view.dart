import 'package:flutter/material.dart';
import 'package:netflix_clone/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Image.asset(
                        'assets/images/netflix_logo.png',
                      ),
                    ),
                  ),
                  titleText('Continue watching'),
                  verticalSpaceSmall,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        movieBox(model, context, 'assets/images/movie_1.jpg',
                            'S1:E1'),
                        horizontalSpaceSmall,
                        movieBox(model, context, 'assets/images/movie_2.jpg',
                            'S2:E5'),
                        horizontalSpaceSmall,
                        movieBox(model, context, 'assets/images/movie_3.jpg',
                            'S6:E9'),
                      ],
                    ),
                  ),
                  verticalSpaceSmall,
                  titleText('My list'),
                  verticalSpaceSmall,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        myListBox(model, context, 'assets/images/movie_7.jpg'),
                        horizontalSpaceSmall,
                        myListBox(model, context, 'assets/images/movie_5.jpg'),
                        horizontalSpaceSmall,
                        myListBox(model, context, 'assets/images/movie_6.jpg'),
                        horizontalSpaceSmall,
                        myListBox(model, context, 'assets/images/movie_4.jpg'),
                        horizontalSpaceSmall,
                        myListBox(model, context, 'assets/images/movie_2.jpg'),
                        horizontalSpaceSmall,
                        myListBox(model, context, 'assets/images/movie_1.jpg'),
                      ],
                    ),
                  ),
                  verticalSpaceSmall,
                  titleText('NETFLIX ORIGINALS'),
                  verticalSpaceSmall,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        myListBox(model, context, 'assets/images/movie_1.jpg'),
                        horizontalSpaceSmall,
                        myListBox(model, context, 'assets/images/movie_2.jpg'),
                        horizontalSpaceSmall,
                        myListBox(model, context, 'assets/images/movie_3.jpg'),
                        horizontalSpaceSmall,
                        myListBox(model, context, 'assets/images/movie_4.jpg'),
                        horizontalSpaceSmall,
                        myListBox(model, context, 'assets/images/movie_5.jpg'),
                        horizontalSpaceSmall,
                        myListBox(model, context, 'assets/images/movie_6.jpg'),
                        horizontalSpaceSmall,
                        myListBox(model, context, 'assets/images/movie_7.jpg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget myListBox(
      HomeViewModel model, BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () => model.navigateToDetailView(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.20,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Row titleText(String title) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Icon(Icons.chevron_right_sharp),
      ],
    );
  }

  Widget movieBox(HomeViewModel model, BuildContext context, String imagePath,
      String episode) {
    return GestureDetector(
      onTap: () => model.navigateToDetailView(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: const Color(0xffdddfe3).withOpacity(0.7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      episode,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.play_circle_outline),
                        horizontalSpaceTiny,
                        Text(
                          'Play',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 9,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
