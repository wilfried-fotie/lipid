import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Image.asset("assets/img/succes.png"),
          ),
          const Text("Your subscription for 12 month Successfull")
        ],
      ),
    );
  }
}
