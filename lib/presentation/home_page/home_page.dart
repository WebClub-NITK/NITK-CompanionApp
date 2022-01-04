import 'package:flutter/material.dart';
import 'package:utilapp/presentation/Feed/feed.dart';
import 'package:utilapp/presentation/News/news.dart';
import 'package:utilapp/presentation/Search/search.dart';
import 'package:utilapp/presentation/home_page/drawer_item.dart';
import 'package:utilapp/presentation/Map/map.dart';
import 'package:utilapp/presentation/maps/test.dart';
import 'package:utilapp/presentation/mess_menu/mess.dart';
import 'package:utilapp/res/colors.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String user = "Guest";
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomePage> {
  int _currentIndex = 0;
  int _bottom_Navigation_index = 0;
  String _title = "Feed";

  final List<Widget> _children = [
    Feed(),
    News(),
    Search(),
    TestPage(),
    Mess(),
  ];
  final drawerItems = [
    new DrawerItem(id: "1", title: "Feed", icon: "feed.png", isSelected: true),
    new DrawerItem(id: "2", title: "News", icon: "news.png", isSelected: false),
    new DrawerItem(
        id: "3", title: "Explore", icon: "search.png", isSelected: false),
    new DrawerItem(id: "4", title: "Map", icon: "map.png", isSelected: false),
    new DrawerItem(
        id: "5", title: "Mess Menu", icon: "mess.png", isSelected: false),
    //new DrawerItem(id:"6",title:"Placement", icon:"assets/placement.png",isSelected: false),
    //new DrawerItem(id:"7",title:"Internship", icon:"assets/internship.png",isSelected: false),
    //new DrawerItem(id:"8",title:"Calendar", icon:"assets/calendar.png",isSelected: false),
    //new DrawerItem(id:"9",title:"Complaints/Suggestions", icon:"assets/complaints.png",isSelected: false),
    //new DrawerItem(id:"10",title:"Settings", icon:"assets/settings.png",isSelected: false),
  ];
  selected(int index) {
    for (int i = 0; i < drawerItems.length; i++) {
      setState(() {
        if (i == index) {
          drawerItems[i].isSelected = true;
        } else {
          drawerItems[i].isSelected = false;
        }
      });
    }
  }

  title(int index) {
    _title = drawerItems[index].title;
  }

  _onSelectItem(int index) {
    setState(() {
      _currentIndex = index;
      _bottom_Navigation_index = _currentIndex > 3 ? 0 : _currentIndex;
      title(_currentIndex);
    });
    selected(index);
    Navigator.of(context).pop(); // close the drawer
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _bottom_Navigation_index = _currentIndex;
      title(_currentIndex);
      selected(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(new Container(
        child: new ListTile(
          leading: d.isSelected
              ? Image.asset(d.icon, color: LightColors.white)
              : Image.asset(
                  d.icon,
                  color: LightColors.darkGrey,
                ),
          title: new Text(
            d.title,
            style: d.isSelected
                ? new TextStyle(color: LightColors.white, fontSize: 16)
                : new TextStyle(color: LightColors.darkGrey, fontSize: 16),
          ),
          selected: i == _currentIndex,
          selectedTileColor: LightColors.darkGrey,
          onTap: () => _onSelectItem(i),
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: LightColors.black),
        title: Text(
          _title,
          style: TextStyle(color: LightColors.black),
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment(-1.0, 1.0),
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? MediaQuery.of(context).size.height * 0.3
                      : MediaQuery.of(context).size.height * 0.2,
                  color: Theme.of(context).primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.account_circle_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.user,
                        style: TextStyle(
                            color: LightColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                new Column(children: drawerOptions)
              ],
            ),
          ),
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onTabTapped,
        currentIndex: _bottom_Navigation_index,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: Image.asset("feed.png"),
              label: "",
              activeIcon: CircleAvatar(
                child: Image.asset(
                  "feed.png",
                  color: Theme.of(context).primaryColor,
                ),
                backgroundColor: Colors.black,
              )),
          new BottomNavigationBarItem(
              icon: Image.asset("news.png"),
              label: "",
              activeIcon: CircleAvatar(
                child: Image.asset(
                  "news.png",
                  color: Theme.of(context).primaryColor,
                ),
                backgroundColor: Colors.black,
              )),
          new BottomNavigationBarItem(
              icon: Image.asset("search.png"),
              label: "",
              activeIcon: CircleAvatar(
                child: Image.asset(
                  "search.png",
                  color: Theme.of(context).primaryColor,
                ),
                backgroundColor: Colors.black,
              )),
          new BottomNavigationBarItem(
              icon: Image.asset("map.png"),
              label: "",
              activeIcon: CircleAvatar(
                child: Image.asset(
                  "map.png",
                  color: Theme.of(context).primaryColor,
                ),
                backgroundColor: Colors.black,
              )),
        ],
      ),
    );
  }
}
