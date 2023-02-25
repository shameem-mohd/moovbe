import 'dart:convert';

import 'package:http/http.dart';
import 'package:moovbe_bus_project/model/UserModel.dart';
import 'package:moovbe_bus_project/repositary/Api/ApiClient.dart';

class UserApi {
  ApiClient apiClient = ApiClient();
  Future<UserModel> getUser({
    required String username,
    required String password,
  }) async {
    print("user Api working");
    String basePath = "LoginApi";
    var body = {
      "username": username,
      "password": password,
    };
    print("***********&&&&&&&&&&&${jsonEncode(body)}");
    Response response =
        await apiClient.invokeApi(path: basePath, method: "POST_", body: body);
    print(response.body);
    return UserModel.fromJson(jsonDecode(response.body));
  }
}
