part of 'driverlist_bloc.dart';

@immutable
abstract class DriverlistState {}

class DriverlistInitial extends DriverlistState {}

class DriverlistLoading extends DriverlistState {}

class DriverlistLoaded extends DriverlistState {}

class DriverlistError extends DriverlistState {}

class DriverlistDeleted extends DriverlistState {}

class DriverlistAdded extends DriverlistState {}
