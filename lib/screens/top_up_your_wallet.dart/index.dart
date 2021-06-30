import 'package:flutter/material.dart';
import 'package:money_mobile/screens/dashboard.dart';
import 'package:money_mobile/until/constants.dart';

class EnterMoney extends StatefulWidget {
  @override
  _EnterMoneyState createState() => _EnterMoneyState();
}

class _EnterMoneyState extends State<EnterMoney> {

  String select = '';
  TextEditingController _moneyController = new TextEditingController();

  setData(title) {
    setState(() {
      select = title;
      _moneyController.text = select;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                      color: kBackgroundColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Số dư tài khoản',
                          style: TextStyle(
                            fontSize: 14,
                            color: kTextColor,
                          )
                      ),
                      Visibility(
                        visible: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            height: 30,
                            child: Row(
                              children: [
                                // ignore: missing_required_param
                                Icon(
                                  Icons.remove_red_eye_outlined,
                                  size: 20,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '6.000 đ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 0.01,
                            offset: Offset(0.1,0.1)
                        )
                      ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Nhập số tiền muốn nạp',
                          style: TextStyle(
                            fontSize: 14,
                            color: kTextColor,
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: TextField(
                          controller: _moneyController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'Số tiền (đ)',
                              hintStyle: TextStyle(
                                  color: Colors.black38
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Hoặc chọn nhanh số tiền',
                        style: TextStyle(
                          fontSize: 14,
                          color: kTextColor,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            padding: const EdgeInsets.all(8),
                            childAspectRatio: 2/0.8,
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            children: [
                              buildMoney(title: '100000'),
                              buildMoney(title: '200000'),
                              buildMoney(title: '500000'),
                              buildMoney(title: '1000000'),
                              buildMoney(title: '2000000'),
                              buildMoney(title: '5000000'),
                            ]
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bạn muốn vay tiền?',
                        style: TextStyle(
                          fontSize: 14,
                          color: kTextColor,
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text(
                          'Vay ngay',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 2),
                Container(
                  margin: EdgeInsets.only(
                    right: 15,
                    left: 15,
                    bottom: 15,
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 45,
                    color: kPrimaryColor,
                    elevation: 0,
                    onPressed: () {
                      Navigator.pushNamed(context, '/choose-depost-method');
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(
                      'TIẾP TỤC',
                      style: TextStyle(
                          color: kTextWhiteColor
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMoney({String title}) {
    return Container(
      child: InkWell(
        onTap: () {
          setData(title);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.withOpacity(0.1)),
            color: select == title ? kPrimaryColor : kBackgroundColor
          ),
          child: Text(
            '${title} đ',
            style: TextStyle(
              fontSize: 12,
              color:  select == title ? kTextWhiteColor : kTextColor.withOpacity(0.6),
            )
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 1,
      leading: IconButton(
        icon: Icon(
        Icons.arrow_back_ios,
        color: kTextWhiteColor,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
        },
      ),
      title: Text(
        'Nạp tiền vào TNPay',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: kTextWhiteColor
        ),
      ),
    );
  }
}