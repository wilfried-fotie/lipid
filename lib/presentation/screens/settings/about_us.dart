import 'package:flutter/material.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:lipid/presentation/widgets/custom_button.dart';
import 'package:lipid/presentation/widgets/custom_input.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final TextEditingController name =
      TextEditingController(text: "Maximum prime");
  final TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About us",
            style: kLinkSmall.copyWith(color: kPrimaryColorOne)),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
