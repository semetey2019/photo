import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo/features/auth/presentation/widgets/button_widget.dart';

import '../../data/datasourse/profile_data_sourse.dart';
import '../../data/model/post_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PostModel? _postModel;

  void getData() async {
    _postModel = await ApiPosts().getUsers();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            //  _postModel == null
            //     ? const Center(
            //         child: CircularProgressIndicator(),
            //       )
            //     :
            SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
            child: Column(
              children: [
                Center(
                  child: Image.asset("assets/profile/girl.png"),
                ),
                const SizedBox(height: 32),
                Text(
                  "Jane",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Comfortaa-Bold",
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "SAN FRUNSISCO, CA",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 32),
                ButtonWidget(
                    onPressed: () {
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (_) => LoginPage()));
                    },
                    color: const BorderSide(color: Colors.white),
                    textColor: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w900),
                    backgroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 52),
                    text: "FOLLOW JANE"),
                const SizedBox(height: 32),
                ButtonWidget(
                    onPressed: () {
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (_) => LoginPage()));
                    },
                    color: const BorderSide(color: Colors.white),
                    textColor: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w900),
                    backgroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 52),
                    text: "MESSAGE"),
                const SizedBox(height: 32),
                MasonryGridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
                const SizedBox(height: 10),
                ButtonWidget(
                  onPressed: () {},
                  color: const BorderSide(color: Colors.black),
                  text: "SEE MORE",
                  minimumSize: const Size(double.infinity, 52),
                  textColor: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w900),
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
