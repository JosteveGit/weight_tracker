import 'package:flutter/material.dart';
import 'package:weight_tracker/core/models/weight_details.dart';
import 'package:weight_tracker/pages/history_page.dart';
import 'package:weight_tracker/pages/splash_page.dart';
import 'package:weight_tracker/services/authentication/authentication_service.dart';
import 'package:weight_tracker/services/weight/weight_service.dart';
import 'package:weight_tracker/utils/functions/date_utils.dart';
import 'package:weight_tracker/utils/functions/dev_utils.dart';
import 'package:weight_tracker/utils/functions/dialog_utils.dart';
import 'package:weight_tracker/utils/navigation/navigator.dart';
import 'package:weight_tracker/utils/styles/colour_utils.dart';
import 'package:weight_tracker/utils/widgets/bg.dart';
import 'package:weight_tracker/utils/widgets/dashboard_item.dart';
import 'package:weight_tracker/utils/widgets/logo.dart';
import 'package:weight_tracker/utils/widgets/w_loader.dart';

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
                        Expanded(
                          child: StreamBuilder<List<WeightDetails>>(
                            stream: WeightService.streamWeights(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(child: WLoader(size: 50));
                              }
                        
                              final List<WeightDetails> weights = snapshot.data;
                        
                              if (weights.isEmpty) {
                                return Center(
                                  child: Text(
                                    "No weight data yet",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              }
                        
                              WeightDetails firstWeight = weights.first;
                        
                              return Container(
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
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${firstWeight.weight}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 400 / firstWeight.weight.toString().length,
                                          ),
                                        ),
                                        Text(
                                          "kg",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      formatDate(
                                        firstWeight.dateAdded,
                                        false,
                                      ),
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
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
                        onTap: () async{
                          showLoader(context);
                          await AuthenticationService.signOut();
                          pop(context);
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
        ],
      ),
    );
  }
}
