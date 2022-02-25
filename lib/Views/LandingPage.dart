import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:news_app/Caroussels_News.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latest news"),
        titleTextStyle: const TextStyle(),
      ),
      body: const SafeArea(
        child: CarouselPage(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              highlightColor: Colors.deepOrange.shade100,
              splashRadius: 20,
              onPressed: () {},
              icon: const Icon(Icons.home),
            ),
            IconButton(
              highlightColor: Colors.deepOrange.shade100,
              splashRadius: 20,
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              highlightColor: Colors.deepOrange.shade100,
              splashRadius: 20,
              onPressed: () {},
              icon: const Icon(Icons.favorite),
            ),
            IconButton(
              highlightColor: Colors.deepOrange.shade100,
              splashRadius: 20,
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
