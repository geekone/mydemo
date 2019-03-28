import 'package:flutter/material.dart';

//pages
import 'package:spapp/view/page/homepage.dart';
import 'package:spapp/view/page/leaguepage.dart';
import 'package:spapp/view/page/teampage.dart';



class MainPage extends StatefulWidget {
  final Widget child;

  MainPage({Key key, this.child}) : super(key: key);

  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: IndexedStack(
            children: <Widget>[
              HomePage(),
              LeaguePage(),
              TeamPage(),
            ],
            index: _selectIndex,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home")
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text("League")
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.hotel),
                title: Text("Team")
              )
            ],
            currentIndex: _selectIndex,
            // fixedColor: Colors.deepPurple,
            onTap: (index){
              setState(() {
                _selectIndex = index;
              });
            },
          ),
    );

  }
}