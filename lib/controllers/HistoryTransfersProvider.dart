
import 'package:flutter/cupertino.dart';
import 'package:money_mobile/api/users_api.dart';
import 'package:money_mobile/models/history_model.dart';

class HistoryTransfersProvider extends ChangeNotifier {

  List<HistoryModel> _list = [];

  Future<void> fetchHistoryTransferUser(user_id) async{
    await UsersApi.getHistoryTransfers().then((value) {
      _list = value.where((element) => int.parse(element.idSend) == user_id || int.parse(element.idReceiver) == user_id).toList();
      notifyListeners();
    });
  }

  List<HistoryModel> get getHistoryTransfers => this._list;

}