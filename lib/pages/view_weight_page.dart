import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weight_tracker/core/models/weight_details.dart';
import 'package:weight_tracker/services/weight/weight_service.dart';
import 'package:weight_tracker/utils/functions/date_utils.dart';
import 'package:weight_tracker/utils/functions/dialog_utils.dart';
import 'package:weight_tracker/utils/navigation/navigator.dart';
import 'package:weight_tracker/utils/widgets/bg.dart';
import 'package:weight_tracker/utils/widgets/custom_button.dart';
import 'package:weight_tracker/utils/widgets/w_back_button.dart';
import 'package:weight_tracker/utils/widgets/weight_text_field.dart';

class ViewWeightPage extends StatefulWidget {
  final WeightDetails weightDetails;
  const ViewWeightPage({Key key, this.weightDetails}) : super(key: key);

  @override
  _ViewWeightPageState createState() => _ViewWeightPageState();
}

class _ViewWeightPageState extends State<ViewWeightPage> {
  @override
  void initState() {
    node.requestFocus();
    _weightDetails = widget.weightDetails;
    weight = _weightDetails.weight.toString();
    text = TextEditingController(text: weight);
    super.initState();
  }

  WeightDetails _weightDetails;

  TextEditingController text;

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WBackButton(),
                  SizedBox(height: 10),
                  Text(
                    "Weight Details",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  WeightTextField(
                    node: node,
                    controller: text,
                    onChanged: (v) {
                      setState(() {
                        weight = v;
                      });
                    },
                  ),
                  Center(
                    child: Text(
                      "kg",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Spacer(),
                  CustomButton(
                    text: canDelete() ? "Delete" : "Edit",
                    expanded: true,
                    color: canDelete() ? Colors.red : Colors.blue,
                    onPressed: action,
                    validator: () {
                      if (weight.isEmpty) {
                        return false;
                      }
                      try {
                        double.parse(weight);
                        return true;
                      } catch (e) {
                        return false;
                      }
                    },
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Text(
                      formatDate(_weightDetails.dateAdded),
                      style: TextStyle(fontWeight: FontWeight.w600),
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

  bool canDelete() {
    if (weight.isEmpty) {
      return false;
    }
    try {
      return double.parse(weight) == _weightDetails.weight;
    } catch (e) {
      return false;
    }
  }

  String weight = "";

  void action() async {
    double newWeight = double.parse(weight);
    showLoader(context);
    String actionCompleted = "Deleted successfully";
    if (newWeight == _weightDetails.weight) {
      //Delete
      await WeightService.deleteWeight(id: _weightDetails.id);
    } else {
      //Update
      await WeightService.updateWeight(
        weight: WeightDetails(
          id: _weightDetails.id,
          weight: newWeight,
          dateAdded: _weightDetails.dateAdded,
          modifications: _weightDetails.modifications..add({
            "date": DateTime.now().toString(),
            "oldWeight": _weightDetails.weight,
            "newWeight": newWeight,
          }),
        ),
      );
      actionCompleted = "Updated successfully"; 
    }
    pop(context);
    print(actionCompleted);
  }

  FocusNode node = FocusNode();
}
