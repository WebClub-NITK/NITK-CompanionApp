import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utilapp/domain/maps/usecase/get_list_of_locations.dart';
import 'package:utilapp/injection_container.dart';
import 'package:utilapp/presentation/maps/bloc/list_locations_bloc.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ListCollegeLocationsBloc>()
        ..add(const ListCollegeLocationsEvent.getListOfCollegeLocations()),
      child: BlocConsumer<ListCollegeLocationsBloc, ListCollegeLocationsState>(
        listener: (context, state) {
          state.map(
            initial: (_) {},
            loadListOfCollegeLocations: (loaded) {},
            failure: (failState) {},
          );
        },
        builder: (context, state) {
          return Scaffold(
            body: (state is LoadListOfCollegeLocations)
                ? (state.bookingList.length > 0)
                    ? ListView.builder(
                        itemBuilder: (context, index) {
                          return Text(state.bookingList[index].name);
                        },
                      )
                    : Text('No Locations')
                : (state is Failure)
                    ? Text('FAILURE')
                    : CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
