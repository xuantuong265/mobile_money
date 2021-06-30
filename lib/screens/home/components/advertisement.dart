import 'package:flutter/material.dart';


class Advertisement extends StatelessWidget {
  const Advertisement({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.15,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/image/quangcao.jpg'),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
    );
  }
}
