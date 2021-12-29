import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const OutlineButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: const StadiumBorder(),
          side: BorderSide(
              width: 1.0, color: Theme.of(context).primaryColorLight),
          backgroundColor: Theme.of(context).cardColor,
          shadowColor: Theme.of(context).primaryColor.withOpacity(0.2),
        ),
        // ButtonStyle(
        //   backgroundColor: MaterialStateProperty.all<Color>(
        //     Theme.of(context).cardColor,
        //   ),
        //   shadowColor: MaterialStateProperty.all<Color>(
        //     Theme.of(context).primaryColor.withOpacity(0.2),
        //   ),
        //   // [
        //   //   BoxShadow(
        //   //       color: Theme.of(context)
        //   //           .primaryColor
        //   //           .withOpacity(0.2),
        //   //       blurRadius: 40,
        //   //       spreadRadius: 10),
        //   // ],
        //   shape: MaterialStateProperty.all(
        //     RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(18.0),
        //     ),
        //   ),
        // ),
        child: Center(
          child: AutoSizeText(
            text,
            maxLines: 1,
            minFontSize: 5,
            maxFontSize: 20,
          ),
        ),
      ),
    );
  }
}
