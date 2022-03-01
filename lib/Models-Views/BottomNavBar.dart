import 'dart:async';

enum NavBarItem{HOME, SEARCH, FAVORITE}

class BottomNavBar{
  final StreamController<NavBarItem> _navBarCont = StreamController<NavBarItem>.broadcast();
  
  NavBarItem defaultItem = NavBarItem.HOME;

  Stream<NavBarItem> get itemStream => _navBarCont.stream;

  void pickItem(int i){
    switch(i){
      case 0:
      _navBarCont.sink.add(NavBarItem.HOME);
      break;
      case 1:
      _navBarCont.sink.add(NavBarItem.SEARCH);
      break;
      case 2:
      _navBarCont.sink.add(NavBarItem.FAVORITE);
      break;
    }

  }

  close(){
    _navBarCont.close();
  }
}