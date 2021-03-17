import 'package:flutter/material.dart';
import 'package:utilapp/presentation/mess_menu/menu_detailscreen.dart';
import 'package:utilapp/res/colors.dart';
import 'mess_menu.dart';

class Mess extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return _buildHostels();
  }

  Widget _buildHostels() {
    return Container(
      margin: EdgeInsets.all(8),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return makeCard(index,context);
          },
          separatorBuilder: (context, index) => Divider( color: LightColors.white,),
          itemCount: hostelMenus.length),
    );
  }

  Widget _buildHostelItem(Hostel hostelMenu, BuildContext context) {
    return ListTile(
      title: Text(hostelMenu.name,style: TextStyle(fontFamily: "Montserrat",fontSize: 18),),
      trailing: Icon(Icons.keyboard_arrow_right,color: Theme.of(context).accentColor,),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailScreen(hostel: hostelMenu);
        }));
      },
    );
  }
  makeCard(int index,BuildContext context){
    return Card(
    elevation: 5.0,
    shape: RoundedRectangleBorder(
    side: BorderSide(color: Colors.white70, width: 1),
    borderRadius: BorderRadius.circular(10),
  ),
    shadowColor: LightColors.darkGrey,
    borderOnForeground:true,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
      child: Container(
        child: _buildHostelItem(hostelMenus[index], context),

  ),);
}
}