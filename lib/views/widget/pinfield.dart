import 'package:flutter/material.dart';
import 'package:meta_clinic/utils/colors_const.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ReusablePinCodeField extends StatelessWidget {
  ReusablePinCodeField({
    this.pinFieldController,
    this.onCompleted,
    super.key,
  });

  TextEditingController? pinFieldController;
  void Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: PinCodeTextField(
        length: 5,
        obscureText: false,
        animationType: AnimationType.fade,
        keyboardType: TextInputType.number,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 50,
          fieldWidth: 50,
          inactiveColor: Colors.grey[400],
          activeColor: ConstColors.whiteColor,
          inactiveFillColor: Colors.white,
          disabledColor: Colors.white,
          selectedFillColor: Colors.orange,
          activeFillColor: Colors.white,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        enableActiveFill: true,
        // errorAnimationController:
        // errorController,
        controller: pinFieldController,
        onCompleted: onCompleted,
        onChanged: (e) {},
        beforeTextPaste: (text) {
          print("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
        appContext: context,
      ),
    );
  }
}
