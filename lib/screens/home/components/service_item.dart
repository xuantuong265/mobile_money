import 'package:flutter/material.dart';
import 'package:money_mobile/models/Sevices.dart';
import 'package:money_mobile/until/constants.dart';

class ServiceItem extends StatelessWidget {

  final Service serviceItem;
  final bool isFlag;

  const ServiceItem({
    this.size,
    this.serviceItem,
    this.isFlag,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            switchScreenServices(this.serviceItem.title, context);
          }, 
          child: Container(
            height: size.width * 0.19,
            width: size.width * 0.19,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                color: isFlag ? kTextColor.withOpacity(0.1) : kTextWhiteColor,
              )
            ),
              child: Container(
                margin: EdgeInsets.all(15),
                child: Icon(
                  this.serviceItem.icon,
                  size: 30,
                  color: this.serviceItem.color,
                ),
              ),
          ),
        ),
        SizedBox(height: 10),
        Text(this.serviceItem.title,
        textAlign: TextAlign.center,
         style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: isFlag ? Colors.black : kTextWhiteColor
        ),)
      ],
    );
  }
}

void switchScreenServices(String title, BuildContext context) {

  switch (title) {
      case "Chuyển tiền":
         showModal(context);
        break;
      case "Nhận tiền":
        Navigator.pushNamed(context, '/receiver-money');
        break;
      case "Rút tiền":  
        print("tút");
        break;
      case "Liên kết":
        print("liên kết");
        break;
      default:
    }

}

void showModal(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {

        Size size = MediaQuery.of(context).size;

        return Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: kBackgroundColor
                ),
                child: Column(
                  children: [
                    Text(
                      'Chuyển tiền',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: GridView.count(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      padding: const EdgeInsets.all(8),
                      childAspectRatio: 2/3,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      children: List_Services.map((item) => ServiceItem(size: size, serviceItem: item, isFlag: true)).toList(),
                    ),
                    )
                  ],
                ),
              ),
            ]
          ),
        );
      });
  }

const List_Services = [
  Service(id: 1, title: 'Chuyển tiền qua số TK', icon: Icons.monetization_on, color: Colors.redAccent),
  Service(id: 2, title: 'Chuyển tiền qua số DT', icon: Icons.phone_android, color: Colors.blueAccent),
  Service(id: 3, title: 'Chuyển tiền đến số thẻ', icon: Icons.credit_card, color: Colors.blue),
  Service(id: 4, title: 'Chuyển tiền mặt', icon: Icons.money_sharp, color: Colors.redAccent),
];

