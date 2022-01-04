import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:utilapp/domain/maps/usecase/get_list_of_locations.dart';
import 'package:utilapp/injection_container.dart';
import 'package:utilapp/presentation/maps/bloc/list_locations_bloc.dart';
import 'package:utilapp/presentation/maps/college_map_page.dart';
import 'package:utilapp/application/usecase/location_type_mapping.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
  }

  final spinkit = SpinKitCubeGrid(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
          decoration: BoxDecoration(
        color: Color(0xFFfeca59),
      ));
    },
  );
  LocationTypeMapping locationTypeMapping = new LocationTypeMapping();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ListCollegeLocationsBloc>()
        ..add(const ListCollegeLocationsEvent.getListOfCollegeLocations()),
      child: BlocConsumer<ListCollegeLocationsBloc, ListCollegeLocationsState>(
        listener: (context, state) {
          state.map(
            initial: (_) {},
            loadListOfCollegeLocations: (loaded) {
              for (int i = 0; i < loaded.bookingList.length; i++) {
                loaded.bookingList[i].type =
                    locationTypeMapping.getLocationTypeFromAbbreviation(
                        loaded.bookingList[i].type);
                print("PRINTING TYPE ${loaded.bookingList[i].type}");
                loaded.bookingList[i].latLng = LatLng(
                    double.parse(loaded.bookingList[i].latitude),
                    double.parse(loaded.bookingList[i].longitude));
                loaded.bookingList[i].image = "assets/destination.png";
                // switch (loaded.bookingList[i].type) {
                //   case "AB":
                //     loaded.bookingList[i].image = "AB.jpg";
                //     break;
                //   case "LH":
                //     loaded.bookingList[i].image = "LH.jpg";
                //     break;
                //   case "HB":
                //     loaded.bookingList[i].image = "HB.jpg";
                //     break;
                //   case "AM":
                //     loaded.bookingList[i].image = "AM.jpg";
                //     break;
                //   case "EAT":
                //     loaded.bookingList[i].image = "EAT.jpg";
                //     break;
                //   case "SH":
                //     loaded.bookingList[i].image = "SH.jpg";

                //     break;
                //   case "MISC":
                //     loaded.bookingList[i].image = "MISC.jpg";
                //     break;
                //   default:
                // }
              }
            },
            failure: (failState) {},
          );
        },
        builder: (context, state) {
          return Scaffold(
            body: (state is LoadListOfCollegeLocations)
                ? (state.bookingList.length > 0)
                    ? MapsPage(state.bookingList)
                    : Center(child: Text('No Locations'))
                : (state is Failure)
                    ? Center(child: Text('FAILURE'))
                    : Center(child: spinkit),
          );
        },
      ),
    );
  }
}