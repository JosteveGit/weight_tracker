import 'package:flutter/material.dart';
import 'package:weight_tracker/core/models/weight_details.dart';
import 'package:weight_tracker/services/weight/weight_service.dart';
import 'package:weight_tracker/utils/styles/colour_utils.dart';
import 'package:weight_tracker/utils/widgets/bg.dart';
import 'package:weight_tracker/utils/widgets/history_item.dart';
import 'package:weight_tracker/utils/widgets/w_back_button.dart';
import 'package:weight_tracker/utils/widgets/w_loader.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.4,
            child: BG(),
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WBackButton(),
                  SizedBox(height: 10),
                  Text(
                    "History",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: baseColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: StreamBuilder<Object>(
                        stream: WeightService.streamWeights(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return WLoader(size: 50);
                          }

                          List<WeightDetails> weights = snapshot.data;

                          if (weights.isEmpty) {
                            return Center(
                              child: Text(
                                "No weight data yet",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }

                          return SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: List.generate(
                                  weights.length,
                                  (index) {
                                    return HistoryItem(
                                      weightDetails: weights[index],
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
