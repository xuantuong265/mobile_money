import 'package:flutter/material.dart';
import 'package:money_mobile/until/constants.dart';

import 'components/account_overview.dart';
import 'components/advertisement.dart';
import 'components/app_bar.dart';
import 'components/build_dot.dart';
import 'components/endow.dart';
import 'components/service_orther.dart';
import 'components/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    bool _pinned = true;
    bool _snap = false;
    bool _floating = true;

    return Scaffold(
          backgroundColor: kBackgroundColor,
          body: SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  pinned: _pinned,
                  snap: _snap,
                  floating: _floating,
                  automaticallyImplyLeading: false,
                  expandedHeight: size.height * 0.27,
                  elevation: 0,
                  title: TopTitle(),
                  flexibleSpace: FlexibleSpaceBar(
                    background: MyFlexiableAppBar(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: size.height * 0.15,
                    child: Stack(
                      children: [
                        Container(
                          height: size.height * 0.08,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)
                            )
                          ),
                        ),
                        Positioned(
                          top: -8,
                          right: 0,
                          left: 0,
                          child: AccountOverview(),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        ServicesOrther(size: size),
                        BuildDot(),
                        SizedBox(height: 15),
                        Advertisement(size: size),
                        SizedBox(height: 25),
                        BuildDot(),
                        SizedBox(height: 15),
                        Endow(size: size),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
  }
}

class MyFlexiableAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Services(size: size)
        ],
      ),
    );
  }
}













