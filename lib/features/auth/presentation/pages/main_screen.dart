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
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomImageView(
              imagePath: "assets/images/rectangle.png",
              width: double.infinity,
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                Row(
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
                    Image.asset("assets/images/photo2.png"),
                  ],
                ),
                const SizedBox(height: 294),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
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
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 167,
                            height: 52,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 3),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => const LoginPage()));
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
