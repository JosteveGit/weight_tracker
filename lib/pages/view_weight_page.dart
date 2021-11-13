import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weight_tracker/utils/widgets/bg.dart';
import 'package:weight_tracker/utils/widgets/custom_button.dart';
import 'package:weight_tracker/utils/widgets/w_back_button.dart';

class ViewWeightPage extends StatefulWidget {
  const ViewWeightPage({Key key}) : super(key: key);

  @override
  _ViewWeightPageState createState() => _ViewWeightPageState();
}

class _ViewWeightPageState extends State<ViewWeightPage> {
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
                    "Weight Details",
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
                    controller: TextEditingController(text: "40.3"),
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
                    text: "Delete",
                    expanded: true,
                    color: Colors.red,
                    onPressed: () {},
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Text(
                      "12 Nov 2021, 4:40",
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

  FocusNode node = FocusNode();
}
