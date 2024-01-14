import 'package:flutter/material.dart';

import 'package:photo/features/auth/presentation/widgets/text_form_widget.dart';

import '../../../../auth/presentation/widgets/button_widget.dart';

class SearchPhotoPage extends StatefulWidget {
  const SearchPhotoPage({super.key});

  @override
  State<SearchPhotoPage> createState() => _SearchPhotoPageState();
}

class _SearchPhotoPageState extends State<SearchPhotoPage> {
  final _formKey = GlobalKey<FormState>();

  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Comfortaa-Bold",
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextFormFieldWidget(
                    hintStyle: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    hinText: "Search all photos",
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    "ALL RESULTS",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 24),
                  GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        'assets/photo/ph${index + 1}.png',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  ButtonWidget(
                    onPressed: () {},
                    color: const BorderSide(color: Colors.black),
                    text: "SEE MORE",
                    minimumSize: const Size(double.infinity, 52),
                    textColor: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
