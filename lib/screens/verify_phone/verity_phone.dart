import 'package:flutter/material.dart';
import 'package:money_mobile/controllers/VetifyPhoneProvider.dart';
import 'package:money_mobile/until/constants.dart';
import 'package:provider/provider.dart';

import 'components/app_bar.dart';
import 'components/build_code_number_box.dart';
import 'components/numeric_pad.dart';

class VerifyPhone extends StatefulWidget {

  final String phoneNumber;

  VerifyPhone({@required this.phoneNumber});

  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VertifyPhoneProvider>(
      create: (context) => VertifyPhoneProvider(),
          child: Scaffold(
         appBar: buildAppBar(),
         body: SafeArea(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          "Code is sent to " + widget.phoneNumber,
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF818181),
                          ),
                        ),
                      ),

                      Expanded(
                        child: Consumer<VertifyPhoneProvider>(
                          builder: (context, model, child){
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                buildCodeNumberBox(model.getCode.length > 0 ? model.getCode.substring(0, 1) : ""),
                                buildCodeNumberBox(model.getCode.length > 1 ? model.getCode.substring(1, 2) : ""),
                                buildCodeNumberBox(model.getCode.length > 2 ? model.getCode.substring(2, 3) : ""),
                                buildCodeNumberBox(model.getCode.length > 3 ? model.getCode.substring(3, 4) : ""),
                              ],
                            );
                          },
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            
                            Text(
                              "Didn't recieve code? ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF818181),
                              ),
                            ),
                            
                            SizedBox(
                              width: 8,
                            ),

                            GestureDetector(
                              onTap: () {
                                print("Resend the code to the user");
                              },
                              child: Text(
                                "Request again",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height * 0.09,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: MaterialButton(
                  onPressed: () {
                    print('hello mima');
                  },
                  elevation: 0,
                  minWidth: double.infinity,
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kDefaultBorder)
                  ),
                  child: Text(
                    'Xác thực',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kTextWhiteColor,
                      fontSize: kDedaultFontSize
                    )
                  ),
                )
              ),

             Consumer<VertifyPhoneProvider>(
              builder: (context, model, child) {
                return NumericPad(
                  onNumberSelected: (value) {
                    model.setCodeNumber = value;
                  },
              );
              }
            ),
              
            ],
          )
         ),
      ),
    );
  }

  

}