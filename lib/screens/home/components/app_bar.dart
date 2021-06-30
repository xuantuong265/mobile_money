import 'package:flutter/material.dart';
import 'package:money_mobile/controllers/UserProvider.dart';
import 'package:money_mobile/until/constants.dart';
import 'package:provider/provider.dart';

class TopTitle extends StatelessWidget {
  const TopTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context).getUser;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('asset/image/logo.png'),
                    )
                  ),
                ),
                SizedBox(width: 10),
                Text("${user.phone}",
                  style: TextStyle(
                    color: kTextWhiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.search_outlined,
                color: kTextWhiteColor,
              ),
              onPressed: () {},
            ),
        ],
      ),
    );
  }
}