// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:news_app/Models-Views/BottomNavBar.dart';
import 'package:news_app/Views/FavoriesPage.dart';
import 'package:news_app/Views/HomePage.dart';
import 'package:news_app/Views/SearchPage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late BottomNavBar _bottomNavBar;
  @override
  void initState() {
    _bottomNavBar = BottomNavBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Breaking News",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<NavBarItem>(
          stream: _bottomNavBar.itemStream,
          initialData: _bottomNavBar.defaultItem,
          builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
            switch (snapshot.data) {
              case NavBarItem.HOME:
                return HomePage();
              case NavBarItem.SEARCH:
                return SearchPage();
              case NavBarItem.FAVORITE:
                return FavoritePage();
            }
            return Container();
          },
        ),
      ),
      bottomNavigationBar: StreamBuilder(
        stream: _bottomNavBar.itemStream,
        initialData: _bottomNavBar.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.deepOrange.shade200,
                    spreadRadius: 3,
                    blurRadius: 8)
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5), topLeft: Radius.circular(5)),
              child: BottomNavigationBar(
                backgroundColor: Colors.black,
                iconSize: 25,
                unselectedItemColor: Colors.white,
                unselectedFontSize: 9.5,
                selectedFontSize: 9.5,
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.deepOrange.shade200,
                currentIndex: snapshot.data!.index,
                onTap: _bottomNavBar.pickItem,
                items: [
                  BottomNavigationBarItem(
                    label: "Home",
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    label: "Search",
                    icon: Icon(Icons.search),
                  ),
                  BottomNavigationBarItem(
                    label: "Favorite",
                    icon: Icon(Icons.favorite),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
