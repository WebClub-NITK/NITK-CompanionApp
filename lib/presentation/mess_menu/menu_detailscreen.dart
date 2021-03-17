import 'package:flutter/material.dart';
import 'package:utilapp/res/colors.dart';
import './mess_menu.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key key, this.hostel}) : super(key: key);
  final Hostel hostel;
  final int day = DateTime.now().weekday;
  List<Widget> _generateTabs() =>
      rotate(daysOfWeek.map((title) => Tab(text: title,)).toList(), day);

  Widget _menu(List<String> food) {
    return Padding(
      padding: EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: food
            .map((f) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            " $f",
            style: TextStyle( fontSize: 16.0),
          ),
        ))
            .toList(),
      ),
    );
  } 
  
  Widget _generateTab(MessMenu menu, BuildContext context) {
    return Tab(
      child:ListView(
        padding: EdgeInsets.all(24.0),
        children: [
          _title("Breakfast"),
          makeCard(_menu(menu.breakfast)) ,
           _title("Lunch"),
          makeCard(_menu(menu.lunch)),
         _title("Snacks"),
          makeCard(_menu(menu.snack)) ,
         _title("Dinner"),
         makeCard( _menu(menu.dinner))
        ],
      ),
    );
  }

  List<Widget> _generateBody(BuildContext context) {
    final List<Widget> tabs =
    this.hostel.menu.map((menu) => _generateTab(menu, context)).toList();
    return rotate(tabs, day);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: daysOfWeek.length,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: LightColors.black),
          title: Text(hostel.name,style: TextStyle(color: LightColors.black),),
          bottom: TabBar(
            tabs: _generateTabs(),
            isScrollable: true,
            labelColor: LightColors.darkGrey,
            indicatorColor: LightColors.darkGrey,
          ),
        ),
        body: TabBarView(
          children: _generateBody(context),
        ),
      ),
    );
  }
    makeCard(Widget list){
    return Card(
    elevation: 4.0,
    shape: RoundedRectangleBorder(
    side: BorderSide(color: Colors.white70, width: 1),
    borderRadius: BorderRadius.circular(10),
  ),
    shadowColor: LightColors.darkGrey,
    borderOnForeground:true,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Container(
        child:list,

  ),);
}
_title(String text){
  return Container(
             decoration: BoxDecoration(
                 color: LightColors.yellow,
               borderRadius: BorderRadius.all(Radius.circular(8))
             ),
             alignment: Alignment.center,
             child:Text(
             text,
             style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,background:Paint()
        ..strokeWidth = 18.0
        ..color = LightColors.yellow
        ..style = PaintingStyle.stroke
        ..strokeJoin = StrokeJoin.round,
          )
          )
          );
}
}

/*
sun 0
mon 1
tue 2
wed 3
thu 4
fri 5
sat 6
*/