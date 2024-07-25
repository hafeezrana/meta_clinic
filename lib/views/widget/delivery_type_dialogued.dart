// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get.dart';
// import 'package:mis/model/delivery_item.dart';
// import 'package:mis/model/delivery_type.dart';
// import 'package:mis/repository/adts_repository.dart';
// import 'package:mis/ui/dashboard/btm_nav_view.dart';
// import 'package:mis/ui/dashboard/idts/idts_home.dart';
// import 'package:mis/ui/widget/toast.dart';
// import 'package:mis/utils/app_preferences.dart';
// import 'package:mis/utils/colors_const.dart';
// import 'package:mis/utils/navigation.dart';
// import 'package:provider/provider.dart';
//
// class DeliveryTypeDialogue {
//   DeliveryType? selectedType;
//
//   openDialogue(Map<String, dynamic> scannedData, WidgetRef ref) {
//     return showDialog(
//       context: Get.context!,
//       builder: (cont) {
//         return StatefulBuilder(builder: (context, dialogueState) {
//           return AlertDialog(
//             backgroundColor: ConstColors.blueColor,
//             title: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 padding: const EdgeInsets.all(0),
//                 decoration:
//                     BoxDecoration(borderRadius: BorderRadius.circular(6)),
//                 child: Text(
//                   'You are about to finish the scan process',
//                   // style: MyTextStyles.largeText
//                   //     .copyWith(color: ConstColors.blackColor),
//                   textAlign: TextAlign.justify,
//                 ),
//               ),
//             ),
//             content: Container(
//               width: MediaQuery.of(context).size.width * 0.7,
//               height: MediaQuery.of(context).size.height * 0.4,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: ConstColors.whiteColor,
//                 boxShadow: const [
//                   BoxShadow(
//                     offset: Offset(0, 1),
//                     blurRadius: 3,
//                     spreadRadius: 1,
//                     color: Colors.grey,
//                   ),
//                 ],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: ListView(
//                   children: [
//                     DropdownButtonHideUnderline(
//                       child: ButtonTheme(
//                         alignedDropdown: true,
//                         child: DropdownButton<DeliveryType>(
//                           value: selectedType,
//                           hint: const Text('Choose Delivery Types'),
//                           isDense: true,
//                           // dropdownStyleData: DropdownStyleData(maxHeight: 250.h),
//                           isExpanded: true,
//                           items: ref
//                               .read(adtsProvider)
//                               .deliveryTypes
//                               .map<DropdownMenuItem<DeliveryType>>(
//                                 (value) => DropdownMenuItem<DeliveryType>(
//                                   value: value,
//                                   child:
//                                       // cr.isLoading
//                                       //     ? const SizedBox(
//                                       //         height: 30,
//                                       //         width: 30,
//                                       //         child: CircularProgressIndicator(),
//                                       //       )
//                                       //     :
//                                       Text(
//                                     "${value.deliveryType ?? ''}",
//                                     // style: MyTextStyles.smallText
//                                     //     .copyWith(color: ConstColors.greyColor2),
//                                   ),
//                                 ),
//                               )
//                               .toList(),
//                           onChanged: (value) {
//                             selectedType = value;
//                             dialogueState(() => {});
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             actionsAlignment: MainAxisAlignment.spaceAround,
//             actions: [
//               TextButton(
//                 style: TextButton.styleFrom(
//                   backgroundColor: ConstColors.green,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(
//                       4,
//                     ),
//                   ),
//                 ),
//                 onPressed: () {
//                   Appnav.pushAndRemoveUntil(context, IdtsHomeView());
//                 },
//                 child: Text(
//                   'Cancel',
//                   // style: MyTextStyles.mediumText
//                   //     .copyWith(color: ConstColors.whiteColor),
//                 ),
//               ),
//               TextButton(
//                 style: TextButton.styleFrom(
//                   backgroundColor: ConstColors.green,
//                   side: const BorderSide(color: ConstColors.green),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                 ),
//                 onPressed: () async {
//                   List<DeliveryItem> deliveryItems =
//                       ref.read(adtsProvider).getScannedList();
//                   if (selectedType != null) {
//                     scannedData['Delivery_Type'] = selectedType!.deliveryType;
//
//                     final item = DeliveryItem.fromJson(scannedData);
//
//                     deliveryItems.add(item);
//                     List<String> list =
//                         deliveryItems.map((e) => jsonEncode(e)).toList();
//                     print("list: $list");
//
//                     await AppPreferences.setStringList(
//                         AppPreferences.adtsScannedList, list);
//                     Appnav.pushAndRemoveUntil(context, BottomNavBarView());
//                   } else {
//                     ShowToast.msg("Please select DeliveryType");
//                   }
//                 },
//                 child:
//                     // tr.isLoading
//                     //     ? const SizedBox(
//                     //         height: 25,
//                     //         width: 25,
//                     //         child: CircularProgressIndicator(
//                     //           color: ConstColors.whiteColor,
//                     //         ),
//                     //       )
//                     //     :
//                     Text(
//                   'Finish',
//                   // style: MyTextStyles.mediumText
//                   //     .copyWith(color: ConstColors.whiteColor),
//                 ),
//               ),
//             ],
//           );
//         });
//       },
//     );
//   }
// }
