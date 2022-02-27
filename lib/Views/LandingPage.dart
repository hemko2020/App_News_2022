// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:news_app/Views/Caroussels_News.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Latest news"),
        titleTextStyle:
            const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      body: const SafeArea(
        child: CarouselPage(),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.deepOrange.shade200,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        child: NavigationBar(
            height: 60,
            backgroundColor: Colors.black,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              const NavigationDestination(
                icon: Icon(
                  Icons.dashboard_customize,
                  color: Colors.white,
                ),
                label: "Home",
              ),
              const NavigationDestination(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                label: "Search",
              ),
              const NavigationDestination(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                label: "Favorite",
              ),
            ]),
      ),
    );
  }
}
