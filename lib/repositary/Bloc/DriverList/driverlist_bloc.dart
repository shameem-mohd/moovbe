import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moovbe_bus_project/model/DeleteDriverModel.dart';
import 'package:moovbe_bus_project/model/DriverListModel.dart';
import 'package:moovbe_bus_project/repositary/Api/DriverList/DriverListApi.dart';

part 'driverlist_event.dart';
part 'driverlist_state.dart';

class DriverlistBloc extends Bloc<DriverlistEvent, DriverlistState> {
  late DriverListModel driverListModel;
  late DeleteDriverModel deleteDriverModel;
  DriverListApi driverListApi = DriverListApi();
  DriverlistBloc() : super(DriverlistInitial()) {
    on<FetchDriver>((event, emit) async {
      emit(DriverlistLoading());
      try {
        driverListModel = await driverListApi.getDriver();
        emit(DriverlistLoaded());
      } catch (e) {
        print("Error>>>>>>>>>>>>>>>>>>>>>>>>>" + e.toString());
        emit(DriverlistError());
      }
    });

    //delete Driver bloc
    on<FetchDeleteDriver>((event, emit) async {
      emit(DriverlistLoading());
      try {
        deleteDriverModel =
            await driverListApi.getDriverDelete(driverId: event.driverId);
        emit(DriverlistDeleted());
      } catch (e) {
        print("Error>>>>>>>>>>>>>>>>>>>>>>>>>" + e.toString());
        emit(DriverlistError());
      }
    });

    //add Driver bloc
    on<FetchAddDriver>((event, emit) async {
      emit(DriverlistLoading());
      try {
        deleteDriverModel = await driverListApi.getAddDriver(
            name: event.name, licenseNo: event.licenseNo, mobile: event.mobile);
        emit(DriverlistAdded());
      } catch (e) {
        print("Error>>>>>>>>>>>>>>>>>>>>>>>>>" + e.toString());
        emit(DriverlistError());
      }
    });
  }
}
