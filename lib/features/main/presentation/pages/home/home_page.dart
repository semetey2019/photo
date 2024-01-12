import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo/features/auth/presentation/widgets/button_widget.dart';
import '../../../../auth/presentation/widgets/custom_view.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 32, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Discover",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Comfortaa-Bold",
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "WHAT’S NEW TODAY",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 1; i < 5; i++)
                      Container(
                        width: 300,
                        margin: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              "assets/discovery/$i.png",
                              // imagePath,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                for (int i = 1; i < 5; i++)
                                  CustomImageView(
                                    imagePath: "assets/ellipses/$i.png",
                                    height: 28,
                                    width: 28,
                                    radius: BorderRadius.circular(14),
                                  ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Ridhwan Nordin",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700)),
                                      Text(
                                        "@ridzjcob",
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "BROWSE ALL",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: MasonryGridView.builder(
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                  itemCount: 9,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(
                      'assets/photo/ph${index + 1}.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 32),
                child: ButtonWidget(
                  onPressed: () {},
                  color: const BorderSide(color: Colors.black),
                  text: "SEE MORE",
                  minimumSize: const Size(double.infinity, 52),
                  textColor: const TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const BottomWidget(),
    );
  }
}

var photos = <String>[
  'assets/photo/ph0.png',
  'assets/photo/ph1.png',
  'assets/photo/ph2.png',
  'assets/photo/ph3.png',
  'assets/photo/ph4.png',
  'assets/photo/ph5.png',
  'assets/photo/ph6.png',
  'assets/photo/ph7.png',
  'assets/photo/ph8.png',
  'assets/photo/ph9.png',
];
