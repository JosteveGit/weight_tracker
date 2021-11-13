import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weight_tracker/utils/widgets/bg.dart';
import 'package:weight_tracker/utils/widgets/custom_button.dart';
import 'package:weight_tracker/utils/widgets/w_back_button.dart';

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
                  TextField(
                    focusNode: node,
                    cursorWidth: 0.0,
                    cursorHeight: 0.0,
                    inputFormatters: [LengthLimitingTextInputFormatter(5)],
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                      signed: false,
                    ),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration.collapsed(
                      hintText: "30.2",
                    ),
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
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
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  FocusNode node = FocusNode();
}
