import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/services/map_service.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/views/widget/toast.dart';

class ScanSuccessView extends ConsumerStatefulWidget {
  ScanSuccessView({required this.scanValue, super.key});

  String scanValue;

  @override
  ConsumerState createState() => _ScanSuccessViewState();
}

class _ScanSuccessViewState extends ConsumerState<ScanSuccessView> {
  @override
  void initState() {
    ref.read(mapServiceProvider).getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mapService = ref.watch(mapServiceProvider);

    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              size: 120,
              color: ConstColors.green,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Scan Successfully',
                style: TextStyle(
                    color: ConstColors.green,
                    fontWeight: FontWeight.w700,
                    fontSize: 22),
              ),
            ),
            Text(
              '${widget.scanValue}',
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 22),
            ),
            const Text(
              'Please select delivery type from the below list and submit',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ConstColors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: Get.width * 0.6,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: ConstColors.green,
                  side: const BorderSide(color: ConstColors.green),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () async {
                  ShowToast.msg("Please enable Location");
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
