
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:money_mobile/models/endow_model.dart';

class EndowProvider extends ChangeNotifier {
  List<EndowModel> get getListEndow => this._listEndow;


  List<EndowModel> _listEndow = [
    EndowModel(
      id: 1,
      price: "10000",
      title: "Hoàn tiền 10000đ khi thanh toán vay",
      image: "asset/image/quangcao.jpg",
      time: "30/06/2021",
      point: "100000"
    ),
    EndowModel(
        id: 2,
        price: "10000",
        title: "Hoàn tiền 10000đ khi thanh toán vay",
        image: "asset/image/quangcao.jpg",
        time: "30/06/2021",
        point: "100000"
    ),
    EndowModel(
        id: 3,
        price: "10000",
        title: "Hoàn tiền 10000đ khi thanh toán vay",
        image: "asset/image/quangcao.jpg",
        time: "30/06/2021",
        point: "100000"
    ),
    EndowModel(
        id: 4,
        price: "10000",
        title: "Hoàn tiền 10000đ khi thanh toán vay",
        image: "asset/image/quangcao.jpg",
        time: "30/06/2021",
        point: "100000"
    ),
    EndowModel(
        id: 5,
        price: "10000",
        title: "Hoàn tiền 10000đ khi thanh toán vay",
        image: "asset/image/quangcao.jpg",
        time: "30/06/2021",
        point: "100000"
    ),
    EndowModel(
        id: 6,
        price: "10000",
        title: "Hoàn tiền 10000đ khi thanh toán vay",
        image: "asset/image/quangcao.jpg",
        time: "30/06/2021",
        point: "100000"
    ), EndowModel(
        id: 7,
        price: "10000",
        title: "Hoàn tiền 10000đ khi thanh toán vay",
        image: "asset/image/quangcao.jpg",
        time: "30/06/2021",
        point: "100000"
    ),

  ];

}