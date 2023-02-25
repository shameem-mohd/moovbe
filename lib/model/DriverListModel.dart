class DriverListModel {
  DriverListModel({
    this.status,
    this.driverList,
  });

  DriverListModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['driver_list'] != null) {
      driverList = [];
      json['driver_list'].forEach((v) {
        driverList?.add(DriverList.fromJson(v));
      });
    }
  }
  bool? status;
  List<DriverList>? driverList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (driverList != null) {
      map['driver_list'] = driverList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class DriverList {
  DriverList({
    this.id,
    this.name,
    this.mobile,
    this.licenseNo,
  });

  DriverList.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    licenseNo = json['license_no'];
  }
  int? id;
  String? name;
  String? mobile;
  String? licenseNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['mobile'] = mobile;
    map['license_no'] = licenseNo;
    return map;
  }
}
