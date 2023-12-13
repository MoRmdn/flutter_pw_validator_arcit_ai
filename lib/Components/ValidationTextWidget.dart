import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/Utilities/SizeConfig.dart';

/// ValidationTextWidget that represent style of each one of them and shows as list of condition that you want to the app user
class ValidationTextWidget extends StatelessWidget {
  final Color color;
  final String text;
  final int? value;
  final bool? showSuccessIcon;
  final bool? showFailureIcon;
  final Widget? successIcon, failureIcon;

  ValidationTextWidget({
    required this.color,
    required this.text,
    required this.value,
    this.showSuccessIcon,
    this.showFailureIcon,
    this.successIcon,
    this.failureIcon,
  });

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: [
        new Container(
          child: new CircleAvatar(
            radius: 3,
            backgroundColor: color,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.width! * 0.03),
          child: new Text(
            text.replaceFirst("-", value.toString()),
            style:
                new TextStyle(fontSize: SizeConfig.width! * 0.04, color: color),
          ),
        ),

        /// If showSuccessIcon is true then show successIcon else show failureIcon
        /// If showSuccessIcon and showFailureIcon is null then show nothing

        if (showSuccessIcon == true && successIcon != null) successIcon!,

        if (showFailureIcon == true && failureIcon != null) failureIcon!,
      ],
    );
  }
}
