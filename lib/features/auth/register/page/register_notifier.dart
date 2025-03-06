import 'package:flutter/material.dart';

class RegisterNotifier extends ChangeNotifier {
  String? citySelectedId;
  String? subdistrictSelectedId;
  String? desaSelectedId;
  String? puskesmasSelectedId;
  String? companionSelectedId;
  String? dateSelected;
  String? companionName;

  void setCityValue(String? newValue) {
    citySelectedId = newValue;
    notifyListeners();
  }

  void setSubdistrictValue(String? newValue) {
    subdistrictSelectedId = newValue;
    notifyListeners();
  }

  void setDesaValue(String? newValue) {
    desaSelectedId = newValue;
    notifyListeners();
  }

  void setPuskesmasValue(String? newValue) {
    puskesmasSelectedId = newValue;
    notifyListeners();
  }

  void setCompanionValue(String? newValue, String? name) {
    companionSelectedId = newValue;
    companionName = name;
    notifyListeners();
  }

  void clearAll() {
    citySelectedId = null;
    subdistrictSelectedId = null;
    desaSelectedId = null;
    puskesmasSelectedId = null;
    companionSelectedId = null;
  }

  @override
  String toString() {
    return 'citySelectedId: $citySelectedId, subdistrictSelectedId: $subdistrictSelectedId, desaSelectedId: $desaSelectedId, puskesmasSelectedId: $puskesmasSelectedId, companionSelectedId: $companionSelectedId';
  }
}
