import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_mobile/api/services_api.dart';
import 'package:money_mobile/controllers/EndowProvider.dart';
import 'package:money_mobile/controllers/HistoryTransfersProvider.dart';
import 'package:money_mobile/controllers/HomeProvider.dart';
import 'package:money_mobile/controllers/UserProvider.dart';
import 'package:money_mobile/screens/dashboard.dart';
import 'package:money_mobile/screens/endow/endow.dart';
import 'package:money_mobile/screens/login/login.dart';
import 'package:money_mobile/screens/login/register.dart';
import 'package:money_mobile/screens/main_page.dart';
import 'package:money_mobile/screens/receiver_money/receiver_money.dart';
import 'package:money_mobile/screens/top_up_your_wallet.dart/choose_deposit_method.dart';
import 'package:money_mobile/screens/top_up_your_wallet.dart/index.dart';
import 'package:money_mobile/screens/transfers/transfers_qrcode.dart';
import 'package:money_mobile/until/constants.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'controllers/BottomNavigationProvider.dart';
import 'models/service_model.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarColor: kPrimaryColor, // status bar color
  ));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   return MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider()),
          ChangeNotifierProvider<UserProvider>(create: (context) => UserProvider()),
          ChangeNotifierProvider<BottomNavigationProvider>(create: (context) => BottomNavigationProvider()),
          ChangeNotifierProvider<HistoryTransfersProvider>(create: (context) => HistoryTransfersProvider()),
          ChangeNotifierProvider<EndowProvider>(create: (context) => EndowProvider()),
        ],
    child: MaterialApp(
      title: 'Money Mobile',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        fontFamily: 'roboto'
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Endow(),
        '/login': (context) => Login(),
        'register': (context) => Register(),
        '/enter-money': (context) => EnterMoney(),
        '/receiver-money': (context) => ReceiverMoney(),
        '/dashboard': (context) => Dashboard(),
        '/transfers_qrcode': (context) => TransfersQRCode(),
        '/choose-depost-method': (context) => ChooseDepostMethod()
      },
    ),
    );
  }
}

class TestApi {

  Future<List<ServiceItemModel>> fetchServiceOrthers() async {
    var url = Uri.parse("http://192.168.1.7:1337/interface-app");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var list = json.decode(response.body)['interface'] as List;
      List<ServiceItemModel> services = list.map((model) => ServiceItemModel.fromJson(model)).toList();
      return services;
    } else {
      throw Exception('Failed to load post');
    }
  }

}






