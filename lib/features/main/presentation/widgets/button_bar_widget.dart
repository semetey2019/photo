import 'package:flutter/material.dart';
import 'package:photo/features/chat/presentation/pages/chat_page.dart';

import 'package:photo/features/main/presentation/pages/home/home_page.dart';
import 'package:photo/features/search/presentation/pages/search_photo.dart';

import '../../../profile/presentation/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: _currentIndex,
      keepPage: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            _currentIndex = value;
            setState(() {});
          },
          children: const [
            DiscoverPage(),
            SearchPhotoPage(),
            Scaffold(),
            ChatPage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/navigate/new.png",
              height: 40,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: SizedBox(
              height: 40,
              width: 70,
              child: DecoratedBox(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffff00d6), Color(0xffff4c00)],
                  ),
                ),
              ),
            ),
            // Пустой элемент для центральной кнопки
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/navigate/comment.png",
              height: 40,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/navigate/bell.png",
              height: 40,
            ),
            label: '',
          ),
        ],
        onTap: (index) {
          _onTabTapped(index);
        },
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 10),
      curve: Curves.bounceIn,
    );
  }
}
