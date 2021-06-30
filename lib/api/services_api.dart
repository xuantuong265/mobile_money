
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:money_mobile/models/service_model.dart';
import 'package:money_mobile/until/action_api.dart';

class ServiceApi {

  static Future<List<ServiceItemModel>> fetchServiceOrthers() async {
    var url = UrlRequest.url;
    var action = Uri.parse("${url}/interface-app");
    http.Response response = await http.get(action);
    if (response.statusCode == 200) {
      var list = json.decode(response.body)['interface'] as List;
      List<ServiceItemModel> services = list.map((model) => ServiceItemModel.fromJson(model)).toList();
      return services;
    } else {
      throw Exception('Failed to load post');
    }
  }
}