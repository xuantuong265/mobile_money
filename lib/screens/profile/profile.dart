import 'package:flutter/material.dart';
import 'package:money_mobile/models/action_profile.dart';
import 'package:money_mobile/until/constants.dart';

import 'components/app_bar.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            automaticallyImplyLeading: false,
            expandedHeight: size.height * 0.09,
            elevation: 0,
            title: AppBarProfile(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return buildListTile(listAction[index].icon, listAction[index].color, listAction[index].title);
              },
              childCount: listAction.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Divider(
                  color: kTextColor.withOpacity(0.3),
                  height: 1,
                ),
                buildListTile(Icons.settings, Colors.black, 'Cài đặt tài khoản'),
                buildListTile(Icons.logout, Colors.black, 'Đăng xuất'),
              ],
            ),
          )
        ],
      ),
    );
  }

  ListTile buildListTile(IconData iconData, Color color, String title) {
    return ListTile(
      leading: Icon(
        iconData,
        color: color,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: kTextColor,
          fontWeight: FontWeight.w500
        ),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Colors.grey,
      ),
      onTap: null,
    );
  }
}

const listAction = [
  ActionProfile(icon: Icons.card_travel, color: Colors.greenAccent, title: 'Tài khoản TNPay'),
  ActionProfile(icon: Icons.sd_card_alert_sharp, color: Colors.orangeAccent, title: 'Tài khoản liên kết'),
  ActionProfile(icon: Icons.format_list_numbered_sharp, color: Colors.blueAccent, title: 'Số tài khoản TNPay'),
  ActionProfile(icon: Icons.payment_outlined, color: Colors.greenAccent, title: 'Thanh toán tự động'),
  ActionProfile(icon: Icons.credit_card, color: Colors.blueGrey, title: 'Thẻ'),
  ActionProfile(icon: Icons.mobile_screen_share, color: Colors.greenAccent, title: 'Quản lý liên kết'),
  ActionProfile(icon: Icons.transfer_within_a_station, color: Colors.yellowAccent, title: 'Giao dịch mẫu'),
  ActionProfile(icon: Icons.list_alt_sharp, color: Colors.redAccent, title: 'Gửi yêu cầu sao kê'),
  ActionProfile(icon: Icons.location_on_sharp, color: Colors.redAccent, title: 'Điểm giao dịch'),
];


