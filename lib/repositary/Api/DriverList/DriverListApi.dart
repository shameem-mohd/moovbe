import 'dart:convert';

import 'package:http/http.dart';
import 'package:moovbe_bus_project/model/DeleteDriverModel.dart';
import 'package:moovbe_bus_project/model/DriverListModel.dart';
import 'package:moovbe_bus_project/repositary/Api/ApiClient.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriverListApi {
  ApiClient apiClient = ApiClient();
  Future<DriverListModel> getDriver() async {
    final preference = await SharedPreferences.getInstance();
    print("Driver list Api working");
    String basePath = "DriverApi/${preference.getString('userId')}/";

    Response response =
        await apiClient.invokeApi(path: basePath, method: "GET", body: null);
    print(response.body);
    return DriverListModel.fromJson(jsonDecode(response.body));
  }

  //delete driver api
  Future<DeleteDriverModel> getDriverDelete({required String driverId}) async {
    final preference = await SharedPreferences.getInstance();
    print("driver delete Api working");
    String basePath = "DriverApi/${preference.getString('userId')}/";
    var body = {
      "driver_id": driverId,
    };
    print("***********&&&&&&&&&&&${jsonEncode(body)}");
    Response response = await apiClient.invokeApi(
        path: basePath, method: "DELETE", body: jsonEncode(body));
    print(response.body);
    return DeleteDriverModel.fromJson(jsonDecode(response.body));
  }

  //add driver api
  Future<DeleteDriverModel> getAddDriver({
    required String name,
    required String mobile,
    required String licenseNo,
  }) async {
    final preference = await SharedPreferences.getInstance();
    print("user Api working");
    String basePath = "DriverApi/${preference.getString('userId')}/";
    var body = {
      "name": name,
      "mobile": mobile,
      "licenseNo": licenseNo,
    };
    print("***********&&&&&&&&&&&${jsonEncode(body)}");
    Response response = await apiClient.invokeApi(
        path: basePath, method: "POST", body: jsonEncode(body));
    print(response.body);
    return DeleteDriverModel.fromJson(jsonDecode(response.body));
  }
}
