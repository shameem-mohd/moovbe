part of 'userbloc_bloc.dart';

@immutable
abstract class UserblocState {}

class UserblocInitial extends UserblocState {}

class UserblocLoading extends UserblocState {}

class UserblocLoaded extends UserblocState {}

class UserblocError extends UserblocState {}
