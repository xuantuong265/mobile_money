
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:money_mobile/api/users_api.dart';
import 'package:money_mobile/controllers/BottomNavigationProvider.dart';
import 'package:money_mobile/controllers/UserProvider.dart';
import 'package:money_mobile/models/users_model.dart';
import 'package:money_mobile/until/constants.dart';
import 'package:provider/provider.dart';
import '../dashboard.dart';
import 'package:intl/intl.dart';

class TransfersQRCode extends StatelessWidget {

  TextEditingController _moneyController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    var model = Provider.of<UserProvider>(context, listen: false);
    String _qrValue = Provider.of<BottomNavigationProvider>(context, listen: false).getQRCode;
    print(_qrValue);
    model.fetchDataUserTransfers(_qrValue);
    UserModel _userReceiver = model.getUserQRCodeOfPhone;
    UserModel _userSend = Provider.of<UserProvider>(context, listen: false).getUser;

    void transfersMoney() async {
      if (_moneyController.text != null) {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.loading,
        );
          double _currentMoneyReceiver = double.parse(_userReceiver.price) + double.parse(_moneyController.text);
          double _currentMoneySend = double.parse(_userSend.price) - double.parse(_moneyController.text);
          print(_currentMoneySend);
          print(_currentMoneyReceiver);
          var now = new DateTime.now();
          var formatter = new DateFormat('yyyy-MM-dd');
          String _date = formatter.format(now);

          await model.transfersMoney(
            _userSend.id.toString(),
            _userReceiver.id.toString(),
            _moneyController.text,
            _currentMoneySend.toString(),
            _currentMoneyReceiver.toString(),
            'Chuyển tiền',
            _date,
            _descriptionController.text
          ).then((result) => {
            if (result) {
              Dashboard.isShowDialog = true,
              Dashboard.titleNotify = 'Thành công',
              Dashboard.contentNotify = 'Bạn đã chuyển tiền thành công !'
            }else {
              Dashboard.isShowDialog = true,
              Dashboard.titleNotify = 'Thất bại',
              Dashboard.contentNotify = 'Bạn đã chuyển tiền không thành công !'
            }
          });
          Navigator.pushNamed(context, '/dashboard');
      }
    }

    return Scaffold(
            appBar: buildAppBar(context),
            body: Container(
              width: double.infinity,
              height: size.height,
              padding: EdgeInsets.symmetric(vertical: 25),
              decoration: BoxDecoration(
                  color: kBackgroundColor
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Chủ tài khoản',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Số điện thoại',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${_userReceiver.name}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            Text(
                              '${_userReceiver.phone}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Divider(
                    color: kTextColor.withOpacity(0.5),
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextField(
                          controller: _moneyController,
                          decoration: InputDecoration(
                              labelText: 'Số tiền chuyển (VND)',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              )
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            labelText: 'Nội dung',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: kPrimaryColor,
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              transfersMoney();
                            },
                            child: Text(
                              'Thực hiện giao dịch',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          );
        }
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: kBackgroundColor,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard())
          );
        },
      ),
      centerTitle: true,
      title: Text(
        "Chuyển tiền",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            color: kTextWhiteColor,
            fontSize: 17
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.toc_outlined,
            color: kTextWhiteColor,
          ),
          onPressed: () {},
          tooltip: "Chọn mẫu",
        ),
      ],
    );
  }
