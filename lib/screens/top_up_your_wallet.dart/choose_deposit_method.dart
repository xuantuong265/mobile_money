import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_mobile/until/constants.dart';

class ChooseDepostMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nạp tiền vào VKU TNPay',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: kTextWhiteColor,
            fontSize: 17
          ),
        ),
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: kTextWhiteColor,
            size: 24,
          ),
          onPressed: () {

          },
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  'CHỌN HÌNH THỨC NẠP TIỀN',
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: 16
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.only(
                    top: 4,
                    bottom: 20,
                    right: 15,
                    left: 15
                  ),
                  decoration: BoxDecoration(
                    color: kTextWhiteColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nạp tiền vào điểm giao dịch',
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: kTextColor.withOpacity(0.5),
                                  size: 16,
                                ),
                                onPressed: null)
                          ],
                        ),
                      Align(
                        child: Text(
                          'Nạp tiền vào cửu hàng của VKU TNPay tại 63 tỉnh thành',
                          style: TextStyle(
                            color: kTextColor.withOpacity(0.5),
                            fontSize: 12
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kTextWhiteColor
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nạp tiền tận nơi',
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Chỉ cần thông tin ngắn gọn, chúng tôi sẽ đến tận nơi và nộp ngay tiền cho bạn',
                        maxLines: 2,
                        style: TextStyle(
                            color: kTextColor.withOpacity(0.5),
                            fontSize: 12,
                            height: 1.3
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  decoration: BoxDecoration(
                    color: kTextWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chuyển tiền vào VKU TNPay',
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Qúy khách hãy sử dụng dịch vụ internet banking/ mobile banking của ngân hàng khác,'
                         'chọn chức năng chuyển tiền theo số tài khoản/ số thể và nhập dãy số bên dưới để chuyển tiền vào tài khoản VKU TNPay '
                         '(chọn ngân hàng thụ hưởng là Ngân hàng Quân đội MB, chi nhánh Điện Biên Phủ)',
                        style: TextStyle(
                            color: kTextColor.withOpacity(0.5),
                            fontSize: 12,
                            height: 1.4
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Container(
                          width: 280,
                          decoration: BoxDecoration(
                            border: Border.all(color: kTextColor.withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    '9704229 2003 4203 9145',
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.copy_rounded,
                                    color: kTextColor.withOpacity(0.3),
                                  ),
                                  onPressed: null)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.only(
                      top: 4,
                      bottom: 20,
                      right: 15,
                      left: 15
                  ),
                  decoration: BoxDecoration(
                      color: kTextWhiteColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Liên kết với nguồn tiền',
                            style: TextStyle(
                                color: kTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: kTextColor.withOpacity(0.5),
                                size: 16,
                              ),
                              onPressed: null)
                        ],
                      ),
                      Align(
                        child: Text(
                          'Liên kết với thẻ ATM nội địa/ tài khoản ngân hàng của 34 ngân hàng trong nước để nạp tiền dễ dàng hơn',
                          style: TextStyle(
                            color: kTextColor.withOpacity(0.5),
                            fontSize: 12,
                            height: 1.3
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
