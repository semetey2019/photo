import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo/features/auth/presentation/widgets/button_widget.dart';
import 'package:photo/features/chat/presentation/pages/fuul_screen_photo.dart';
import '../../../../auth/presentation/widgets/custom_view.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                SizedBox(
                  height: 387,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, i) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 340,
                          height: 340,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => FullScreenImage(
                                            index: i,
                                          )));
                            },
                            child: Image.asset(
                              "assets/discovery/${i}.png",
                              width: 340,
                              height: 340,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              imagePath: "assets/ellipses/${i}.png",
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
                          ],
                        ),
                      ],
                    ),
                    separatorBuilder: (context, idx) =>
                        const SizedBox(width: 10),
                    itemCount: 4,
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  "BROWSE ALL",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                MasonryGridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
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
                const SizedBox(height: 10),
                ButtonWidget(
                  onPressed: () {},
                  color: const BorderSide(color: Colors.black),
                  text: "SEE MORE",
                  minimumSize: const Size(double.infinity, 52),
                  textColor: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
