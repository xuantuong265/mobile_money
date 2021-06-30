import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:money_mobile/api/services_api.dart';
import 'package:money_mobile/controllers/HomeProvider.dart';
import 'package:money_mobile/models/Sevices.dart';
import 'package:money_mobile/screens/home/components/service_item_orther.dart';
import 'package:provider/provider.dart';

class ServicesOrther extends StatefulWidget {
  const ServicesOrther({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _ServicesOrtherState createState() => _ServicesOrtherState();
}

class _ServicesOrtherState extends State<ServicesOrther> {

  getDataServiceOrthers() async {
    var providers = Provider.of<HomeProvider>(context, listen: false);
    var response  = await ServiceApi.fetchServiceOrthers();
    providers.setServiceOrthers(response);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataServiceOrthers();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     return Consumer<HomeProvider>(
       builder: (context, model, child){
       return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dịch vụ', style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),),
                Container(
                  height: 60,
                  width: 60,
                  child: Icon(Icons.dialpad),
                )
              ],
            ),
            Container(
              child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              padding: const EdgeInsets.all(8),
              childAspectRatio: 2/3.5,
                  physics: ScrollPhysics(),
              shrinkWrap: true,
              children: model.getServiceOrthers.map((model) => ServiceOrthersItem(size: size, model: model)).toList(),
            ),
            )
          ]
          );
        }
     );

  }
}



const List_Services = [
  Service(id: 1, title: 'Chuyển tiền qua số TK', icon: Icons.monetization_on, color: Colors.redAccent),
  Service(id: 2, title: 'Chuyển tiền qua số DT', icon: Icons.phone_forwarded_sharp, color: Colors.blueAccent),
  Service(id: 3, title: 'Nạp điện thoại', icon: Icons.phone_callback, color: Colors.blue),
  Service(id: 4, title: 'Đặt vé xem phim', icon: Icons.topic_sharp, color: Colors.redAccent),
  Service(id: 5, title: 'Tiền điện', icon: Icons.lightbulb, color: Colors.orangeAccent),
  Service(id: 6, title: 'Thanh toán vay', icon: Icons.money_off_csred_rounded, color: Colors.greenAccent),
  Service(id: 7, title: 'Chia hóa đơn', icon: Icons.card_membership, color: Colors.blue),
  Service(id: 8, title: 'Thanh toán vay', icon: Icons.monetization_on, color: Colors.redAccent),
];