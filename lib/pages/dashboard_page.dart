import 'package:flutter/material.dart';
import 'package:weight_tracker/pages/history_page.dart';
import 'package:weight_tracker/pages/splash_page.dart';
import 'package:weight_tracker/utils/functions/dev_utils.dart';
import 'package:weight_tracker/utils/navigation/navigator.dart';
import 'package:weight_tracker/utils/styles/colour_utils.dart';
import 'package:weight_tracker/utils/widgets/bg.dart';
import 'package:weight_tracker/utils/widgets/dashboard_item.dart';
import 'package:weight_tracker/utils/widgets/logo.dart';

import 'add_weight_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.white);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.4,
            child: BG(),
          ),
          SafeArea(
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Logo(
                            size: 50,
                          ),
                          Spacer(),
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  "Current Weight",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "82.2",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 100,
                                      ),
                                    ),
                                    Transform.translate(
                                      offset: Offset(0, -14),
                                      child: Text(
                                        "kg",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "1 January 2021",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        DashboardItem(
                          icon: Icons.add_rounded,
                          subText: "Add new weight on a date",
                          mainText: "Add",
                          color: Colors.blue.withOpacity(0.2),
                          onTap: () {
                            pushTo(context, AddWeightPage());
                          },
                        ),
                        DashboardItem(
                          icon: Icons.history_outlined,
                          subText: "View weights entered over time",
                          mainText: "History",
                          onTap: () {
                            pushTo(context, HistoryPage());
                          },
                        ),
                        DashboardItem(
                          icon: Icons.exit_to_app_rounded,
                          subText: "It's not bye bye, come back.",
                          mainText: "Sign Out",
                          onTap: () {
                            pushToAndClearStack(context, SplashPage());
                          },
                          color: Colors.red.withOpacity(0.2),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
