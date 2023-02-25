part of 'driverlist_bloc.dart';

@immutable
abstract class DriverlistEvent {}

class FetchDriver extends DriverlistEvent {}

class FetchDeleteDriver extends DriverlistEvent {
  final String driverId;

  FetchDeleteDriver({required this.driverId});
}

class FetchAddDriver extends DriverlistEvent {
  final String name;
  final String mobile;
  final String licenseNo;

  FetchAddDriver(
      {required this.name, required this.mobile, required this.licenseNo});
}
