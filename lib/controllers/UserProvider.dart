import 'package:flutter/material.dart';
import 'package:money_mobile/api/users_api.dart';
import 'package:money_mobile/models/users_model.dart';

class UserProvider extends ChangeNotifier {

  UserModel _userModel = new UserModel();
  UserModel _userQRCode = new UserModel();
  String _errorMessage;
  bool _isLoadingLogin = false;
  String _verificationId;

  List<UserModel> _listUsers = [];

  void setUsers (List<UserModel> list) async {
    _listUsers = list;
    notifyListeners();
  }

  void setUserLogin(UserModel user) {
    _userModel = user;
    notifyListeners();
  }

  void setUserQRcodeOfPhone (UserModel user) {
    _userQRCode = user;
    notifyListeners();
  }

  void fetchDataUserTransfers(String qrCode) {
    for (int i = 0; i < _listUsers.length; i++) {
      if (qrCode == _listUsers[i].phone) {
        setUserQRcodeOfPhone(_listUsers[i]);
      }
    }
  }

  void setLoadingLogin(value) {
    _isLoadingLogin = value;
    notifyListeners();
  }

  void setMessage(value) {
    _errorMessage = value;
    notifyListeners();
  }

  Future<bool> fetchUserLogin(phone, password) async {
    bool _isUser = false;
    setLoadingLogin(true);
    await UsersApi.fetchUsers().then((users) => {
      setUsers(users),
      for (int i = 0; i < users.length; i++) {
        if (users[i].phone == phone && users[i].password == password) {
          _isUser = true,
          setUserLogin(users[i]),
          print('đmc'),
        }else {
          setMessage("Tài khoản hoặc mật khẩu không chính xác !"),
          print('hello')
        },
      }
    });
    return _isUser;
  }

  Future<bool> fetchUserRegister(phone, number) async {
    bool _isUser = false;
    setLoadingLogin(true);
    await UsersApi.fetchUsers().then((users) => {
      for (int i = 0; i < users.length; i++) {
        if (users[i].phone == phone && users[i].number == number) {
          _isUser = true,
          setLoadingLogin(false)
        }else {
          _isUser = false,
          setLoadingLogin(false)
        },
      }
    });
    return _isUser;
  }

  Future<bool> transfersMoney(IDSend, IDReceiver, price, moneySend, moneyReceiver, content, date, description) async {

    bool isSuccess = false;

    await UsersApi.transfersMoney(
        IDSend,
        IDReceiver,
        price,
        moneySend,
        moneyReceiver,
        content,
        date,
        description
    ).then((value) => {
      isSuccess = value
    });

    return isSuccess;
  }

  void setVerificationId (value) {
    _verificationId = value;
    notifyListeners();
  }

  bool get getLoadingLogin => this._isLoadingLogin;

  String get getMessage => this._errorMessage;

  List<UserModel> get getUsers => this._listUsers;

  UserModel get getUser => this._userModel;

  UserModel get getUserQRCodeOfPhone => this._userQRCode;

  String get getVerificationId => this._verificationId;

}