import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_mobile/controllers/EndowProvider.dart';
import 'package:money_mobile/models/endow_model.dart';
import 'package:money_mobile/until/constants.dart';
import 'package:provider/provider.dart';

class Endow extends StatefulWidget {
  @override
  _EndowState createState() => _EndowState();
}

class _EndowState extends State<Endow> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          makeAppbar(context),
          makeBody(context),
        ],
      )),
    );
  }

  Widget makeBody(BuildContext context) {
    return Expanded(
      child: Scaffold(
        appBar: TabBar(
          controller: _tabController,
          labelColor: kPrimaryColor,
          unselectedLabelColor: Colors.grey,
          isScrollable: false,
          indicatorColor: kPrimaryColor,
          tabs: <Widget>[
            Tab(
              child: Text(
                'Ưu đãi',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ),
            Tab(
              child: Text(
                'Ưu đãi của tôi',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Scaffold(
              body: makeTabOne(context),
            ),
            Scaffold(
              body: makeTabTwo(context),
            ),
          ],
        ),
      ),
    );
  }
}

Widget makeAppbar(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    decoration: BoxDecoration(color: kPrimaryColor),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '2.057',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kTextWhiteColor,
                  fontSize: 16),
            ),
            SizedBox(width: 5),
            Text(
              'điểm',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: kTextWhiteColor,
                  fontSize: 14),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: kTextWhiteColor,
              size: 20,
            )
          ],
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: kTextWhiteColor),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "Tìm kiếm ưu đãi, ví dụ: CGV",
              border: InputBorder.none,
              suffixIcon: Icon(Icons.close),
            ),
          ),
        )
      ],
    ),
  );
}

Widget makeTabTwo(BuildContext context) {
  var provider = Provider.of<EndowProvider>(context, listen: false);
  Size size = MediaQuery.of(context).size;

  return Container(
      child: ListView.builder(
    padding: EdgeInsets.only(top: 30, left: 15, right: 15),
    itemCount: provider.getListEndow.length,
    itemBuilder: (BuildContext cxt, int index) {
      return makeItemTwo(provider.getListEndow[index], size);
    },
  ));
}

Widget makeTabOne(BuildContext context) {
  return Container(
      child: ListView(
    children: [
      Container(
        padding: EdgeInsets.only(top: 15, left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            makeItemCateGories(icon: Icons.list_alt_outlined, title: 'Tất cả', color: Colors.greenAccent),
            makeItemCateGories(icon: Icons.rice_bowl_outlined, title: 'Ăn uống', color: Colors.greenAccent),
            makeItemCateGories(icon: Icons.museum_sharp, title: 'Giải trí', color: Colors.orange),
            makeItemCateGories(icon: Icons.shopping_cart, title: 'Tất cả', color: Colors.orangeAccent),
          ],
        ),
      ),
      SizedBox(height: 30),
      Divider(color: Colors.grey[200], height: 1),
      Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Ưu đãi độc quyền',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                      SizedBox(width: 7),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Xem tất cả (14)',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    ],
  ));
}

Widget makeItemCateGories({IconData icon, String title, Color color}) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.only(right: 15),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[200], width: 1.0),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Icon(
                  icon,
                  color: color,
                  size: 35,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '${title}',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    ),
  );
}

Widget makeItemTwo(EndowModel model, Size size) {
  return Container(
    padding: EdgeInsets.only(bottom: 30),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: kBackgroundColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.width * 0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(model.image), fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15))),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            topLeft: Radius.circular(15))),
                    child: Text(
                      '${model.price}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, right: 10, left: 10, bottom: 10),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${model.title}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(Icons.date_range),
                                SizedBox(width: 5),
                                Text(
                                  '${model.time}',
                                  style: TextStyle(color: Colors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: kPrimaryColor,
                            ),
                            child: Text(
                              'Sử dụng ngay',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 74,
          left: 10,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ]),
            child: Center(
              child: Text(
                'VKU Pay',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
