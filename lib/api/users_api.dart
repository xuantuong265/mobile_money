import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:money_mobile/models/history_model.dart';
import 'package:money_mobile/models/users_model.dart';
import 'package:money_mobile/until/action_api.dart';

class UsersApi {
  static var url = UrlRequest.url;

  static Future<List<UserModel>> fetchUsers() async {
    var action = Uri.parse('${url}/pay-users');
    http.Response response = await http.get(action);

    if (response.statusCode == 200) {
      var list = json.decode(response.body) as List;
      List<UserModel> users = list.map((model) => UserModel.fromJson(model)).toList();
      return users;
    }else {
      throw Exception('Failed to load users');
    }
  }

  static Future<bool> transfersMoney(String IDSend, String IDReceiver, String price, String moneySend, String moneyReceiver, String content, String date, String description) async {

    await http.put("${url}/pay-users/${IDReceiver}",
          headers:<String,String>{'Context-Type':'application/json;charset=UTF-8'},
          body:<String,String> {
            'price' : "${moneyReceiver}",
          });
    await http.put("${url}/pay-users/${IDSend}",
        headers:<String,String>{'Context-Type':'application/json;charset=UTF-8'},
        body:<String,String> {
          'price' : "${moneySend}",
        });

    await http.post("${url}/tranfers",
        headers:<String,String>{'Context-Type':'application/json;charset=UTF-8'},
        body:<String,String> {
          'id_send' : "${IDSend}",
          'id_receiver' : "${IDReceiver}",
          'price' : "${price}",
          'content' : "${content}",
          'date' : "${date}",
          'description' : "${description}",
        });
    return true;
  }

  static Future<List<HistoryModel>> getHistoryTransfers() async{
    var action = Uri.parse('${url}/tranfers');
    http.Response response = await http.get(action);

    if (response.statusCode == 200) {
      var list = json.decode(response.body) as List;
      List<HistoryModel> historyTransfers = list.map((model) => HistoryModel.fromJson(model)).toList();
      return historyTransfers;
    }else {
      throw Exception('Failed to load users');
    }
  }

  static Future<void> registerUser(String phone, String pass) async {

    await http.post("${url}/pay-users",
        headers:<String,String>{'Context-Type':'application/json;charset=UTF-8'},
        body:<String,String> {
          'phone' : "${phone}",
        });
  }

}