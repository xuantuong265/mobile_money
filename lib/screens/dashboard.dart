import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:money_mobile/controllers/BottomNavigationProvider.dart';
import 'package:money_mobile/until/constants.dart';
import 'package:provider/provider.dart';


class Dashboard extends StatelessWidget {

  static bool isShowDialog = false;
 static String titleNotify = '';
 static String contentNotify = '';

  Future<void> scanQR(context) async {
    try{
      FlutterBarcodeScanner.scanBarcode('#2A99CF', "Cancle", true, ScanMode.QR).then((value) {
        var _provider = Provider.of<BottomNavigationProvider>(context, listen: false);
        _provider.setValueQRCode(value);
        String _qrCode = _provider.getQRCode;
        if (int.parse(_qrCode) != -1) {
          Navigator.pushNamed(context, '/transfers_qrcode');
        }
      });
    }catch(e) {
    }
  }

  void showDialog(context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        text: contentNotify,
        title: titleNotify
      );
    });
  }
  @override
  Widget build(BuildContext context) {

    if (isShowDialog) {
      showDialog(context);
    }

    return Consumer<BottomNavigationProvider>(
      builder: (context, model, child) => Scaffold(
        body: model.currentScreen,
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          focusColor: kBackgroundColor,
          child: Icon(Icons.qr_code_scanner_outlined),
          onPressed: () {
            scanQR(context);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BubbleBottomBar(
          opacity: .2,
          onTap: (int index) {
            model.currentTab = index;
          },
          currentIndex: model.currentTab,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 8,
          fabLocation: BubbleBottomBarFabLocation.end,
          hasNotch: true,
          hasInk: true,
          inkColor: Colors.black12,
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: kPrimaryColor,
                icon: Icon(Icons.home, color: Colors.black,),
                activeIcon: Icon(Icons.home, color: kPrimaryColor,),
                title: Text("Home")
            ),
            BubbleBottomBarItem(
                backgroundColor: kPrimaryColor,
                icon: Icon(Icons.access_time, color: Colors.black,),
                activeIcon: Icon(Icons.access_time, color: kPrimaryColor),
                title: Text("Ưu đãi")
            ),
            BubbleBottomBarItem(
                backgroundColor: kPrimaryColor,
                icon: Icon(Icons.folder_open, color: Colors.black,),
                activeIcon: Icon(Icons.folder_open, color: kPrimaryColor),
                title: Text("History")
            ),
            BubbleBottomBarItem(
                backgroundColor: kPrimaryColor,
                icon: Icon(Icons.menu, color: Colors.black,),
                activeIcon: Icon(Icons.menu, color: kPrimaryColor),
                title: Text("Profile")
            ),
          ],
        ),
      ),
    );
  }
}
