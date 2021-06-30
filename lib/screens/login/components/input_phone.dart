import 'package:flutter/material.dart';
import 'package:money_mobile/controllers/UserProvider.dart';
import 'package:money_mobile/until/constants.dart';
import 'package:provider/provider.dart';

class BuildInputPhone extends StatelessWidget {
  const BuildInputPhone({
    Key key,
    this.phoneController
  }) : super(key: key);

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
        return Container(
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding - 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.circular(kDefaultBorder),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0,2)
                        )
                      ]
                    ),
                    height: 60,
                    child: TextField(
                      onChanged: (value) {
                        Provider.of<UserProvider>(context).setMessage(null);
                      },
                      enabled: !Provider.of<UserProvider>(context).getLoadingLogin,
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                        color: Colors.black87
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                        prefixIcon: Icon(
                          Icons.phone_android,
                          color: Color(0xff5ac18e),
                        ),
                        hintText: 'Nhập số điện thoại ',
                        hintStyle: TextStyle(
                          color: Colors.black38
                        )
                      ),
                    ),
                  ),
                ],
              ),
            );
  }
}