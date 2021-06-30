import 'package:flutter/material.dart';
import 'package:money_mobile/controllers/UserProvider.dart';
import 'package:money_mobile/until/fade_animation.dart';
import 'package:provider/provider.dart';

import 'components/input_widget.dart';

class Login extends StatelessWidget {

  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    getUserData() async {
      var provider = Provider.of<UserProvider>(context, listen: false);

      if (_phoneController.text != '' && _passController.text != '') {
        print(_phoneController.text);
        provider.fetchUserLogin(_phoneController.text, _passController.text).then((value) => {
          print(value),
          if (value) {
            Navigator.pushNamed(context, '/dashboard')
          }
        });
      }else {
        provider.setMessage('Hãy nhập đầy đủ tài khoản và mật khẩu');
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
      ),
      body: Consumer<UserProvider>(
        builder: (context, model, child) {
          return Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          FadeAnimation(1, Text("Đăng nhập", style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),)),
                          SizedBox(height: 20,),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: <Widget>[
                            FadeAnimation(1.2, makeInput(label: "Số điện thoại",
                                controller: _phoneController,
                                textType: TextInputType.phone,
                                isEnable: model.getLoadingLogin ? false : true
                            )),
                            FadeAnimation(1.3, makeInput(label: "Mật khẩu",
                                obscureText: true,
                                controller: _passController,
                                textType: TextInputType.text,
                                isEnable: model.getLoadingLogin ? false : true
                            )),
                          ],
                        ),
                      ),
                      FadeAnimation(1.4, Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          padding: EdgeInsets.only(top: 3, left: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border(
                                bottom: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                              )
                          ),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: () {
                              getUserData();
                            },
                            color: Colors.greenAccent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: model.getLoadingLogin ? CircularProgressIndicator(backgroundColor: Colors.white, strokeWidth: 2,) : Text("Đăng nhập", style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18
                            ),),
                          ),
                        ),
                      )),
                      FadeAnimation(1.5, Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Bạn chưa có tài khoản ?"),
                          Text("Đăng ký", style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18
                          ),),
                        ],
                      ))
                    ],
                  ),
                ),
                FadeAnimation(1.2, Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/image/background.png'),
                          fit: BoxFit.cover
                      )
                  ),
                ))
              ],
            ),
          );
        }
      ),
    );
  }

}