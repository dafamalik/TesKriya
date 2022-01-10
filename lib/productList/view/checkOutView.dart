import 'package:flutter/material.dart';

class CheckOutView extends StatefulWidget {

  @override
  _CheckOutViewState createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                    ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
