import 'package:flutter/material.dart';
import 'package:photo/features/auth/presentation/widgets/button_widget.dart';

import '../../../../auth/presentation/widgets/custom_view.dart';

class DiscoverPage extends StatelessWidget {
  DiscoverPage({super.key});

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
              const SizedBox(height: 32),
              const Text(
                "WHAT’S NEW TODAY",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 1; i < 5; i++)
                        Container(
                          width: 343,
                          margin: const EdgeInsets.only(left: 16, right: 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/discovery/$i.png",
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 24),
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
                                              fontWeight: FontWeight.w700,
                                            )),
                                        Text(
                                          "@ridzjcob",
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                          ),
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
              ),
              const SizedBox(height: 48),
              const Text(
                "BROWSE ALL",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Две колонки
                    crossAxisSpacing: 9.0, // Расстояние между столбцами
                    mainAxisSpacing: 10.0, // Расстояние между строками
                  ),
                  itemCount: phEmail.length, // Количество изображений
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      'assets/photo/ph$index.png',
                      height: 220,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              ButtonWidget(
                onPressed: () {},
                color: BorderSide(color: Colors.black),
                text: "SEE MORE",
              )
            ],
          ),
        ),
      ),
    );
  }
}

var phEmail = <String>[
  'assets/photo/ph0.png',
  'assets/photo/ph1.png',
  'assets/photo/ph2png',
  'assets/photo/ph3.png',
  'assets/photo/ph4.png',
  'assets/photo/ph5.png',
  'assets/photo/ph6.png',
  'assets/photo/ph7.png',
  'assets/photo/ph8.png',
  'assets/photo/ph9.png',
];
