import 'package:flutter/cupertino.dart';

class DrawerItem{
  final String  id;
  final String title;
  final String icon;
  bool isSelected;
   DrawerItem({
@required this.id,
    @required this.title,
    @required this.icon,
     @required this.isSelected,
});
}