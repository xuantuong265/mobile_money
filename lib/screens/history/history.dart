
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:money_mobile/controllers/HistoryTransfersProvider.dart';
import 'package:money_mobile/controllers/UserProvider.dart';
import 'package:money_mobile/models/history_model.dart';
import 'package:money_mobile/until/constants.dart';
import 'package:provider/provider.dart';
import 'package:grouped_list/grouped_list.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<HistoryTransfersProvider>(context);
    var user = Provider.of<UserProvider>(context,listen: false).getUser;
    provider.fetchHistoryTransferUser(user.id);
    List<HistoryModel> list = provider.getHistoryTransfers;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: buildAppBar(),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1, color: Colors.grey.withOpacity(0.3)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.add_box,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${list[index].content}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: kTextColor
                                ),
                              ),
                              SizedBox(height: 7),
                              Text(
                                (int.parse(list[index].idReceiver) == user.id) ? '${list[index].addressSend}' : '${list[index].addressSend}',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: kTextColor.withOpacity(0.7),
                                    fontSize: 12
                                ),
                              ),
                              SizedBox(height: 7),
                              Row(
                                children: [
                                  Text(
                                    '${list[index].date}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: kTextColor.withOpacity(0.7),
                                        fontSize: 12
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green
                                    ),
                                    height: 10,
                                    width: 10,
                                  ),
                                  Text(
                                    'Thành công',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: kTextColor.withOpacity(0.7),
                                        fontSize: 12
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      child: Text(
                        (int.parse(list[index].idReceiver) == user.id) ? '+ ${list[index].price} đ' : '- ${list[index].price} đ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kTextColor
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget buildAppBar () {
  return Container(
    width: double.infinity,
    child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Spacer(flex: 1,),
          Text(
            'Lịch sử giao dịch',
            style: TextStyle(
                color: kTextWhiteColor,
                fontWeight: FontWeight.w500
            ),
          ),
          Spacer(flex: 1,),
          Icon(
            Icons.filter_list,
            color: kTextWhiteColor,
          )
        ]
    ),
  );
}