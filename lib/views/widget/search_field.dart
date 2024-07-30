import 'package:flutter/material.dart';
import 'package:meta_clinic/utils/colors_const.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search',
          isDense: true,
          suffixIcon: Container(
            decoration: BoxDecoration(
              color: ConstColors.lightBlueColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.search,
              size: 30,
              color: ConstColors.whiteColor,
            ),
          ),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          errorBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
