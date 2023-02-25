import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moovbe_bus_project/model/UserModel.dart';
import 'package:moovbe_bus_project/repositary/Api/UserApi/UserApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'userbloc_event.dart';
part 'userbloc_state.dart';

class UserblocBloc extends Bloc<UserblocEvent, UserblocState> {
  late UserModel userModel;
  UserApi userApi = UserApi();
  UserblocBloc() : super(UserblocInitial()) {
    on<FetchUser>((event, emit) async {
      final preference = await SharedPreferences.getInstance();
      emit(UserblocLoading());
      try {
        userModel = await userApi.getUser(
            username: event.username, password: event.password);
        preference.setString("userId", userModel.urlId!);
        preference.setString("token", userModel.access!);
        // preference.setString("token", userModel.access!);
        if (userModel.status!) {
          emit(UserblocLoaded());
        } else {
          emit(UserblocError());
        }
      } catch (e) {
        print("Error>>>>>>>>>>>>>>>>>>>>>>>>>" + e.toString());
        emit(UserblocError());
      }

      // TODO: implement event handler
    });
  }
}
