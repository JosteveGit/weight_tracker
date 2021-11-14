import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weight_tracker/core/models/weight_details.dart';
import 'package:weight_tracker/services/weight/weight_service.dart';
import 'package:weight_tracker/utils/functions/dialog_utils.dart';
import 'package:weight_tracker/utils/navigation/navigator.dart';
import 'package:weight_tracker/utils/widgets/bg.dart';
import 'package:weight_tracker/utils/widgets/custom_button.dart';
import 'package:weight_tracker/utils/widgets/w_back_button.dart';
import 'package:weight_tracker/utils/widgets/weight_text_field.dart';

class AddWeightPage extends StatefulWidget {
  const AddWeightPage({Key key}) : super(key: key);

  @override
  _AddWeightPageState createState() => _AddWeightPageState();
}

class _AddWeightPageState extends State<AddWeightPage> {
  @override
  void initState() {
    node.requestFocus();
    super.initState();
  }

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
                    "Add Weight",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  WeightTextField(
                    node: node,
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
                    text: "Save",
                    expanded: true,
                    onPressed: save,
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String weight = "";

  FocusNode node = FocusNode();

  void save() async {
    showLoader(context);
    await WeightService.addWeight(
      weight: WeightDetails(
        weight: double.parse(weight),
        dateAdded: DateTime.now().toString(),
      ),
    );
    pop(context);
  }
}


