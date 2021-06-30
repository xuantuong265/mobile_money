import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:money_mobile/screens/endow/endow.dart';
import 'package:money_mobile/screens/history/history.dart';
import 'package:money_mobile/screens/home/home.dart';
import 'package:money_mobile/screens/profile/profile.dart';

class BottomNavigationProvider extends ChangeNotifier {

  int _currentIndex = 0;
  double _height, _width;
  String _qrString = 'Scan QR Code';

  List<Widget> screens = [
    Home(),
    Endow(),
    History(),
    Profile(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  set currentTab(int tab) {
    this._currentIndex = tab;
    notifyListeners();
  }

  get currentTab => this._currentIndex;

  get currentScreen => this.screens[this._currentIndex];

  String get getQRCode => this._qrString;

  void setValueQRCode (String value) {
    _qrString = value;
    notifyListeners();
  }

  Future<void> scanQR() async {
    try{
      FlutterBarcodeScanner.scanBarcode('#2A99CF', "Cancle", true, ScanMode.QR).then((value) {
        setValueQRCode(value);
      });
    }catch(e) {
      _qrString = 'Unable to read the qr code';
    }
  }

}