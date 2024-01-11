import 'package:flutter/material.dart';
import 'package:photo/features/auth/presentation/pages/login_page.dart';
import '../widgets/custom_view.dart';
import 'register_page.dart';

class LoggedOutScreen extends StatelessWidget {
  LoggedOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 768,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              CustomImageView(
                imagePath: "assets/images/rectangle.png",
                height: 707,
                width: double.infinity,
                alignment: Alignment.topCenter,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 38,
                                  width: 38,
                                  margin: const EdgeInsets.only(
                                    top: 2,
                                    bottom: 13,
                                  ),
                                  child: const Stack(
                                    alignment: Alignment.center,
                                    children: [],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset("assets/images/union1.png"),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Image.asset(
                                          "assets/images/union.png"),
                                    ),
                                    Image.asset(
                                      "assets/images/photo.png",
                                      height: 54,
                                      width: 148,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 294),
                      Row(
                        children: [
                          CustomImageView(
                            imagePath: "assets/images/ellipse.png",
                            height: 28,
                            width: 28,
                            radius: BorderRadius.circular(
                              14,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Pawel Czerwinski",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                    )),
                                Text(
                                  "@pawel_czerwinski",
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
                      const SizedBox(height: 20),
                      ColoredBox(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 167,
                              height: 52,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: const Border(
                                    top: BorderSide(
                                        width: 3, color: Colors.black),
                                    left: BorderSide(
                                        width: 3, color: Colors.black),
                                    right: BorderSide(
                                        width: 3, color: Colors.black),
                                    bottom: BorderSide(
                                        width: 3, color: Colors.black),
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const LoginPage()));
                                    },
                                    child: const Text(
                                      "LOG IN",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 9),
                            SizedBox(
                              width: 167,
                              height: 52,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const RegisterPage()));
                                    },
                                    child: const Text(
                                      "REGISTER",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
