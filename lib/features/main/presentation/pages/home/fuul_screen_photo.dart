import 'package:flutter/material.dart';

import '../../../../auth/presentation/widgets/custom_view.dart';

class FullScreenImage extends StatefulWidget {
  const FullScreenImage({super.key});

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

int i = 1;

class _FullScreenImageState extends State<FullScreenImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 813,
            child: Stack(
              children: [
                Image.asset(
                  "assets/discovery/0.png",
                  height: 813,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 50,
                  left: 25,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: "assets/ellipses/0.png",
                        height: 28,
                        width: 28,
                        radius: BorderRadius.circular(14),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Ridhwan Nordin",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w700)),
                          Text(
                            "@ridzjcob",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
