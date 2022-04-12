import 'package:flutter/material.dart';
import 'package:lipid/presentation/theme/design_systems.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final bool back;
  final dynamic icon;
  final bool isLoading;
  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.back = true,
      this.icon,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: back
                  ? null
                  : Border.all(
                      color: kPrimaryColorOne,
                      width: 1.0,
                    ),
              color: back ? kPrimaryColorOne : Colors.white,
              borderRadius: BorderRadius.circular(8)),
          width: MediaQuery.of(context).size.width - (35 * 2),
          height: 56,
          child: (icon is IconData || icon is String)
              ? Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: kPrimaryColorOne,
                              strokeWidth: 2.0,
                            ),
                          )
                        : Container(),
                    isLoading
                        ? const SizedBox(
                            width: 20,
                          )
                        : Container(),
                    icon is IconData
                        ? Icon(icon,
                            size: 40,
                            color: back ? Colors.white : kPrimaryColorOne)
                        : const SizedBox(),
                    icon is String ? Image.asset(icon) : const SizedBox(),
                    const SizedBox(
                      width: 17,
                    ),
                    Text(text,
                        style: kLinkMedium.copyWith(
                            color: back ? Colors.white : kPrimaryColorOne)),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.0,
                            ),
                          )
                        : Container(),
                    isLoading
                        ? const SizedBox(
                            width: 20,
                          )
                        : Container(),
                    Text(text,
                        style: kLinkMedium.copyWith(
                            color: back ? Colors.white : kPrimaryColorOne)),
                  ],
                ),
        ));
  }
}
