import 'package:flutter/material.dart';
import 'package:weight_tracker/core/models/weight_details.dart';
import 'package:weight_tracker/pages/view_weight_page.dart';
import 'package:weight_tracker/utils/functions/date_utils.dart';
import 'package:weight_tracker/utils/navigation/navigator.dart';
import 'package:weight_tracker/utils/styles/colour_utils.dart';

class HistoryItem extends StatelessWidget {
  final WeightDetails weightDetails;
  const HistoryItem({
    Key key,
    this.weightDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(
          context,
          ViewWeightPage(
            weightDetails: weightDetails,
          ),
        );
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "${weightDetails.weight} ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, 1),
                        child: Text(
                          "kg",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${formatDate(weightDetails.dateAdded)}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 13,
                )
              ],
            ),
            SizedBox(height: 3),
            Divider(
              color: white.withOpacity(0.5),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
