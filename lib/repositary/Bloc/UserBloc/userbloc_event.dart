part of 'userbloc_bloc.dart';

@immutable
abstract class UserblocEvent {}

class FetchUser extends UserblocEvent {
  final String username;
  final String password;

  FetchUser({
    required this.username,
    required this.password,
  });
}
