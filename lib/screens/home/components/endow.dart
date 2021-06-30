import 'package:flutter/material.dart';
import 'package:money_mobile/until/constants.dart';

class Endow extends StatelessWidget {
  const Endow({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 20,
        padding: const EdgeInsets.all(8),
        childAspectRatio: 2/3,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: [
          Endow_Item(size: size),
          Endow_Item(size: size),
          Endow_Item(size: size),
          Endow_Item(size: size),
          Endow_Item(size: size),
          Endow_Item(size: size),
          Endow_Item(size: size),
          Endow_Item(size: size),
          Endow_Item(size: size),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class Endow_Item extends StatefulWidget {
  const Endow_Item({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _Endow_ItemState createState() => _Endow_ItemState();
}

// ignore: camel_case_types
class _Endow_ItemState extends State<Endow_Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0,2)
          )
        ]
      ),
      child: Column(
        children: [
          Container(
            height: widget.size.width * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('asset/image/quangcao.jpg'),
                fit: BoxFit.cover
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Mua data chỉ với 1000 đ.',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.black
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
