import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:money_mobile/api/services_api.dart';
import 'package:money_mobile/models/service_model.dart';

class HomeProvider extends ChangeNotifier {

  List<ServiceItemModel> _serviceOrthers = [];
  ServiceApi _serviceApi = new ServiceApi();
  String title = 'hah';
  bool _isVisible = true;

  void setServiceOrthers(List<ServiceItemModel> list) {
      _serviceOrthers = list;
      notifyListeners();
  }

  void setHideWidget() {
    _isVisible = false;
    notifyListeners();
  }

  void setShowWidget() {
    _isVisible = true;
    notifyListeners();
  }

  get getIsVisible => this._isVisible;

  List<ServiceItemModel> get getServiceOrthers =>  this._serviceOrthers;

}