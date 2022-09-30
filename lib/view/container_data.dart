import 'package:flutter/material.dart';

class InputData extends StatefulWidget {
 final String body;
  const InputData({Key? key, required this.body}) : super(key: key);

  @override
  State<InputData> createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.body),
      ),
    );
  }
}
