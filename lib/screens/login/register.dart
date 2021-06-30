import 'dart:math';

import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_mobile/controllers/UserProvider.dart';
import 'package:money_mobile/until/fade_animation.dart';
import 'package:provider/provider.dart';

import 'components/input_widget.dart';

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _phoneController = new TextEditingController();

  TextEditingController _passController = new TextEditingController();

  TextEditingController _againPassController = new TextEditingController();
  TextEditingController _otpController = new TextEditingController();

  String _verificationId;

  FirebaseAuth _auth = FirebaseAuth.instance;

  getOTPPhone () async{
    await _auth.verifyPhoneNumber(
        phoneNumber: '+84 ${_phoneController.text}',
        verificationCompleted: (phoneAuthCredential) async {
          Provider.of<UserProvider>(context, listen: false).setLoadingLogin(false);
        },
        verificationFailed: (verificationFailed) async {
          Provider.of<UserProvider>(context, listen: false).setLoadingLogin(false);
        },
        codeSent: (verificationId, resendingToken) async {
          setState(() {
            _verificationId = verificationId;
          });
          Provider.of<UserProvider>(context, listen: false).setLoadingLogin(false);

        },
        codeAutoRetrievalTimeout: (verificationId) async {

        },
    );

  }


  verificationPhone () async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: _otpController.text);
    signInWithPhoneAuthCredential(phoneAuthCredential);
  }

  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential = await _auth.signInWithCredential(phoneAuthCredential);
      if (authCredential?.user != null) {
        Navigator.pushNamed(context, '/login');
      }
    } on FirebaseAuthException catch (e) {
    }

  }

  getDataRegister(context) async{
    if (_phoneController.text != '' && _passController.text != '' && _againPassController.text != '' && _againPassController.text == _passController.text) {
      var provider = Provider.of<UserProvider>(context, listen: false);
      var rng = new Random();
      var number = rng.nextInt(900000) + 900000000000;
//      provider.fetchUserRegister(_phoneController.text, number.toString()).then((value) {
//        if (value) {
//          Provider.of<UserProvider>(context, listen: false).setLoadingLogin(false);
//          print('tài khoản đã được đăng ký');
//        }else {
//          getOTPPhone();
//        }
//      });
      _showMyDialog(context);
      getOTPPhone();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<UserProvider>(
      builder: (context, model, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
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
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              height: MediaQuery.of(context).size.height - 50,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FadeAnimation(1, Text("Đăng ký", style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),)),
                  Column(
                    children: [
                      FadeAnimation(1.2, makeInput(label: "Số điện thoại", controller: _phoneController, textType: TextInputType.phone,  isEnable: model.getLoadingLogin ? false : true)),
                      FadeAnimation(1.3, makeInput(label: "Mật khẩu", obscureText: true, controller: _passController, textType:  TextInputType.text,  isEnable: model.getLoadingLogin ? false : true)),
                      FadeAnimation(1.4, makeInput(label: "Nhập lại mật khẩu", obscureText: true, controller: _againPassController, textType: TextInputType.text,  isEnable: model.getLoadingLogin ? false : true)),
                    ],
                  ),
                  FadeAnimation(1.5, Container(
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
                        getDataRegister(context);
                      },
                      color: Colors.greenAccent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: model.getLoadingLogin ? CircularProgressIndicator(backgroundColor: Colors.white, strokeWidth: 2,) : Text("Đăng ký", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),),
                    ),
                  )),
                  FadeAnimation(1.6, Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Bạn đã có tài khoản rồi ?"),
                      Text(" Đăng nhập", style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18
                      ),),
                    ],
                  )),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Consumer<UserProvider>(
          builder: (context, model, child){
            return AlertDialog(
            title: const Text('Xác thực số điện thoại'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.phone,
                    obscureText: true,
                    controller: this._otpController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mã xác thực',
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Xác thực'),
                onPressed: () {
                  verificationPhone();
                },
              ),
            ],
            );
    }
        );
      },
    );
  }
}