import 'package:flutter/material.dart';
import 'package:money_mobile/models/Sevices.dart';
import 'package:money_mobile/screens/home/components/service_item.dart';

class Services extends StatelessWidget {
  const Services({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            padding: const EdgeInsets.all(8),
            childAspectRatio: 2/3,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children: List_Services.map((item) => ServiceItem(size: size, serviceItem: item, isFlag: false,)).toList(),
          );
  }
}

const List_Services = [
  Service(id: 1, title: 'Chuyển tiền', icon: Icons.attach_money_rounded, color: Colors.white),
  Service(id: 2, title: 'Nhận tiền', icon: Icons.qr_code_scanner, color: Colors.white),
  Service(id: 3, title: 'Rút tiền', icon: Icons.topic_sharp, color: Colors.white),
  Service(id: 4, title: 'Liên kết', icon: Icons.share_sharp, color: Colors.white)
];

