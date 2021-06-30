import 'package:flutter/material.dart';
import 'package:money_mobile/models/service_model.dart';
import 'package:money_mobile/until/constants.dart';

class ServiceOrthersItem extends StatelessWidget {

  final ServiceItemModel model;

  const ServiceOrthersItem({
    this.size,
    this.model,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          height: size.width * 0.19,
          width: size.width * 0.19,
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: kBackgroundColor,
            border: Border.all(
              color: kTextColor.withOpacity(0.1),
            )
          ),
            child: Container(
              margin: EdgeInsets.all(15),
              child: Icon(
                Icons.ac_unit_outlined,
                size: 30,
                color: Colors.blue,
              ),
            ),
        ),
        Text('${this.model.title}',
        textAlign: TextAlign.center,
         style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),)
      ],
    );
  }
}