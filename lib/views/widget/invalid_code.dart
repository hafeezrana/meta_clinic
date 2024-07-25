import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorQrScreen extends StatelessWidget {
  ErrorQrScreen({required this.valid, super.key});
  bool valid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AlertDialog(
            title: !valid
                ? const Center(
                    child: Text(
                      "Invalid Code!",
                    ),
                  )
                : const Icon(
                    Icons.cancel,
                    size: 100,
                    color: Colors.red,
                  ),
            // titleTextStyle:
            // MyTextStyles.largeText.copyWith(color: ConstColors.redColor),
            titlePadding: const EdgeInsets.symmetric(vertical: 20),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Center(
                child: Text(!valid
                    ? "Scanned code is invalid."
                    : "Scanned code not found"),
              ),
            ),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actionsPadding: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            // contentTextStyle: MyTextStyles.mediumText
            //     .copyWith(color: ConstColors.greyColor2),
            actions: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Exit"),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Re-Scan"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
