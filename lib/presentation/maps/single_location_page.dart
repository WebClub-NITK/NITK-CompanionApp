import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:utilapp/domain/maps/entity/location.dart';

class SingleLocationPage extends StatelessWidget {
  final CollegeLocation collegeLocation;

  const SingleLocationPage(this.collegeLocation, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/nitk.jpg',
                fit: BoxFit.fitWidth,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 20.0),
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.locationArrow),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Text(collegeLocation.name),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.book),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Text(collegeLocation.description),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.mapMarked),
                Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Text(
                      collegeLocation.latitude +
                          " " +
                          collegeLocation.longitude,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.listAlt),
                Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Text(collegeLocation.type ?? 'No Type'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
