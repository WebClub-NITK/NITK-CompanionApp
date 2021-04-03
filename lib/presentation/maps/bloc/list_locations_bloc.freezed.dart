// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'list_locations_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ListCollegeLocationsEvent {}

class _$ListCollegeLocationsEventTearOff {
  const _$ListCollegeLocationsEventTearOff();

  GetListOfCollegeLocations getListOfCollegeLocations() {
    return const GetListOfCollegeLocations();
  }
}

const $ListCollegeLocationsEvent = _$ListCollegeLocationsEventTearOff();

class _$GetListOfCollegeLocations implements GetListOfCollegeLocations {
  const _$GetListOfCollegeLocations();

  @override
  String toString() {
    return 'ListCollegeLocationsEvent.getListOfCollegeLocations()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetListOfCollegeLocations);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class GetListOfCollegeLocations implements ListCollegeLocationsEvent {
  const factory GetListOfCollegeLocations() = _$GetListOfCollegeLocations;
}

mixin _$ListCollegeLocationsState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result loadListOfCollegeLocations(List<CollegeLocation> bookingList),
    @required Result failure(AppFailure failure),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loadListOfCollegeLocations(List<CollegeLocation> bookingList),
    Result failure(AppFailure failure),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required
        Result loadListOfCollegeLocations(LoadListOfCollegeLocations value),
    @required Result failure(Failure value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loadListOfCollegeLocations(LoadListOfCollegeLocations value),
    Result failure(Failure value),
    @required Result orElse(),
  });
}

class _$ListCollegeLocationsStateTearOff {
  const _$ListCollegeLocationsStateTearOff();

  Initial initial() {
    return const Initial();
  }

  LoadListOfCollegeLocations loadListOfCollegeLocations(
      List<CollegeLocation> bookingList) {
    return LoadListOfCollegeLocations(
      bookingList,
    );
  }

  Failure failure(AppFailure failure) {
    return Failure(
      failure,
    );
  }
}

const $ListCollegeLocationsState = _$ListCollegeLocationsStateTearOff();

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'ListCollegeLocationsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result loadListOfCollegeLocations(List<CollegeLocation> bookingList),
    @required Result failure(AppFailure failure),
  }) {
    assert(initial != null);
    assert(loadListOfCollegeLocations != null);
    assert(failure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loadListOfCollegeLocations(List<CollegeLocation> bookingList),
    Result failure(AppFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required
        Result loadListOfCollegeLocations(LoadListOfCollegeLocations value),
    @required Result failure(Failure value),
  }) {
    assert(initial != null);
    assert(loadListOfCollegeLocations != null);
    assert(failure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loadListOfCollegeLocations(LoadListOfCollegeLocations value),
    Result failure(Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ListCollegeLocationsState {
  const factory Initial() = _$Initial;
}

class _$LoadListOfCollegeLocations implements LoadListOfCollegeLocations {
  const _$LoadListOfCollegeLocations(this.bookingList)
      : assert(bookingList != null);

  @override
  final List<CollegeLocation> bookingList;

  @override
  String toString() {
    return 'ListCollegeLocationsState.loadListOfCollegeLocations(bookingList: $bookingList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadListOfCollegeLocations &&
            (identical(other.bookingList, bookingList) ||
                const DeepCollectionEquality()
                    .equals(other.bookingList, bookingList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(bookingList);

  @override
  _$LoadListOfCollegeLocations copyWith({
    Object bookingList = freezed,
  }) {
    return _$LoadListOfCollegeLocations(
      bookingList == freezed
          ? this.bookingList
          : bookingList as List<CollegeLocation>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result loadListOfCollegeLocations(List<CollegeLocation> bookingList),
    @required Result failure(AppFailure failure),
  }) {
    assert(initial != null);
    assert(loadListOfCollegeLocations != null);
    assert(failure != null);
    return loadListOfCollegeLocations(bookingList);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loadListOfCollegeLocations(List<CollegeLocation> bookingList),
    Result failure(AppFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadListOfCollegeLocations != null) {
      return loadListOfCollegeLocations(bookingList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required
        Result loadListOfCollegeLocations(LoadListOfCollegeLocations value),
    @required Result failure(Failure value),
  }) {
    assert(initial != null);
    assert(loadListOfCollegeLocations != null);
    assert(failure != null);
    return loadListOfCollegeLocations(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loadListOfCollegeLocations(LoadListOfCollegeLocations value),
    Result failure(Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadListOfCollegeLocations != null) {
      return loadListOfCollegeLocations(this);
    }
    return orElse();
  }
}

abstract class LoadListOfCollegeLocations implements ListCollegeLocationsState {
  const factory LoadListOfCollegeLocations(List<CollegeLocation> bookingList) =
      _$LoadListOfCollegeLocations;

  List<CollegeLocation> get bookingList;

  LoadListOfCollegeLocations copyWith({List<CollegeLocation> bookingList});
}

class _$Failure implements Failure {
  const _$Failure(this.failure) : assert(failure != null);

  @override
  final AppFailure failure;

  @override
  String toString() {
    return 'ListCollegeLocationsState.failure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Failure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  _$Failure copyWith({
    Object failure = freezed,
  }) {
    return _$Failure(
      failure == freezed ? this.failure : failure as AppFailure,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result loadListOfCollegeLocations(List<CollegeLocation> bookingList),
    @required Result failure(AppFailure failure),
  }) {
    assert(initial != null);
    assert(loadListOfCollegeLocations != null);
    assert(failure != null);
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loadListOfCollegeLocations(List<CollegeLocation> bookingList),
    Result failure(AppFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required
        Result loadListOfCollegeLocations(LoadListOfCollegeLocations value),
    @required Result failure(Failure value),
  }) {
    assert(initial != null);
    assert(loadListOfCollegeLocations != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loadListOfCollegeLocations(LoadListOfCollegeLocations value),
    Result failure(Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure implements ListCollegeLocationsState {
  const factory Failure(AppFailure failure) = _$Failure;

  AppFailure get failure;

  Failure copyWith({AppFailure failure});
}
