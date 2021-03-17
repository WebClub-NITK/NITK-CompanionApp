class MessMenu {
  const MessMenu({this.breakfast, this.lunch, this.snack, this.dinner});
  final List<String> breakfast;
  final List<String> lunch;
  final List<String> snack;
  final List<String> dinner;
}

class Hostel {
  const Hostel({this.name, this.menu});
  final String name;
  final List<MessMenu> menu;
}

final _singleMenu = MessMenu(
    breakfast: ["Puri", "Boiled Peanut","Tea","Coffee","Egg"],
    lunch: ["Rice", "Chapaati", "Veg Makkhanwala","Tomato Rice"],
    snack: ["Maggi","gobi","Coffee"],
    dinner: ["Soyabean Curry", "Fruits", "Dal Fry","Curd"]);

final _menuList = [for (var i = 0; i < 7; i += 1) _singleMenu];

final List<Hostel> hostelMenus = [
  Hostel(name: "Block 1 mess", menu: _menuList),
  Hostel(name: "Block 2 mess", menu: _menuList),
  Hostel(name: "Block 3 mess", menu: _menuList),
  Hostel(name: "Block 4 mess", menu: _menuList),
  Hostel(name: "Block 5 mess", menu: _menuList),
];

final List<String> daysOfWeek = [
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday"
];

List<Object> rotate(List<Object> list, int v) {
  if (list == null || list.isEmpty) return list;
  var i = v % list.length;
  return list.sublist(i)..addAll(list.sublist(0, i));
}